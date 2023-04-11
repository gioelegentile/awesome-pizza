package it.gioelegentile.awesomepizza.order;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.util.List;

@RequiredArgsConstructor
@RestController
public class OrderController {

    private final OrderService orderService;

    @GetMapping(
        path = "/orders",
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    @ResponseStatus(HttpStatus.OK)
    public List<OrderDto> getOrders() {
        return orderService.getOrders();
    }

    @PostMapping(
        path = "/orders",
        produces = MediaType.APPLICATION_JSON_VALUE,
        consumes = MediaType.APPLICATION_JSON_VALUE
    )
    @ResponseStatus(HttpStatus.CREATED)
    public OrderDto enqueueOrder(@Valid @RequestBody OrderDto order) {
        return orderService.createOrder(order);
    }

    @PatchMapping(
        path = "/orders/{id}/status",
        produces = MediaType.APPLICATION_JSON_VALUE,
        consumes = MediaType.APPLICATION_JSON_VALUE
    )
    public OrderDto changeOrderStatus(
        @Valid @NotNull @PathVariable Long id,
        @Valid @RequestBody OrderStatusDto orderStatusDto
    ) {
        try {
            return orderService.updateOrderStatus(id, orderStatusDto);
        } catch (IllegalArgumentException e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
        }
    }

    @GetMapping(
        path = "/orders/{id}/status",
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    public OrderDto getOrderStatus(
        @Valid @NotNull @PathVariable Long id
    ) {
        try {
            return orderService.getOrderStatus(id);
        } catch (IllegalArgumentException e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
        }
    }

}
