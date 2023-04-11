package it.gioelegentile.awesomepizza.order;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class OrderService {

    private final OrderRepository orderRepository;
    private final OrderMapper dtoMapper;

    public List<OrderDto> getOrders() {
        return orderRepository
            .findOrdersByOrderByTimeAsc()
            .stream()
            .map(dtoMapper::orderToOrderDto)
            .collect(Collectors.toList());
    }

    public OrderDto createOrder(OrderDto order) {
        return dtoMapper.orderToOrderDto(
            orderRepository.saveAndFlush(
                dtoMapper.orderDtoToOrder(order)
            )
        );
    }

    public OrderDto updateOrderStatus(Long orderId, OrderStatusDto orderStatus) {

        final List<Order> cookingOrders = orderRepository.findAllByStatusIs(OrderStatus.COOKING);

        if (CollectionUtils.isEmpty(cookingOrders)) {
            return orderRepository.findById(orderId)
                .map(o -> {
                    o.setStatus(orderStatus.getStatus());
                    return dtoMapper.orderToOrderDto(orderRepository.saveAndFlush(o));
                })
                .orElseThrow(
                    () -> new IllegalArgumentException("Cannot find an order with id=" + orderId)
                );
        } else {
            throw new IllegalArgumentException("You can cook only one order at a time");
        }

    }

    public OrderDto getOrderStatus(Long orderId) {
        return orderRepository.findById(orderId)
            .map(o -> dtoMapper.orderToOrderDto(orderRepository.saveAndFlush(o)))
            .orElseThrow(
                () -> new IllegalArgumentException("Cannot find an order with id=" + orderId)
            );
    }

}
