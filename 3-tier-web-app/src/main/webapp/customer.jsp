<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="jumbotron">
                <h2>Customer Management</h2>
            </div>
            <div class="row">
                <form action="customerController" method="POST">
                    <div class="form-group">
                        <label for="inputName">Customer name</label>
                        <input class="form-control" type="input" id="inputName" name="inputName" placeholder="E.g. Pedro" maxlength="30"/>
                    </div>
                    <div class="form-group">
                        <label for="inputAge">Age</label>
                        <input class="form-control" type="number" id="inputAge" name="inputAge" placeholder="E.g. 25" maxlength="5"/>
                    </div>
                    <div class="form-group">
                        <label for="inputPhone">Phone number</label>
                        <input class="form-control" type="input" id="inputPhone" name="inputPhone" placeholder="E.g. 40028922" min="2" max="16"/>
                    </div>
                    <div class="form-group">
                        <label for="inputCountry">Country</label>
                        <select class="form-control" name="inputCountry" id="inputCountry">
                            <c:forEach var = "country" items="${sessionScope.countryList}">
                                <option value="${country.id}">
                                    ${country.name}
                                </option>                
                            </c:forEach> 
                        </select>
                    </div>
                    <input type="submit" value="Create" class="btn btn-primary"/>
                </form>
            </div>
            <div class="row"></div>
            <div class="row">
                <table class="table table-striped table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Age</th>
                            <th>Credit Limit</th>
                            <th>Country</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var = "customer" items="${sessionScope.customerList}">
                            <tr>
                                <td>${customer.id}</td>
                                <td>${customer.name}</td>
                                <td>${customer.phone}</td>
                                <td>${customer.age}</td>
                                <td>${customer.creditLimit}</td>
                                <td>${customer.country.acronym}</td>
                            </tr>                            
                        </c:forEach> 
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

