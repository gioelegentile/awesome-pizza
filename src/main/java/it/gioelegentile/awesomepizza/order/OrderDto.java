package it.gioelegentile.awesomepizza.order;

import it.gioelegentile.awesomepizza.customer.CustomerDto;
import it.gioelegentile.awesomepizza.pizza.PizzaDto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import javax.validation.constraints.PastOrPresent;
import java.time.LocalDateTime;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDto {

    @Null
    private Long id;

    @NotNull
    @PastOrPresent
    private LocalDateTime time;

    @NotEmpty
    private List<PizzaDto> pizzas;

    @NotNull
    private CustomerDto customer;

    @Null
    private OrderStatus status;

}
