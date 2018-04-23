/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.business;

import com.mycompany.mavenproject1.data.Country;
import com.mycompany.mavenproject1.data.Customer;
import java.util.Set;

/**
 *
 * @author laboratoriop003-mac006
 */
public class Facade {
    CountryBusiness countryb = new CountryBusiness ();
    CustomerBusiness customerb = new CustomerBusiness();
    
        
    public void createCountry (Country country) throws Exception {
        countryb.create(country);
    }
    public void createCustomer (Customer customer) throws Exception {
        customerb.create(customer);
    }
    public Set<Country> readAllCountry () {
        return countryb.readAll();        
    }
    public Set<Customer> readAllCustomer() {
        return customerb.readAll();
    }
}
