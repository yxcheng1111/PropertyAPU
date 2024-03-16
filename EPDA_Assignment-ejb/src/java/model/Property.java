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
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

/**
 *
 * @author ASUS
 */
@Entity
public class Property implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToOne(mappedBy = "property")
    private Sales sales;

    public Sales getSales() {
        return sales;
    }

    public void setSales(Sales sales) {
        this.sales = sales;
    }
    
    public Owner getOwner1() {
        return owner1;
    }

    public void setOwner1(Owner owner1) {
        this.owner1 = owner1;
    }
    @ManyToOne
    private Owner owner1;

    public Property() {
    }

    public Property(Owner owner1, String listed_date, String property_name, String property_type, String description, String furnishing, String room_no, String toilet_no, String floor_size, String location, String rent_price, String sale_price, String status) {
        this.owner1 = owner1;
        this.listed_date = listed_date;
        this.property_name = property_name;
        this.property_type = property_type;
        this.description = description;
        this.furnishing = furnishing;
        this.room_no = room_no;
        this.toilet_no = toilet_no;
        this.floor_size = floor_size;
        this.location = location;
        this.rent_price = rent_price;
        this.sale_price = sale_price;
        this.status = status;
    }
    
    private String listed_date;
    private String property_name;
    private String property_type;
    private String description;
    private String furnishing;
    private String room_no;
    private String toilet_no;
    private String floor_size;
    private String location;
    private String rent_price;
    private String sale_price;
    private String status;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getListed_date() {
        return listed_date;
    }

    public void setListed_date(String listed_date) {
        this.listed_date = listed_date;
    }

    public String getProperty_name() {
        return property_name;
    }

    public void setProperty_name(String property_name) {
        this.property_name = property_name;
    }

    public String getProperty_type() {
        return property_type;
    }

    public void setProperty_type(String property_type) {
        this.property_type = property_type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFurnishing() {
        return furnishing;
    }

    public void setFurnishing(String furnishing) {
        this.furnishing = furnishing;
    }


    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getRoom_no() {
        return room_no;
    }

    public void setRoom_no(String room_no) {
        this.room_no = room_no;
    }

    public String getToilet_no() {
        return toilet_no;
    }

    public void setToilet_no(String toilet_no) {
        this.toilet_no = toilet_no;
    }

    public String getFloor_size() {
        return floor_size;
    }

    public void setFloor_size(String floor_size) {
        this.floor_size = floor_size;
    }

    public String getRent_price() {
        return rent_price;
    }

    public void setRent_price(String rent_price) {
        this.rent_price = rent_price;
    }

    public String getSale_price() {
        return sale_price;
    }

    public void setSale_price(String sale_price) {
        this.sale_price = sale_price;
    }

    
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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
        if (!(object instanceof Property)) {
            return false;
        }
        Property other = (Property) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Property[ id=" + id + " ]";
    }
    
}
