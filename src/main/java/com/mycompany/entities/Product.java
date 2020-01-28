
package com.mycompany.entities;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name="product")
public class Product implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)        
    private int pcode;
    @NotEmpty
    private String pcategory;
    @NotEmpty
    private String psubcat;
    private String pcolor;
    private String psize;
    private String pdescr;
    private String pdescr2;
    private String pgender;
    private int pquant;
    private Double pprice;
    private String purl;

    public Product() {
    }

    public Product(int pcode, String pcategory, String psubcat, String pcolor, String psize, String pdescr,String pdescr2, String pgender, int pquant, Double pprice, String purl) {
        this.pcode = pcode;
        this.pcategory = pcategory;
        this.psubcat = psubcat;
        this.pcolor = pcolor;
        this.psize = psize;
        this.pdescr = pdescr;
        this.pdescr2=pdescr2;
        this.pgender = pgender;
        this.pquant = pquant;
        this.pprice = pprice;
        this.purl = purl;
    }

    public String getPurl() {
        return purl;
    }

    public void setPurl(String purl) {
        this.purl = purl;
    }

    public String getPdescr2() {
        return pdescr2;
    }

    public void setPdescr2(String pdescr2) {
        this.pdescr2 = pdescr2;
    }

   

    

    
    public int getPcode() {
        return pcode;
    }

    public void setPcode(int pcode) {
        this.pcode = pcode;
    }

    public String getPcategory() {
        return pcategory;
    }

    public void setPcategory(String pcategory) {
        this.pcategory = pcategory;
    }

    public String getPsubcat() {
        return psubcat;
    }

    public void setPsubcat(String psubcat) {
        this.psubcat = psubcat;
    }

    public String getPcolor() {
        return pcolor;
    }

    public void setPcolor(String pcolor) {
        this.pcolor = pcolor;
    }

    public String getPsize() {
        return psize;
    }

    public void setPsize(String psize) {
        this.psize = psize;
    }

    public String getPdescr() {
        return pdescr;
    }

    public void setPdescr(String pdescr) {
        this.pdescr = pdescr;
    }
    
    public int getPquant() {
        return pquant;
    }

    public void setPquant(int pquant) {
        this.pquant = pquant;
    }

    public Double getPprice() {
        return pprice;
    }

    public void setPprice(Double pprice) {
        this.pprice = pprice;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 67 * hash + this.pcode;
        hash = 67 * hash + Objects.hashCode(this.pcategory);
        hash = 67 * hash + Objects.hashCode(this.psubcat);
        hash = 67 * hash + Objects.hashCode(this.pcolor);
        hash = 67 * hash + Objects.hashCode(this.psize);
        hash = 67 * hash + Objects.hashCode(this.pdescr);
        hash = 67 * hash + Objects.hashCode(this.pdescr2);
        hash = 67 * hash + Objects.hashCode(this.pgender);
        hash = 67 * hash + this.pquant;
        hash = 67 * hash + Objects.hashCode(this.pprice);
        hash = 67 * hash + Objects.hashCode(this.purl);
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
        final Product other = (Product) obj;
        if (this.pcode != other.pcode) {
            return false;
        }
        if (this.pquant != other.pquant) {
            return false;
        }
        if (!Objects.equals(this.pcategory, other.pcategory)) {
            return false;
        }
        if (!Objects.equals(this.psubcat, other.psubcat)) {
            return false;
        }
        if (!Objects.equals(this.pcolor, other.pcolor)) {
            return false;
        }
        if (!Objects.equals(this.psize, other.psize)) {
            return false;
        }
        if (!Objects.equals(this.pdescr, other.pdescr)) {
            return false;
        }
        if (!Objects.equals(this.pdescr2, other.pdescr2)) {
            return false;
        }
        if (!Objects.equals(this.pgender, other.pgender)) {
            return false;
        }
        if (!Objects.equals(this.purl, other.purl)) {
            return false;
        }
        if (!Objects.equals(this.pprice, other.pprice)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Product{" + "pcode=" + pcode + ", pcategory=" + pcategory + ", psubcat=" + psubcat + ", pcolor=" + pcolor + ", psize=" + psize + ", pdescr=" + pdescr + ", pdescr2=" + pdescr2 + ", pgender=" + pgender + ", pquant=" + pquant + ", pprice=" + pprice + ", purl=" + purl + '}';
    }

  

  

    
    public String getPgender() {
        return pgender;
    }

    public void setPgender(String pgender) {
        this.pgender = pgender;
    }
    
    
    
}
