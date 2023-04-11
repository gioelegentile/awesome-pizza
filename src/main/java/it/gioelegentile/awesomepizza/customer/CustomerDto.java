package it.gioelegentile.awesomepizza.customer;

import it.gioelegentile.awesomepizza.order.Order;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Null;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerDto {

    @Null
    private Long id;

    @NotBlank
    private String name;

    @Null
    private List<Order> orders;

}
