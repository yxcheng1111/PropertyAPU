package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Owner;
import model.Sales;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2023-07-24T02:17:31")
@StaticMetamodel(Property.class)
public class Property_ { 

    public static volatile SingularAttribute<Property, String> furnishing;
    public static volatile SingularAttribute<Property, String> floor_size;
    public static volatile SingularAttribute<Property, String> rent_price;
    public static volatile SingularAttribute<Property, String> description;
    public static volatile SingularAttribute<Property, String> sale_price;
    public static volatile SingularAttribute<Property, Sales> sales;
    public static volatile SingularAttribute<Property, String> property_name;
    public static volatile SingularAttribute<Property, String> toilet_no;
    public static volatile SingularAttribute<Property, Owner> owner1;
    public static volatile SingularAttribute<Property, String> listed_date;
    public static volatile SingularAttribute<Property, String> property_type;
    public static volatile SingularAttribute<Property, String> room_no;
    public static volatile SingularAttribute<Property, String> location;
    public static volatile SingularAttribute<Property, Long> id;
    public static volatile SingularAttribute<Property, String> status;

}