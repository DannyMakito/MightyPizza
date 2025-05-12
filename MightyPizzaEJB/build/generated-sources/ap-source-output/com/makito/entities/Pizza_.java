package com.makito.entities;

import com.makito.entities.Image;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2025-05-12T00:07:56")
@StaticMetamodel(Pizza.class)
public class Pizza_ { 

    public static volatile ListAttribute<Pizza, Image> image;
    public static volatile SingularAttribute<Pizza, Double> price;
    public static volatile SingularAttribute<Pizza, String> name;
    public static volatile SingularAttribute<Pizza, String> description;
    public static volatile SingularAttribute<Pizza, Long> id;

}