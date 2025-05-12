/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.makito.bl;

import com.makito.entities.Pizza;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author USER
 */
@Stateless
public class PizzaFacade extends AbstractFacade<Pizza> implements PizzaFacadeLocal {

    @PersistenceContext(unitName = "MightyPizzaEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PizzaFacade() {
        super(Pizza.class);
    }
    
}
