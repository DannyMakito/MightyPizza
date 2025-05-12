package com.makito.entities;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2025-05-12T00:07:56")
@StaticMetamodel(Order.class)
public class Order_ { 

    public static volatile SingularAttribute<Order, Date> date;
    public static volatile SingularAttribute<Order, String> address;
    public static volatile SingularAttribute<Order, String> orderedBy;
    public static volatile SingularAttribute<Order, String> size;
    public static volatile SingularAttribute<Order, Double> price;
    public static volatile SingularAttribute<Order, String> description;
    public static volatile SingularAttribute<Order, Long> id;
    public static volatile SingularAttribute<Order, String> pizzaName;
    public static volatile SingularAttribute<Order, String> base;

}