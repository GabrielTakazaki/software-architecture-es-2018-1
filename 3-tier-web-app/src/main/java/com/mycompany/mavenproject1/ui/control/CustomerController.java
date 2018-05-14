
package com.mycompany.mavenproject1.ui.control;

import com.mycompany.mavenproject1.business.CountryBusiness;
import com.mycompany.mavenproject1.business.CustomerBusiness;
import com.mycompany.mavenproject1.data.Customer;
import com.mycompany.mavenproject1.data.Country;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("/customerController")
public class CustomerController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        CountryBusiness countryBusiness = new CountryBusiness();
        Country country = countryBusiness.readById(Integer.parseInt(req.getParameter("inputCountry")));
        Customer newCustomer = new Customer();
        
        try {
            newCustomer.setId(0);
            newCustomer.setName(req.getParameter("inputName"));
            newCustomer.setAge(Integer.parseInt(req.getParameter("inputAge")));
            newCustomer.setPhone(req.getParameter("inputPhone"));
            newCustomer.setCountry(country);
        } catch (Exception ex) {
            Logger.getLogger(CustomerController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        CustomerBusiness customerBusiness = new CustomerBusiness();
        
        try {
            customerBusiness.create(newCustomer);
            req.getSession().setAttribute("countryList", customerBusiness.readAll());
            
        } catch (Exception ex) {
            Logger.getLogger(CountryController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
