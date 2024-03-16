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
public class PropertyFacade extends AbstractFacade<Property> {

    @PersistenceContext(unitName = "EPDA_Assignment-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PropertyFacade() {
        super(Property.class);
    }

    public List<Property> findPropertiesForRentByOwner(String ownerName) {
        TypedQuery<Property> query = em.createQuery("SELECT p FROM Property p WHERE p.owner1.id = :ownerName AND p.rent_price != '0'  AND p.status = 'available'", Property.class);
        query.setParameter("ownerName", ownerName);
        return query.getResultList();
    }

    public List<Property> findPropertiesForSaleByOwner(String ownerName) {
        TypedQuery<Property> query = em.createQuery("SELECT p FROM Property p WHERE p.owner1.id = :ownerName AND p.sale_price != '0'  AND p.status = 'available'", Property.class);
        query.setParameter("ownerName", ownerName);
        return query.getResultList();
    }
    
    public List<Property> findOnGoingByOwner(String ownerName) {
        TypedQuery<Property> query = em.createQuery("SELECT p FROM Property p WHERE p.owner1.id = :ownerName AND p.status = 'on-going'", Property.class);
        query.setParameter("ownerName", ownerName);
        return query.getResultList();
    }

    public List<Property> findPropertiesForSaleByOwnerWithValue(String ownerName, String searchValue) {
        TypedQuery<Property> query;

        if (searchValue.equals("")) {
            query = em.createQuery("SELECT p FROM Property p WHERE p.owner1.id = :ownerName AND p.sale_price != '0' AND p.status = 'available'", Property.class);
        } else {
            query = em.createQuery("SELECT p FROM Property p WHERE p.owner1.id = :ownerName AND p.sale_price != '0' AND p.status = 'available' AND "
                    + " LOWER(CONCAT(p.property_name, p.listed_date, p.property_type, p.furnishing, p.room_no, p.toilet_no, p.floor_size, p.location, p.sale_price)) LIKE :searchValue", Property.class);
            query.setParameter("searchValue", "%" + searchValue.toLowerCase() + "%");
        }
        query.setParameter("ownerName", ownerName);

        return query.getResultList();
    }

    public List<Property> findPropertiesForRentByOwnerWithValue(String ownerName, String searchValue) {
        TypedQuery<Property> query;

        if (searchValue.equals("")) {
            query = em.createQuery("SELECT p FROM Property p WHERE p.owner1.id = :ownerName AND p.rent_price != '0'  AND p.status = 'available'", Property.class);

        } else {
            query = em.createQuery("SELECT p FROM Property p WHERE p.owner1.id = :ownerName AND p.rent_price != '0' AND p.status = 'available' AND "
                    + " LOWER(CONCAT(p.property_name, p.listed_date, p.property_type, p.furnishing, p.room_no, p.toilet_no, p.floor_size, p.location, p.sale_price)) LIKE :searchValue", Property.class);
            query.setParameter("searchValue", "%" + searchValue + "%");
        }
        query.setParameter("ownerName", ownerName);

        return query.getResultList();
    }

    public List<Property> findProperties(String action) {
        TypedQuery<Property> query;
        if (action.equals("rent")) {
            query = em.createQuery("SELECT p FROM Property p WHERE p.status = 'available' AND p.rent_price != '0'", Property.class);
        } else {
            query = em.createQuery("SELECT p FROM Property p WHERE p.status = 'available' AND p.sale_price != '0'", Property.class);
        }
        return query.getResultList();
    }

    public List<Property> searchProperties(String propertyType, String location, int floorSize, int numRooms, int numToilets,
            String furnishing, int budget, String action) {
        StringBuilder queryBuilder = new StringBuilder("SELECT p FROM Property p WHERE p.status = 'available'");

        if (action.equals("rent")) {
            queryBuilder.append(" AND p.rent_price != '0'");
        } else if (action.equals("sale")) {
            queryBuilder.append(" AND p.sale_price != '0'");
        }

        if (!propertyType.equals("")) {
            queryBuilder.append(" AND p.property_type = :propertyType");
        }

        if (!location.equals("")) {
            queryBuilder.append(" AND p.location = :location");
        }

        if (floorSize > 0) {
            queryBuilder.append(" AND CAST(p.floor_size AS INTEGER) <= CAST(:floorSize AS INTEGER)");
        }

        if (numRooms > 0) {
            queryBuilder.append(" AND CAST(p.room_no AS INTEGER) = CAST(:numRooms AS INTEGER)");
        }

        if (numToilets > 0) {
            queryBuilder.append(" AND CAST(p.toilet_no AS INTEGER) = CAST(:numToilets AS INTEGER)");
        }

        if (!furnishing.equals("")) {
            queryBuilder.append(" AND p.furnishing = :furnishing");
        }

        if (budget > 0) {
            if (action.equals("rent")) {
                queryBuilder.append(" AND CAST(p.rent_price AS INTEGER) <= CAST(:budget AS INTEGER)");
            } else if (action.equals("sale")) {
                queryBuilder.append(" AND CAST(p.sale_price AS INTEGER) <= CAST(:budget AS INTEGER)");
            }
        }

        TypedQuery<Property> query = em.createQuery(queryBuilder.toString(), Property.class);

        if (!propertyType.equals("")) {
            query.setParameter("propertyType", propertyType);
        }

        if (!location.equals("")) {
            query.setParameter("location", location);
        }

        if (floorSize > 0) {
            query.setParameter("floorSize", floorSize);
        }

        if (numRooms > 0) {
            query.setParameter("numRooms", numRooms);
        }

        if (numToilets > 0) {
            query.setParameter("numToilets", numToilets);
        }

        if (!furnishing.equals("")) {
            query.setParameter("furnishing", furnishing);
        }

        if (budget > 0) {
            query.setParameter("budget", budget);
        }

        return query.getResultList();
    }
    
     public List<String> getAllPropertyLocation() {
        TypedQuery<String> query = em.createQuery("SELECT p.location FROM Property p", String.class);
        return query.getResultList();
    }

}
