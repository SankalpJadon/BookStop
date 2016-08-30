<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Search Navbar Template | PrepBootstrap</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/search/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/search/font-awesome/css/font-awesome.min.css" />

    <script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/search/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/search/bootstrap/js/bootstrap.min.js"></script>
	<script>
	function borrow(string1,string2)
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
					console.log(x);
					if(x){
						alert("Congrats! Your request for the book with the ISBN:"+string1+"sent to the lender! Sit back, your approval is on its way!");
						deleteRow(string2);
					}
					else{
						alert("Sorry you don't have sufficient points! Don't you worry, just upload a book and earn 20 points!");
					}
					
				}
				
			}
			xRequest1.open("get","borrowbook/"+string1,"true");
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

<div class="container">
<a href="gethomepage">Home Page</a>
<c:choose>
  <c:when test="${empty sessionScope['person']}"> 
 	<p class="support-prompt small">Already a member? <a href="loginpage">Sign In</a></p> 
  </c:when>
  <c:otherwise>
   	<c:choose>
   		<c:when test="${person.request}">
	   		<a href="uploadbookspage">Upload Books</a>
	   			Hello <c:out value="${person.userName}" />
	   			<a href="getdeletebooks">Dashboard</a>
	    	<a href="logout">Logout</a>
	    </c:when>
	    <c:when test="${!person.request}">
	   			Hello <c:out value="${person.userName}" />
	   			You can't upload books. Request pending with admin.
	    	<a href="logout">Logout</a>
	    </c:when>
    </c:choose>
  		Your points: <c:out value="${points}" />
  </c:otherwise>
</c:choose>
<div class="page-header">
    <h1>Search For Books </h1>
</div>

<!-- Search Navbar - START -->
<nav class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">BookStop</a>
    </div>
</nav>
	<div class="table-responsive">
	                     <c:choose>
				            <c:when test="${empty bookList}">
				                <h3>No Books Found :P</h3> 				                
				      		</c:when>
				      		<c:otherwise>
				      			<c:choose>
									<c:when test="${empty sessionScope['person']}"> 
										<table class="table table-striped table-bordered table-hover">
						                <thead>
	                                        <tr>
	                                            <th>Name</th>
	                                            <th>ISBN</th>
	                                            <th>NUMBER OF DAYS</th>
	                                            <th>PRICE($)</th>
	                                            <th>STREET</th>
	                                            <th>OWNER</th>
	                                            <th></th>
	                                        </tr>
                                    	</thead>
							             <c:forEach items="${bookList}" var="book">
							                 <tr>
							                    <td> ${book.name}</td>
									            <td> ${book.isbn }</td>
									            <td> ${book.noOfDays}</td>
							           			<td> ${book.price}</td>
							           			<TD> ${book.person.street}</TD>
							           			<td> ${book.person.firstName}</td>
							           			<td><a href="loginpage">Login to borrow</a></td>
							            	</tr>
							        	</c:forEach>
						            </table>
									</c:when>
									<c:otherwise>
									  	<table class="table table-striped table-bordered table-hover">
						                <thead>
	                                        <tr>
	                                            <th>Name</th>
	                                            <th>ISBN</th>
	                                            <th>NUMBER OF DAYS</th>
	                                            <th>PRICE</th>
	                                            <th>STREET</th>
	                                            <th>OWNER</th>
	                                            <th></th>
	                                        </tr>
                                    	</thead>
							            <c:forEach items="${excludingPersonList}" var="book">
							                 <tr>
							                    <td> ${book.name}</td>
									            <td> ${book.isbn }</td>
									            <td> ${book.noOfDays}</td>
							           			<td> ${book.price}</td>
							           			<TD> ${book.person.street}</TD>
							           			<td> ${book.person.userName}</td>
							           			<td> <button type="button" class="btn btn-info btn-lg" onclick="borrow('${book.isbn}',this)">Borrow this book</button></td>
											</tr>
							        	</c:forEach>
						            </table>
									</c:otherwise>
								</c:choose>
						    </c:otherwise>
				      	 </c:choose>         
	</div>
</div>


  
</body>
</html>
