<%-- 
    Document   : Accountant
    Created on : Dec 10, 2021, 11:08:52 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>register</title>

        <!--css -->
        <!--bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">        

        <!--background-->
        <link rel="stylesheet" href="bg.css" >

        <!--slider form-->        
        <link rel="stylesheet" href="slider.css" >

        <!--navbar-->
        <link rel="stylesheet" href="navbar.css" >

        <!--logo-->
        <link rel="icon" href="images/logo.png" />

        <style>
            .container {
                min-height: 550px;
                min-width: 750px;
                max-width: 750px;
            }

            section {
                min-height: 87vh;
            }

        </style>

    </head>
    <body>

        <!--navbar-->
        <div class="navbar">
            <ul>            

                <li><a href=admin.jsp" >Back</a></li>
                <li><a href="login.jsp">Logout</a></li>    

            </ul>
        </div>

        <section>
            <div class="container">



                <!--form for login-->
                <div class="form form2 active">
                    <div class="wrapper">
                        <form id="register" novalidate action = "RegisterServlet" method = "POST">

                            <h1>Register New Record</h1>
                            <br>
                            <input name = "cnic" class="form-control" type="text"  id ="cnic"
                                   placeholder="Enter CNIC: XXXXXXXXXXXXX"  
                                   pattern = "[0-9]{13}"  required>
                            <div class="invalid-feedback">
                                Please provide a valid CNIC number
                            </div>

                            <input name = "name" type="text" class="form-control"  placeholder="Enter Taxpayer Name" id="TaxpayerName" required>
                            <div class="invalid-feedback">Please provide a taxpayer name.</div>

                            <input name = "phone" type="text" class="form-control"  placeholder="Enter Cell Phone Number" id="phonenumber" required>
                            <div class="invalid-feedback">Please provide a phone number.</div>


                           <input name = "nationality" type="text" class="form-control"  placeholder="Enter Nationality" id="nationality" required>
                            <div class="invalid-feedback">Please provide a nationality.</div>



                             <input name = "address" type="text" class="form-control"  placeholder="Enter Residential Address" id="address" required>
                            <div class="invalid-feedback">Please provide an address.</div>
            
                            <br>
                            <br>

                            
                            <input type="hidden" name="action" value="register">
                            <button id = "register" type="submit" style = "opacity: 0.9;" class="btn btn-primary ">Register</button>
                        </form>
                    </div>
                </div>

                <!--overlays-->
                  <div class="overlay-container">
                    <div class="overlay">


                    </div>
                </div>
            </div>
        </section>


        <!--javascript-->
        <script type= "text/javascript" src="form.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
