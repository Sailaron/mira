package Mira.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Client {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id_client;

    private String contact_name;

    private String contact_surname;

    private String address;

    private String title;

    private String phone;

    private String email;

    public Integer getIdClient() {
        return id_client;
    }

    public void setIdClient(Integer id_client) {
        this.id_client = id_client;
    }

    public String getContactName() {
        return contact_name;
    }

    public void setContactName(String contact_name) {
        this.contact_name = contact_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContactSurname() {
        return contact_surname;
    }

    public void setContactSurname(String contact_surname) {
        this.contact_surname = contact_surname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getOptionHtml(Boolean isSelected) {
        if (isSelected)
            return "<option value=\"" + getIdClient() + "\" selected>" + getTitle() + "</option>";
        else
            return "<option value=\"" + getIdClient() + "\">" + getTitle() + "</option>";
    }
}