package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Customer;
import model.Owner;
import model.Sales;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2023-07-24T02:17:31")
@StaticMetamodel(Rating.class)
public class Rating_ { 

    public static volatile SingularAttribute<Rating, Owner> owner;
    public static volatile SingularAttribute<Rating, Customer> cus;
    public static volatile SingularAttribute<Rating, Integer> cus_rating;
    public static volatile SingularAttribute<Rating, String> cus_comments;
    public static volatile SingularAttribute<Rating, String> owner_comments;
    public static volatile SingularAttribute<Rating, Integer> owner_rating;
    public static volatile SingularAttribute<Rating, Long> id;
    public static volatile SingularAttribute<Rating, Sales> sales;

}