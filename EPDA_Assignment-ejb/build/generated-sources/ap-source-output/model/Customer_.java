package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Rating;
import model.Sales;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2023-07-24T02:17:31")
@StaticMetamodel(Customer.class)
public class Customer_ { 

    public static volatile SingularAttribute<Customer, String> gender;
    public static volatile SingularAttribute<Customer, String> phone;
    public static volatile SingularAttribute<Customer, String> dob;
    public static volatile SingularAttribute<Customer, String> name;
    public static volatile SingularAttribute<Customer, Rating> rating;
    public static volatile SingularAttribute<Customer, String> id;
    public static volatile ListAttribute<Customer, Sales> sales;
    public static volatile SingularAttribute<Customer, String> email;

}