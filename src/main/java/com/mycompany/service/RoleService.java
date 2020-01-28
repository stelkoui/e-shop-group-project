
package com.mycompany.service;

import com.mycompany.entities.Role;
import java.util.List;


public interface RoleService {

    public List<Role> getRoles();

    public Role findById(Integer id);
    
}
