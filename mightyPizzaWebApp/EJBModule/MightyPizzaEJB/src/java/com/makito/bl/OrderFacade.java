/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.makito.bl;

import com.makito.entities.Order;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author USER
 */
@Stateless
public class OrderFacade extends AbstractFacade<Order> implements OrderFacadeLocal {

    @PersistenceContext(unitName = "MightyPizzaEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OrderFacade() {
        super(Order.class);
    }

   

    @Override
    public Double totalPrice(Double price, String size) {
        
        Double np = 00.00;
        if(size.equals("large")){
            np = price+30.00;
        }else{
            np=price;
        }
        
        return np;
    }
    
}
