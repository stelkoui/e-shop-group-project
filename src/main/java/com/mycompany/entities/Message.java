
package com.mycompany.entities;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name="message")
public class Message implements Serializable{
    
    @Id
    private int mid;
    @NotEmpty
    private String mtext;
    @NotEmpty
    private String musername;

    public Message() {
    }

    public Message(int mid, String mtext, String musername) {
        this.mid = mid;
        this.mtext = mtext;
        this.musername = musername;
    }
    
    
    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getMtext() {
        return mtext;
    }

    public void setMtext(String mtext) {
        this.mtext = mtext;
    }

    public String getMusername() {
        return musername;
    }

    public void setMusername(String musername) {
        this.musername = musername;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + this.mid;
        hash = 29 * hash + Objects.hashCode(this.mtext);
        hash = 29 * hash + Objects.hashCode(this.musername);
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
        final Message other = (Message) obj;
        if (this.mid != other.mid) {
            return false;
        }
        if (!Objects.equals(this.mtext, other.mtext)) {
            return false;
        }
        if (!Objects.equals(this.musername, other.musername)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Message{" + "mid=" + mid + ", mtext=" + mtext + ", musername=" + musername + '}';
    }
    
    

    
}
