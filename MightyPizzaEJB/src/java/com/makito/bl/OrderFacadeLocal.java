/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.makito.bl;

import com.makito.entities.Order;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author USER
 */
@Local
public interface OrderFacadeLocal {

    void create(Order order);

    void edit(Order order);

    void remove(Order order);

    Order find(Object id);

    List<Order> findAll();

    List<Order> findRange(int[] range);

    int count();
    
    Double totalPrice(Double price,String size);
    
}
