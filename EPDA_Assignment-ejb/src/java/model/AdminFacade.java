/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

/**
 *
 * @author ASUS
 */
@Stateless
public class AdminFacade extends AbstractFacade<Admin> {

    @PersistenceContext(unitName = "EPDA_Assignment-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AdminFacade() {
        super(Admin.class);
    }

    public List<Admin> findByValue(String searchValue) {
        TypedQuery<Admin> query;

        if (searchValue.equals("")) {
            query = em.createQuery("SELECT o FROM Admin o", Admin.class);
        } else {
            query = em.createQuery("SELECT o FROM Admin o WHERE LOWER(CONCAT(o.id, o.name, o.email, o.phone, o.gender, o.dob)) LIKE :searchValue", Admin.class);
            query.setParameter("searchValue", "%" + searchValue + "%");
        }

        return query.getResultList();
    }

}
