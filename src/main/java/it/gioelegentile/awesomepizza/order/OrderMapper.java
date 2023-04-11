package it.gioelegentile.awesomepizza.order;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(
    componentModel = "spring"
)
public interface OrderMapper {

    OrderDto orderToOrderDto(Order order);

    @Mapping(
        source = "status",
        target = "status",
        defaultValue = "RECEIVED"
    )
    Order orderDtoToOrder(OrderDto order);

}
