package it.gioelegentile.awesomepizza.order;

import lombok.Getter;

public enum OrderStatus {
    RECEIVED("RECEIVED"),
    COOKING("COOKING"),
    DELIVERED("DELIVERED");

    @Getter
    private final String status;

    OrderStatus(String status) {
        this.status = status;
    }

}
