package it.gioelegentile.awesomepizza.order;

import org.jeasy.random.EasyRandom;
import org.jeasy.random.EasyRandomParameters;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Spy;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class OrderServiceTest {

    private final EasyRandom er = new EasyRandom(
        new EasyRandomParameters()
            .collectionSizeRange(3, 3)
            .randomizationDepth(2)
    );
    @InjectMocks
    private OrderService sut;
    @Mock
    private OrderRepository orderRepository;
    @Spy
    private OrderMapperImpl dtoMapper;

    @Test
    void getOrders() {

        when(orderRepository.findOrdersByOrderByTimeAsc())
            .thenReturn(er.objects(Order.class, 3).collect(Collectors.toList()));

        final List<OrderDto> result = sut.getOrders();

        verify(orderRepository).findOrdersByOrderByTimeAsc();
        verify(dtoMapper, times(3)).orderToOrderDto(any(Order.class));

        assertThat(result).asList().hasSize(3);

    }

    @Test
    void createOrder() {

        final OrderDto input = er.nextObject(OrderDto.class);

        when(orderRepository.saveAndFlush(any(Order.class)))
            .thenReturn(er.nextObject(Order.class));

        sut.createOrder(input);

        verify(dtoMapper).orderDtoToOrder(eq(input));
        verify(dtoMapper).orderToOrderDto(any(Order.class));

    }

    @Test
    void updateOrderStatus_should_throw_when_theres_an_already_cooking_order() {

        final OrderStatusDto input = er.nextObject(OrderStatusDto.class);

        when(orderRepository.findAllByStatusIs(eq(OrderStatus.COOKING)))
            .thenReturn(er.objects(Order.class, 3).collect(Collectors.toList()));

        assertThrows(IllegalArgumentException.class, () -> sut.updateOrderStatus(123L, input));

        verify(orderRepository).findAllByStatusIs(eq(OrderStatus.COOKING));
        verify(orderRepository, never()).findById(anyLong());
        verify(orderRepository, never()).saveAndFlush(any());
        verify(dtoMapper, never()).orderToOrderDto(any());

    }

    @Test
    void updateOrderStatus_should_update_the_status_of_the_order() {

        final OrderStatusDto input = er.nextObject(OrderStatusDto.class);

        when(orderRepository.findAllByStatusIs(eq(OrderStatus.COOKING)))
            .thenReturn(Collections.emptyList());
        when(orderRepository.findById(eq(123L)))
            .thenReturn(Optional.of(er.nextObject(Order.class)));
        when(orderRepository.saveAndFlush(any(Order.class)))
            .thenReturn(er.nextObject(Order.class));

        sut.updateOrderStatus(123L, input);

        verify(orderRepository).findAllByStatusIs(eq(OrderStatus.COOKING));
        verify(orderRepository).findById(anyLong());
        verify(orderRepository).saveAndFlush(any());
        verify(dtoMapper).orderToOrderDto(any());

    }

    @Test
    void getOrderStatus() {
        when(orderRepository.findById(eq(123L)))
            .thenReturn(Optional.of(er.nextObject(Order.class)));
        when(orderRepository.saveAndFlush(any(Order.class)))
            .thenReturn(er.nextObject(Order.class));

        sut.getOrderStatus(123L);

        verify(orderRepository).findById(anyLong());
        verify(orderRepository).saveAndFlush(any());
        verify(dtoMapper).orderToOrderDto(any());
    }
}