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
public class RatingFacade extends AbstractFacade<Rating> {

    @PersistenceContext(unitName = "EPDA_Assignment-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public RatingFacade() {
        super(Rating.class);
    }

    public List<Rating> findPendingByCusAndRent(String username) {
        TypedQuery<Rating> query = em.createQuery("SELECT r FROM Rating r WHERE r.cus_comments = '' AND r.sales.trans_type='rent' AND r.cus.id=:username", Rating.class);
        query.setParameter("username", username);
        return query.getResultList();
    }

    public List<Rating> findPendingByCusAndSale(String username) {
        TypedQuery<Rating> query = em.createQuery("SELECT r FROM Rating r WHERE r.cus_comments = '' AND r.sales.trans_type='sale' AND r.cus.id=:username", Rating.class);
        query.setParameter("username", username);
        return query.getResultList();
    }

    public List<Rating> findPendingByOwnAndRent(String username) {
        TypedQuery<Rating> query = em.createQuery("SELECT r FROM Rating r WHERE r.owner_comments = '' AND r.sales.trans_type='rent' AND r.owner.id=:username", Rating.class);
        query.setParameter("username", username);
        return query.getResultList();
    }

    public List<Rating> findPendingByOwnAndSale(String username) {
        TypedQuery<Rating> query = em.createQuery("SELECT r FROM Rating r WHERE r.owner_comments = '' AND r.sales.trans_type='sale' AND r.owner.id=:username", Rating.class);
        query.setParameter("username", username);
        return query.getResultList();
    }

    public List<Rating> findRatingByRoleAndUsername(String role, String username) {
        TypedQuery<Rating> query;
        if (role.equals("customer")) {
            query = em.createQuery("SELECT r FROM Rating r WHERE r.owner_comments <> '' AND r.cus.id = :username", Rating.class);
        } else {
            query = em.createQuery("SELECT r FROM Rating r WHERE r.cus_comments <> '' AND r.owner.id = :username", Rating.class);
        }
        query.setParameter("username", username);
        return query.getResultList();
    }
}
