package it.gioelegentile.awesomepizza;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.zonky.test.db.AutoConfigureEmbeddedDatabase;
import it.gioelegentile.awesomepizza.customer.Customer;
import it.gioelegentile.awesomepizza.customer.CustomerDto;
import it.gioelegentile.awesomepizza.customer.CustomerRepository;
import it.gioelegentile.awesomepizza.order.*;
import it.gioelegentile.awesomepizza.pizza.Pizza;
import it.gioelegentile.awesomepizza.pizza.PizzaDto;
import it.gioelegentile.awesomepizza.pizza.PizzaRepository;
import org.jeasy.random.EasyRandom;
import org.jeasy.random.EasyRandomParameters;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.web.servlet.MockMvc;

import javax.sql.DataSource;
import java.time.LocalDateTime;
import java.util.List;

import static io.zonky.test.db.AutoConfigureEmbeddedDatabase.DatabaseProvider.ZONKY;
import static io.zonky.test.db.AutoConfigureEmbeddedDatabase.RefreshMode.BEFORE_EACH_TEST_METHOD;
import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Sql("/db_schema.sql")
@SpringBootTest
@AutoConfigureMockMvc
@AutoConfigureEmbeddedDatabase(provider = ZONKY, refresh = BEFORE_EACH_TEST_METHOD)
class AwesomePizzaIT {

    private final EasyRandom er = new EasyRandom(
        new EasyRandomParameters()
            .collectionSizeRange(3, 3)
            .randomizationDepth(2)
    );

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private DataSource dataSource;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private PizzaRepository pizzaRepository;

    @Test
    void as_a_Chef_I_want_to_see_the_orders_queue() throws Exception {

        final Pizza pizza1 = pizzaRepository.saveAndFlush(er.nextObject(Pizza.class));
        final Pizza pizza2 = pizzaRepository.saveAndFlush(er.nextObject(Pizza.class));

        final Customer customer1 = customerRepository.saveAndFlush(new Customer(1L, "customer1", null));
        final Customer customer2 = customerRepository.saveAndFlush(new Customer(2L, "customer2", null));

        final Order order1 = new Order(1L, LocalDateTime.now(), List.of(pizza1), customer1, OrderStatus.RECEIVED);
        final Order order2 = new Order(2L, LocalDateTime.now(), List.of(pizza2), customer2, OrderStatus.RECEIVED);
        final Order order3 = new Order(3L, LocalDateTime.now(), List.of(pizza2), customer1, OrderStatus.RECEIVED);
        final Order order4 = new Order(4L, LocalDateTime.now(), List.of(pizza1), customer2, OrderStatus.RECEIVED);

        orderRepository.saveAndFlush(order1);
        orderRepository.saveAndFlush(order2);
        orderRepository.saveAndFlush(order3);
        orderRepository.saveAndFlush(order4);

        mockMvc.perform(get("/orders"))
            .andExpect(status().is2xxSuccessful())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON))
            .andExpect(result -> {
                final List<Order> orders = objectMapper.readValue(result.getResponse().getContentAsString(), new TypeReference<List<Order>>() {
                });

                assertThat(orders.size()).isEqualTo(4);
                assertThat(orders.get(0))
                    .usingRecursiveComparison()
                    .ignoringFields("id", "time")
                    .isEqualTo(order1);
                assertThat(orders.get(1))
                    .usingRecursiveComparison()
                    .ignoringFields("id", "time")
                    .isEqualTo(order2);
                assertThat(orders.get(2))
                    .usingRecursiveComparison()
                    .ignoringFields("id", "time")
                    .isEqualTo(order3);
                assertThat(orders.get(3))
                    .usingRecursiveComparison()
                    .ignoringFields("id", "time")
                    .isEqualTo(order4);

            });

    }

    @Test
    void as_a_Chef_I_want_to_update_the_order_status() throws Exception {

        final Pizza pizza1 = pizzaRepository.saveAndFlush(er.nextObject(Pizza.class));
        final Customer customer = customerRepository.saveAndFlush(new Customer(null, "customer", null));
        final Order order = orderRepository.saveAndFlush(new Order(null, LocalDateTime.now(), List.of(pizza1), customer, OrderStatus.RECEIVED));

        mockMvc.perform(
                patch("/orders/" + order.getId() + "/status")
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(objectMapper.writeValueAsBytes(new OrderStatusDto(OrderStatus.COOKING)))
            )
            .andExpect(status().is2xxSuccessful())
            .andExpect(res ->
                {
                    final Order actual = objectMapper.readValue(res.getResponse().getContentAsString(), Order.class);

                    assertThat(actual.getPizzas())
                        .usingRecursiveComparison()
                        .ignoringFields("name")
                        .isEqualTo(List.of(pizza1));

                    assertThat(actual.getCustomer())
                        .usingRecursiveComparison()
                        .ignoringFields("name")
                        .isEqualTo(customer);

                    assertThat(actual.getStatus()).isEqualTo(OrderStatus.COOKING);

                }
            );

    }

    @Test
    void as_a_Customer_I_want_to_add_a_new_order() throws Exception {

        final Pizza pizza1 = pizzaRepository.saveAndFlush(er.nextObject(Pizza.class));
        final Pizza pizza2 = pizzaRepository.saveAndFlush(er.nextObject(Pizza.class));
        final Customer customer = customerRepository.saveAndFlush(new Customer(null, "customer", null));
        final OrderDto order = new OrderDto(
            null,
            LocalDateTime.now(),
            List.of(
                new PizzaDto(pizza1.getId(), null),
                new PizzaDto(pizza2.getId(), null)
            ),
            new CustomerDto(customer.getId(), null, null),
            null
        );

        mockMvc.perform(
                post("/orders")
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(objectMapper.writeValueAsBytes(order))
            )
            .andExpect(status().is2xxSuccessful())
            .andExpect(res ->
                {
                    final Order actual = objectMapper.readValue(res.getResponse().getContentAsString(), Order.class);

                    assertThat(actual.getPizzas())
                        .usingRecursiveComparison()
                        .ignoringFields("name")
                        .isEqualTo(List.of(pizza1, pizza2));

                    assertThat(actual.getCustomer())
                        .usingRecursiveComparison()
                        .ignoringFields("name")
                        .isEqualTo(customer);

                    assertThat(actual.getStatus()).isEqualTo(OrderStatus.RECEIVED);

                }
            );

    }

    @Test
    void as_a_Customer_I_want_to_get_the_order_status() throws Exception {

        final Pizza pizza1 = pizzaRepository.saveAndFlush(er.nextObject(Pizza.class));
        final Customer customer = customerRepository.saveAndFlush(new Customer(null, "customer", null));
        final Order order = orderRepository.saveAndFlush(new Order(null, LocalDateTime.now(), List.of(pizza1), customer, OrderStatus.RECEIVED));

        mockMvc.perform(
                get("/orders/" + order.getId() + "/status")
            )
            .andExpect(status().is2xxSuccessful())
            .andExpect(res ->
                {
                    final Order actual = objectMapper.readValue(res.getResponse().getContentAsString(), Order.class);

                    assertThat(actual.getPizzas())
                        .usingRecursiveComparison()
                        .ignoringFields("name")
                        .isEqualTo(List.of(pizza1));

                    assertThat(actual.getCustomer())
                        .usingRecursiveComparison()
                        .ignoringFields("name")
                        .isEqualTo(customer);

                    assertThat(actual.getStatus()).isEqualTo(OrderStatus.RECEIVED);

                }
            );

    }

}
