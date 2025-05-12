/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Exception.java to edit this template
 */
package com.makito.bl;

import javax.ejb.EJBException;

/**
 *
 * @author USER
 */
public class UserNotFoundException extends EJBException{

    /**
     * Creates a new instance of <code>UserNotFoundException</code> without
     * detail message.
     */
    public UserNotFoundException() {
    }

  
    public UserNotFoundException(String msg) {
        super(msg);
    }
}
