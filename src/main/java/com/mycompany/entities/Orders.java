
package com.mycompany.entities;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


@Entity
@Table
@NamedQueries({
    @NamedQuery(name = "Orders.findAll", query = "SELECT o FROM Orders o")
    , @NamedQuery(name = "Orders.findByOcode", query = "SELECT o FROM Orders o WHERE o.ocode = :ocode")
    , @NamedQuery(name = "Orders.findByOquant", query = "SELECT o FROM Orders o WHERE o.oquant = :oquant")
    , @NamedQuery(name = "Orders.findByOtotal", query = "SELECT o FROM Orders o WHERE o.ototal = :ototal")})
public class Orders implements Serializable {

    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ocode")
    private Integer ocode;
    @Column(name = "oquant")
    private Integer oquant;
    @Column(name = "ototal")
    private Integer ototal;
    @JoinColumn(name = "puid", referencedColumnName = "uid")
    @ManyToOne
    private User puid;

    public Orders() {
    }

    public Orders(Integer oquant, Integer ototal) {
        this.oquant = oquant;
        this.ototal = ototal;
    }
    

    public Orders(Integer ocode) {
        this.ocode = ocode;
    }

    public Integer getOcode() {
        return ocode;
    }

    public void setOcode(Integer ocode) {
        this.ocode = ocode;
    }

    public Integer getOquant() {
        return oquant;
    }

    public void setOquant(Integer oquant) {
        this.oquant = oquant;
    }

    public Integer getOtotal() {
        return ototal;
    }

    public void setOtotal(Integer ototal) {
        this.ototal = ototal;
    }

    public User getPuid() {
        return puid;
    }

    public void setPuid(User puid) {
        this.puid = puid;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 47 * hash + Objects.hashCode(this.ocode);
        hash = 47 * hash + Objects.hashCode(this.oquant);
        hash = 47 * hash + Objects.hashCode(this.ototal);
        hash = 47 * hash + Objects.hashCode(this.puid);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Orders other = (Orders) obj;
        if (!Objects.equals(this.ocode, other.ocode)) {
            return false;
        }
        if (!Objects.equals(this.oquant, other.oquant)) {
            return false;
        }
        if (!Objects.equals(this.ototal, other.ototal)) {
            return false;
        }
        if (!Objects.equals(this.puid, other.puid)) {
            return false;
        }
        return true;
    }

    


    @Override
    public String toString() {
        return "Orders{" + "ocode=" + ocode + ", oquant=" + oquant + ", ototal=" + ototal + ", puid=" + puid + '}';
    }

   
    
}
