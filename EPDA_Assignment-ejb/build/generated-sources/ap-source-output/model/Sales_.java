package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Customer;
import model.Owner;
import model.Property;
import model.Rating;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2023-07-24T02:17:31")
@StaticMetamodel(Sales.class)
public class Sales_ { 

    public static volatile SingularAttribute<Sales, Owner> owner;
    public static volatile SingularAttribute<Sales, String> trans_date;
    public static volatile SingularAttribute<Sales, String> payment_collected;
    public static volatile SingularAttribute<Sales, Property> property;
    public static volatile SingularAttribute<Sales, Rating> rating;
    public static volatile SingularAttribute<Sales, Long> id;
    public static volatile SingularAttribute<Sales, Customer> customer;
    public static volatile SingularAttribute<Sales, String> start_date;
    public static volatile SingularAttribute<Sales, String> trans_type;

}