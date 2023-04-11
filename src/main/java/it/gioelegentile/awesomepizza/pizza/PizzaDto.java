package it.gioelegentile.awesomepizza.pizza;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Null;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PizzaDto {

    @Null
    private Long id;

    @NotBlank
    private String name;

}
