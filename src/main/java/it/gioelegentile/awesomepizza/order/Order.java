package it.gioelegentile.awesomepizza.order;

import it.gioelegentile.awesomepizza.customer.Customer;
import it.gioelegentile.awesomepizza.pizza.Pizza;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Data
@Entity
@Table(name = "ap_order")
@AllArgsConstructor
@RequiredArgsConstructor
public class Order {

    @GeneratedValue
    @Id
    private Long id;

    @Column(nullable = false)
    private LocalDateTime time;

    @ManyToMany
    private List<Pizza> pizzas;

    @OneToOne
    private Customer customer;

    @Column(nullable = false)
    private OrderStatus status;

}
