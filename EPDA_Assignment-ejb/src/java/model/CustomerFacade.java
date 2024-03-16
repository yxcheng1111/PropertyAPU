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

/**
 *
 * @author ASUS
 */
@Stateless
public class CustomerFacade extends AbstractFacade<Customer> {

    @PersistenceContext(unitName = "EPDA_Assignment-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CustomerFacade() {
        super(Customer.class);
    }

    public List<Customer> findByValue(String searchValue) {
        TypedQuery<Customer> query;

        if (searchValue.equals("")) {
            query = em.createQuery("SELECT o FROM Customer o", Customer.class);
        } else {
            query = em.createQuery("SELECT o FROM Customer o WHERE LOWER(CONCAT(o.id, o.name, o.email, o.phone, o.gender, o.dob)) LIKE :searchValue", Customer.class);
            query.setParameter("searchValue", "%" + searchValue + "%");
        }

        return query.getResultList();
    }

    public List<Customer> findCustomerByGender(String gender) {
        TypedQuery<Customer> query = em.createQuery(
                "SELECT c FROM Customer c WHERE c.gender = :gender", Customer.class);
        query.setParameter("gender", gender);
        return query.getResultList();
    }

    public List<Integer> getCustomerAges() {
        TypedQuery<Customer> query = em.createQuery("SELECT o FROM Customer o", Customer.class);
        List<Customer> customers = query.getResultList();
        List<Integer> ages = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        // Calculate the current date
        Date currentDate = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(currentDate);

        for (Customer customer : customers) {
            try {
                Date dob = sdf.parse(customer.getDob());

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
