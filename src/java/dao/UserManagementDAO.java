/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Usermanagement;
import java.math.BigDecimal;
import java.util.List;
import tools.BCrypt;

/**
 *
 * @author AdiRahmad
 */
public class UserManagementDAO {

    private FunctionsDAO fdao;

    public UserManagementDAO() {
        this.fdao = new FunctionsDAO();
    }

    public boolean insert(Object object) {
        return fdao.insert(object);
    }

    public boolean delete(Object object) {
        return fdao.delete(UserManagementDAO.class,
                BigDecimal.valueOf(new Long(object.toString())));
    }

    public List<Object> getAll() {
        return fdao.getAll("From Usermanagement ORDER BY id ");
    }

    public List<Object> search(String category, String search) {
        return fdao.getAll("From Usermanagement WHERE " + category + " LIKE '%" + search + "%' ORDER BY id ");
    }

    public Object getById(String id) {
        return fdao.getById("From Usermanagement WHERE id =" + id);
    }

    public Object getAutoID() {
        return fdao.getById("Select MAX (id)+1 From Usermanagement");
    }
    
    public boolean login(String category, String username, String password){
        Usermanagement u = (Usermanagement) search(category, username).get(0);
        return BCrypt.checkpw(password, u.getPassword());
    }
    
    public BigDecimal getAutoID2() {
        BigDecimal ids = BigDecimal.valueOf(new Long("1"));
        if (ids != null) {
            ids = BigDecimal.valueOf(new Long(getAutoID().toString()));
        }
        return ids;
    }

    public boolean insert(BigDecimal id,
            String username, String password, String akses, boolean isUpdate) {
        BigDecimal idBaru = id;

        if (!isUpdate) {
            idBaru = getAutoID2();
        }

        Usermanagement um = new Usermanagement
        (idBaru, username, BCrypt.hashpw(password, BCrypt.gensalt()), akses);
        return insert(um);
    }

}
