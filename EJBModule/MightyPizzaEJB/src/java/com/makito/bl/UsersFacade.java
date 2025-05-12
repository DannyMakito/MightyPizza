/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.makito.bl;

import com.makito.entities.Users;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

/**
 *
 * @author USER
 */
@Stateless
public class UsersFacade extends AbstractFacade<Users> implements UsersFacadeLocal {

    @PersistenceContext(unitName = "MightyPizzaEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsersFacade() {
        super(Users.class);
    }

    @Override
    public String validateUser(String username, String password) {
      String url ="invalid.jsp";
      
      if( username.equals("admin") && password.equals("admin1"))
      {
          url="admin.jsp";
      }
      
      
      return url;
    }

    @Override
    public Users findUserbyname(String username)throws UserNotFoundException  {
        
        try {
            TypedQuery<Users> query = em.createQuery(
                "SELECT u FROM Users u WHERE u.username = :username", Users.class);
            query.setParameter("username", username);
            return query.getSingleResult();
        } catch (UserNotFoundException e) {
            throw new UserNotFoundException("User not found: " + username+" or inputs are not corrects");
        }
    }

    @Override
    public Boolean validUser(String name, String pass) {
        boolean valid = false;
        Users user = findUserbyname(name);
 
    if (user != null && user.getUsername().equals(name) && user.getPassword().equals(pass)) {
        return true;
    }
    return false;
    }
    
}
