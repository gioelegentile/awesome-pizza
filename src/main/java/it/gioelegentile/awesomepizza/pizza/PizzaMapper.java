package it.gioelegentile.awesomepizza.pizza;

import org.mapstruct.Mapper;

@Mapper(
    componentModel = "spring"
)
public interface PizzaMapper {
    PizzaDto pizzaToPizzaDto(Pizza pizza);
    Pizza pizzaDtoToPizza(PizzaDto pizza);
}
