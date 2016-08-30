<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Free Responsive Admin Theme - ZONTAL</title>
    <link href="${pageContext.servletContext.contextPath}/resources/admin/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME ICONS  -->
    <link href="${pageContext.servletContext.contextPath}/resources/admin/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="${pageContext.servletContext.contextPath}/resources/admin/css/style.css" rel="stylesheet" />
     <!-- HTML5 Shiv and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<script>
		function approve(string1,string2)
		{		
			var xRequest1;
			if(string1=="")
			{
				document.getElementById("Show_update").innerHTML="";
				return;
			}
			if(window.XMLHttpRequest)
			{
				xRequest1=new XMLHttpRequest();
			}
			else
			{
				xRequest1=new ActiveXObject("Microsoft.XMLHTTP");
			}
			xRequest1.onreadystatechange=function ()
			{
				if((xRequest1.readyState==4) && (xRequest1.status==200))
				{
					var x= xRequest1.responseText;
					if(x){	
						deleteRow(string2);
					}
				}
			}
	xRequest1.open("get","approvePerson/"+string1,"true");
	xRequest1.send();
}
</script>

<script>
			var deleteRow = function (link) {
            var row = link.parentNode .parentNode;
            var table = row.parentNode; 
            table.removeChild(row); 
            alert("Action completed");
			}		

</script>
    
    
</head>
<body>
    <header>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <strong>Welcome Admin </strong>
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
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                                <span class="glyphicon glyphicon-user" style="font-size: 25px;"></span>
                            </a>
                            <div class="dropdown-menu dropdown-settings">
                                <div class="media">
                                    <a class="media-left" href="#">
                                        <img src="assets/img/64-64.jpg" alt="" class="img-rounded" />
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading">Jhon Deo Alex </h4>
                                        <h5>Developer & Designer</h5>

                                    </div>
                                </div>
                                <hr />
                                <h5><strong>Personal Bio : </strong></h5>
                                Anim pariatur cliche reprehen derit.
                                <hr />
                                <a href="#" class="btn btn-info btn-sm">Full Profile</a>&nbsp; <a href="login.html" class="btn btn-danger btn-sm">Logout</a>

                            </div>
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

            </div>
        </div>
    </section>
    <!-- MENU SECTION END-->
    <div class="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="page-head-line">Dashboard</h4>

                </div>

            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="alert alert-success">
						Approve requests.
                    </div>
                </div>

            </div>
        <!--     <div class="row">
                 <div class="col-md-3 col-sm-3 col-xs-6">
                    <div class="dashboard-div-wrapper bk-clr-one">
                        <i  class="fa fa-venus dashboard-div-icon" ></i>
                        <div class="progress progress-striped active">
  <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
  </div>
                           
</div>
                         <h5>Simple Text Here </h5>
                    </div>
                </div>
                 <div class="col-md-3 col-sm-3 col-xs-6">
                    <div class="dashboard-div-wrapper bk-clr-two">
                        <i  class="fa fa-edit dashboard-div-icon" ></i>
                        <div class="progress progress-striped active">
  <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
  </div>
                           
</div>
                         <h5>Simple Text Here </h5>
                    </div>
                </div>
                 <div class="col-md-3 col-sm-3 col-xs-6">
                    <div class="dashboard-div-wrapper bk-clr-three">
                        <i  class="fa fa-cogs dashboard-div-icon" ></i>
                        <div class="progress progress-striped active">
  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
  </div>
                           
</div>
                         <h5>Simple Text Here </h5>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6">
                    <div class="dashboard-div-wrapper bk-clr-four">
                        <i  class="fa fa-bell-o dashboard-div-icon" ></i>
                        <div class="progress progress-striped active">
  <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
  </div>
                           
</div>
                         <h5>Simple Text Here </h5>
                    </div>
                </div>

            </div> -->
           
            <div class="row">
       <!--          <div class="col-md-6">
                      <div class="notice-board">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                           Active  Notice Panel 
                                <div class="pull-right" >
                                    <div class="dropdown">
  <button class="btn btn-success dropdown-toggle btn-xs" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    <span class="glyphicon glyphicon-cog"></span>
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Refresh</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Logout</a></li>
  </ul>
</div>
                                </div>
                            </div>
                            <div class="panel-body">
                               
                                <ul >
                                   
                                     <li>
                                            <a href="#">
                                     <span class="glyphicon glyphicon-align-left text-success" ></span> 
                                                  Lorem ipsum dolor sit amet ipsum dolor sit amet
                                                 <span class="label label-warning" > Just now </span>
                                            </a>
                                    </li>
                                     <li>
                                          <a href="#">
                                     <span class="glyphicon glyphicon-info-sign text-danger" ></span>  
                                          Lorem ipsum dolor sit amet ipsum dolor sit amet
                                          <span class="label label-info" > 2 min chat</span>
                                            </a>
                                    </li>
                                     <li>
                                          <a href="#">
                                     <span class="glyphicon glyphicon-comment  text-warning" ></span>  
                                          Lorem ipsum dolor sit amet ipsum dolor sit amet
                                          <span class="label label-success" >GO ! </span>
                                            </a>
                                    </li>
                                    <li>
                                          <a href="#">
                                     <span class="glyphicon glyphicon-edit  text-danger" ></span>  
                                          Lorem ipsum dolor sit amet ipsum dolor sit amet
                                          <span class="label label-success" >Let's have it </span>
                                            </a>
                                    </li>
                                   </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="panel-footer">
                                <a href="#" class="btn btn-default btn-block"> <i class="glyphicon glyphicon-repeat"></i> Just A Small Footer Button</a>
                            </div>
                        </div>
                    </div>
                    <hr /> -->
                                       
                    <hr />
                     <div class="table-responsive">
	                     <c:choose>
				            <c:when test="${empty list}">
				                <h3>No list found to approve!</h3> 				                
				      		</c:when>
				      		<c:otherwise>
						            <table class="table table-striped table-bordered table-hover" id="table">
						                <thead>
	                                        <tr>
	                                            <th>Name</th>
	                                            <th>Age</th>
	                                            <th>SSN</th>
	                                            <th>Status</th>
	                                            <th>Email</th>
	                                            <th>#Approve#</th>
	                                        </tr>
                                    	</thead>
							             <c:forEach items="${list}" var="user">
							                 <tr>
							                    <td> ${user.userName}</td>
									            <td> ${user.age }</td>
									            <td> ${user.SSN}</td>
									            <td> ${user.request}</td>
							           			<td> ${user.email}</td>
							           			<td><a href="#"  class="btn btn-xs btn-danger" onclick="approve('${user.firstName}',this)">Approve Member</a></td>
							            	</tr>
							        	</c:forEach>
						            </table>
						    </c:otherwise>
				      	 </c:choose>         
                     </div>
                </div>
                <div class="col-md-6">
                    <div class="alert alert-danger">
						Send email after approving request.
                    </div>
                    <hr />
                     <div class="Compose-Message">               
                <div class="panel panel-success">
                    <div class="panel-heading">
                        Compose New Message 
                    </div>
                    <div class="panel-body">
                       <form action="sendmail" method="post">
                        <label>Enter Recipient Name : </label>
                        <input type="text" class="form-control" name="recipient"/>
                        <label>Enter Subject :  </label>
                        <input type="text" class="form-control" name="subject"/>
                        <label>Enter Message : </label>
                        <textarea rows="9" class="form-control" name="message"></textarea>
                        <hr/>
                        <input type="submit" name="send message" value="Send Mail">
                      </form>
                    </div>
                    <div class="panel-footer text-muted">
                        <strong>Note : </strong>Please note that we track all messages so don't send any spams.
                    </div>
                </div>
                     </div>
                </div>
            </div>
        </div>
    </div>
    <!-- CONTENT-WRAPPER SECTION END-->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    &copy; 2016 BookStop
                </div>

            </div>
        </div>
    </footer>
    <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
</body>
</html>
