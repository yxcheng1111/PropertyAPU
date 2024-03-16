/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import static model.Sales_.customer;

/**
 *
 * @author ASUS
 */
@Stateless
public class OwnerFacade extends AbstractFacade<Owner> {

    @PersistenceContext(unitName = "EPDA_Assignment-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OwnerFacade() {
        super(Owner.class);
    }

    public List<Owner> findApprove(String approvalStatus) {
        TypedQuery<Owner> query = em.createQuery(
                "SELECT o FROM Owner o WHERE o.approval_status = :approvalStatus", Owner.class);
        query.setParameter("approvalStatus", approvalStatus);
        return query.getResultList();
    }

    public List<Owner> findNotApprove(String approvalStatus) {
        TypedQuery<Owner> query = em.createQuery(
                "SELECT o FROM Owner o WHERE o.approval_status <> :approvalStatus", Owner.class);
        query.setParameter("approvalStatus", approvalStatus);
        return query.getResultList();
    }

    public List<Owner> findNotApproveByValue(String approvalStatus, String searchValue) {
        TypedQuery<Owner> query;

        if (searchValue.equals("")) {
            query = em.createQuery("SELECT o FROM Owner o WHERE o.approval_status <> :approvalStatus", Owner.class);
            query.setParameter("approvalStatus", approvalStatus);
        } else {
            query = em.createQuery("SELECT o FROM Owner o WHERE o.approval_status <> :approvalStatus AND "
                    + "LOWER(CONCAT(o.id, o.name, o.email, o.phone, o.gender, o.dob, o.approval_status)) LIKE :searchValue",
                    Owner.class);
            query.setParameter("approvalStatus", approvalStatus);
            query.setParameter("searchValue", "%" + searchValue + "%");
        }

        return query.getResultList();
    }

    public List<Owner> findApproveByValue(String approvalStatus, String searchValue) {
        TypedQuery<Owner> query;

        if (searchValue.equals("")) {
            query = em.createQuery("SELECT o FROM Owner o WHERE o.approval_status = :approvalStatus", Owner.class);
            query.setParameter("approvalStatus", approvalStatus);
        } else {
            query = em.createQuery("SELECT o FROM Owner o WHERE o.approval_status = :approvalStatus AND "
                    + "LOWER(CONCAT(o.id, o.name, o.email, o.phone, o.gender, o.dob, o.approval_status)) LIKE :searchValue",
                    Owner.class);
            query.setParameter("approvalStatus", approvalStatus);
            query.setParameter("searchValue", "%" + searchValue + "%");
        }

        return query.getResultList();
    }

    public List<Owner> findByValue(String searchValue) {
        TypedQuery<Owner> query;

        if (searchValue.equals("")) {
            query = em.createQuery("SELECT o FROM Owner o", Owner.class);
        } else {
            query = em.createQuery("SELECT o FROM Owner o WHERE LOWER(CONCAT(o.id, o.name, o.email, o.phone, o.gender, o.dob, o.approval_status)) LIKE :searchValue", Owner.class);
            query.setParameter("searchValue", "%" + searchValue + "%");
        }

        return query.getResultList();
    }
    
    public List<Owner> findOwnerByGender(String gender) {
        TypedQuery<Owner> query = em.createQuery(
                "SELECT o FROM Owner o WHERE o.gender = :gender AND o.approval_status = 'approved'", Owner.class);
        query.setParameter("gender", gender);
        return query.getResultList();
    }
    
     public List<Integer> getOwnerAges() {
        TypedQuery<Owner> query = em.createQuery("SELECT o FROM Owner o WHERE o.approval_status = 'approved'", Owner.class);
        List<Owner> owners = query.getResultList();
        List<Integer> ages = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        // Calculate the current date
        Date currentDate = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(currentDate);

        for (Owner owner : owners) {
            try {
                Date dob = sdf.parse(owner.getDob());

                Calendar dobCalendar = Calendar.getInstance();
                dobCalendar.setTime(dob);

                int age = calendar.get(Calendar.YEAR) - dobCalendar.get(Calendar.YEAR);
                if (calendar.get(Calendar.MONTH) == dobCalendar.get(Calendar.MONTH)) {
                    if (calendar.get(Calendar.DAY_OF_MONTH) < dobCalendar.get(Calendar.DAY_OF_MONTH)) {
                        age--;
                    }
                }
                if (calendar.get(Calendar.MONTH) < dobCalendar.get(Calendar.MONTH)) {
                    age--;
                }
                ages.add(age);
            } catch (Exception e) {

            }
        }
        Collections.sort(ages);
        return ages;
    }

}
