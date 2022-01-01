%-- 
    Document   : Accountant
    Created on : Dec 10, 2021, 11:08:52 PM
    Author     : Dell
--%>




<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>accountant</title>

        <!--css stylesheets-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">        

        <!--background-->
        <link rel="stylesheet" href="bg.css" >

        <!--slider form-->
        <link rel="stylesheet" href="slider.css" >
        <!--logo-->
        <link rel="icon" href="images/logo.png" />
        <link rel="stylesheet" href="navbar.css" >

        <style>

            .button{
                font-family: "Montserrat";
                position: absolute;
                bottom: 12px;
                left: 10%;
                margin-left: -108px;
                width: 8%;
                padding: 5px 20px;
                font-size: 18px;
                background-color: rgba(0, 153, 51, 1);
                color: white;
                border-radius: 5px;
                border: none;
                opacity: 0.9; 
                cursor: pointer;

            }
            .container .form .invalid-feedback {
                margin: 0 auto;
                margin-bottom: 6px;

            }

        </style>


    </head>
    <body>
        <div class="navbar">
            <ul>                            
                <li><a href=modules.jsp" >Back</a></li>
                <li><a href="login.jsp">Logout</a></li>           


            </ul>
        </div>

        <section>
            <div class="container">

                <!--candidate removal form-->



                <!--candidate registration form-->
                <div class="form form2 active">
                    <div class="wrapper">

                        <form id="register" novalidate action = "Accountant.jsp" method = "POST">

                            <h1>Update Taxpayer Status</h1>
                            <br>

                            <input name = "cnic" class="form-control" type="text"  id ="cnic"
                                   placeholder="Enter CNIC: XXXXXXXXXXXXX"  
                                   pattern = "[0-9]{13}"  required>
                            <div class="invalid-feedback">
                                Please provide a valid CNIC number
                            </div>


                            <input name = "name" type="text" class="form-control"  placeholder="Enter Taxpayer Name" id="taxpayerName" required>
                            <div class="invalid-feedback">Please provide a taxpayer name.</div>
                            <label for="status">Update status</label>
                            <select name="status" id="status">
                                <option value="paid">Paid</option>
                                <option value="unpaid">Unpaid</option>
                                
                            </select>







                            <div class="invalid-feedback">
                                Please select an option.
                            </div>




                         



                            <br>
                            <br>
                            <input type="hidden" name="action" value="register">
                            <button id = "register" type="submit" style = "opacity: 0.9;" class="btn btn-primary ">Submit</button>
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
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script type= "text/javascript" src="form.js"></script>

    </body>
</html>
