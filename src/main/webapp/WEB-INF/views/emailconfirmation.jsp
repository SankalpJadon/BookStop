<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />   
    <title>Free Responsive Admin Theme - ZONTAL</title>
    <link href="${pageContext.servletContext.contextPath}/resources/admin/css/bootstrap.css" rel="stylesheet" />
   
    <link href="${pageContext.servletContext.contextPath}/resources/admin/css/font-awesome.css" rel="stylesheet" />

    <link href="${pageContext.servletContext.contextPath}/resources/admin/css/style.css" rel="stylesheet" />  
    
</head>
<body>
    <header>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <strong>Mail Confirmation</strong>
                    <strong><a href="logout">Logout</a></strong>
                </div>
            </div>
        </div>
    </header>
    <!-- HEADER END-->
    <div class="navbar navbar-inverse set-radius-zero">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                

            </div>

            <div class="left-div">
                <div class="user-settings-wrapper">
                    <ul class="nav">

                        <li class="dropdown">
							<h3>Email sent!</h3>
						</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- LOGO HEADER END-->
    <section class="menu-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li>Welcome ${person.userName}</li>
                        </ul>
                    </div>
                </div>
				Email Sent!
            </div>
        </div>
    </section>
    <footer>
        <div class="container">
        <a href="adminpage"><h4>Back</h4></a>
            <div class="row">
                <div class="col-md-12">
                    &copy; 2016 BookStop
                </div>

            </div>
        </div>
    </footer>
</body>
</html>
