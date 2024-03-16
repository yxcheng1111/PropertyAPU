/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

/**
 *
 * @author ASUS
 */
@Entity
public class Rating implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToOne
    private Sales sales;
    @OneToOne
    private Owner owner;
    @OneToOne
    private Customer cus;
    private Integer owner_rating;
    private String owner_comments;
    private Integer cus_rating;
    private String cus_comments;

    public Rating() {
    }

    public Rating(Sales sales, Owner owner, Customer cus, Integer owner_rating, String owner_comments, Integer cus_rating, String cus_comments) {
        this.sales = sales;
        this.owner = owner;
        this.cus = cus;
        this.owner_rating = owner_rating;
        this.owner_comments = owner_comments;
        this.cus_rating = cus_rating;
        this.cus_comments = cus_comments;
    }
    
    public Sales getSales() {
        return sales;
    }

    public void setSales(Sales sales) {
        this.sales = sales;
    }

    public Owner getOwner() {
        return owner;
    }

    public void setOwner(Owner owner) {
        this.owner = owner;
    }

    public Customer getCus() {
        return cus;
    }

    public void setCus(Customer cus) {
        this.cus = cus;
    }

    public Integer getOwner_rating() {
        return owner_rating;
    }

    public void setOwner_rating(Integer owner_rating) {
        this.owner_rating = owner_rating;
    }

    public String getOwner_comments() {
        return owner_comments;
    }

    public void setOwner_comments(String owner_comments) {
        this.owner_comments = owner_comments;
    }

    public Integer getCus_rating() {
        return cus_rating;
    }

    public void setCus_rating(Integer cus_rating) {
        this.cus_rating = cus_rating;
    }

    public String getCus_comments() {
        return cus_comments;
    }

    public void setCus_comments(String cus_comments) {
        this.cus_comments = cus_comments;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Rating)) {
            return false;
        }
        Rating other = (Rating) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Rating[ id=" + id + " ]";
    }
    
}
