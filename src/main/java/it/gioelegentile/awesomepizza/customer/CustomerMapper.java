package it.gioelegentile.awesomepizza.customer;

import org.mapstruct.Mapper;

@Mapper(
    componentModel = "spring"
)
public interface CustomerMapper {
    CustomerDto customerToCustomerDto(Customer customer);
    Customer customerDtoToCustomer(CustomerDto customer);
}
