package it.gioelegentile.awesomepizza.order;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderStatusDto {

    @NotNull
    private OrderStatus status;

}
