/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.entities;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="role")
public class Role implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="rid")
    private Integer rid;
    @Column(name="rname")
    private String rname;

    public Role() {
    }

    public Role(Integer rid, String rname) {
        this.rid = rid;
        this.rname = rname;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 37 * hash + Objects.hashCode(this.rid);
        hash = 37 * hash + Objects.hashCode(this.rname);
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
        final Role other = (Role) obj;
        if (!Objects.equals(this.rname, other.rname)) {
            return false;
        }
        if (!Objects.equals(this.rid, other.rid)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Role{" + "rid=" + rid + ", rname=" + rname + '}';
    }
    
    
}
