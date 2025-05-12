/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.makito.bl;

import com.makito.entities.Pizza;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author USER
 */
@Local
public interface PizzaFacadeLocal {

    void create(Pizza pizza);

    void edit(Pizza pizza);

    void remove(Pizza pizza);

    Pizza find(Object id);

    List<Pizza> findAll();

    List<Pizza> findRange(int[] range);

    int count();
    
}
