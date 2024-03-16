package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Property;
import model.Rating;
import model.Sales;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2023-07-24T02:17:31")
@StaticMetamodel(Owner.class)
public class Owner_ { 

    public static volatile SingularAttribute<Owner, String> gender;
    public static volatile SingularAttribute<Owner, String> phone;
    public static volatile SingularAttribute<Owner, String> dob;
    public static volatile SingularAttribute<Owner, String> approval_status;
    public static volatile ListAttribute<Owner, Property> property;
    public static volatile SingularAttribute<Owner, Rating> rating;
    public static volatile SingularAttribute<Owner, String> name;
    public static volatile SingularAttribute<Owner, String> id;
    public static volatile ListAttribute<Owner, Sales> sales;
    public static volatile SingularAttribute<Owner, String> email;

}