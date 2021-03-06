<%-- 
    Document   : modulesUser
    Created on : Dec 13, 2021, 5:15:09 AM
    Author     : Dell
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>modules</title>

        <!--css-->
        <!--bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--background-->
        <link rel="stylesheet" href="bg.css" >
        <!--navbar-->
        <link rel="stylesheet" href="navbar.css" >
        <!--logo-->
        <link rel="icon" href="images/logo.png" />
        <style>

            /*css for this file*/
            h1{
                color:white;
                font-size:60px;                
                padding-bottom: 70px;
                padding-top: 70px;
            }

            .container b{
                position: relative;                              
                width: 800px;
                padding: 10px 10px;
                text-align: center;
                margin: 5px 5px;
                border-radius: 15px;
                border: 2px solid white;             
                border: 2px solid white;
                background: transparent;
                color: white;
                cursor:pointer;
                overflow: hidden;
                font-size: 20px;
                display: flex;
                align-items: center;
                justify-content: center;
                text-transform: uppercase;
                font-size: 25px;
                padding-top: 2px;
            }

            span{
                left: 0;
                top: 0;
                background: rgb(0, 153, 51);
                height: 100%;
                width: 0;
                border-radius: 15px;
                position: absolute;
                z-index: -1;
                transition: 0.5s;
                opacity: 0.8;
            }
            b:hover span{
                width: 100%;
            }
            b:hover{
                border: none;}

        </style>
    </head>
    <body>
        
        <div class="navbar">
            <ul>                            

                <li><a href="login.jsp">Logout</a></li>           


            </ul>
        </div>

        <h1 style="text-align: center">Tax Management Systems</h1>

        <!--buttons-->
        <br><br>
        <div class="container" align =center >  
            <!--buttons-->
            <a href="IncomeTax.jsp"  type="button"><b><span></span>Income Tax</b></a>    
            <a href="PropertyTax.jsp" type="button" ><b><span></span>Property Tax</b></a>       
            <a href="VehicleTax.jsp" type="button" ><b><span></span>Vehicle Tax</b></a>      
            <a href="SalesTax.jsp" type="button" ><b><span></span>Sales Tax</b></a> 

        </div>

        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>

