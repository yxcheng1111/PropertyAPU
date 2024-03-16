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
public class SalesFacade extends AbstractFacade<Sales> {

    @PersistenceContext(unitName = "EPDA_Assignment-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SalesFacade() {
        super(Sales.class);
    }

    public List<Sales> getSalesListWithPaymentCollectedByOwner(Owner owner, String type) {
        TypedQuery< Sales> query = em.createQuery("SELECT s FROM Sales s WHERE s.payment_collected = 'true' AND s.owner = :owner AND s.trans_type = :type", Sales.class);
        query.setParameter("owner", owner);
        query.setParameter("type", type);
        return query.getResultList();
    }

    public List<Sales> getSalesListWithPaymentCollectedByCustomer(Customer customer, String type) {
        TypedQuery< Sales> query = em.createQuery("SELECT s FROM Sales s WHERE s.payment_collected = 'true' AND s.customer = :customer AND s.trans_type = :type", Sales.class);
        query.setParameter("customer", customer);
        query.setParameter("type", type);
        return query.getResultList();
    }

}
