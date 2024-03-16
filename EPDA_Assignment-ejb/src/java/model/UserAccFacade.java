/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
public class UserAccFacade extends AbstractFacade<UserAcc> {

    @PersistenceContext(unitName = "EPDA_Assignment-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UserAccFacade() {
        super(UserAcc.class);
    }

    public List<UserAcc> getUsersLoggedInWithin24Hours(String role) {
        LocalDateTime twentyFourHoursAgo = LocalDateTime.now().minusHours(24);

        TypedQuery<UserAcc> query = em.createQuery("SELECT u FROM UserAcc u WHERE u.lastlogin >= :lastlogin AND u.role = :role", UserAcc.class);
        query.setParameter("lastlogin", twentyFourHoursAgo.format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
        query.setParameter("role", role);

        return query.getResultList();
    }

}
