package it.gioelegentile.awesomepizza.pizza;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@Table(name = "ap_pizza")
@AllArgsConstructor
@RequiredArgsConstructor
public class Pizza {

    @Id
    @GeneratedValue
    private Long id;

    @Column(nullable = false, length = 100)
    private String name;

}
