<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Search Navbar Template | PrepBootstrap</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/search/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/search/font-awesome/css/font-awesome.min.css" />

    <script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/search/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/search/bootstrap/js/bootstrap.min.js"></script>
	<script>
	function approveDecline(string1,rowelement)
		{
			var xRequest1;
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
	            	 var y= xRequest1.responseText;
						if(y){
							deleteRow(rowelement);
						}
						else{
			            	 alert("Request could not be completed at this time");
			            }
				}
			}
			xRequest1.open("get","approverejectrequest/"+string1,"true");
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
	<script>
	function requestDeclined(string1,string2)
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
			xRequest1.open("get","requestDeclined/"+string1,"true");
			xRequest1.send();
	}
	</script>

	<script>
	 
     function updateDetails(rowNo,x) {
    	 var xmlHttp;
         xmlHttp = new XMLHttpRequest();
         if (xmlHttp == null)
         {
             alert("Your browser does not support AJAX!");
             return;
         }
         var isbn=document.getElementById("bookisbn"+rowNo).value;
         var name=document.getElementById("bookname"+rowNo).value;
         var price=document.getElementById("bookprice"+rowNo).value;
         var noOfDays=document.getElementById("noofdays"+rowNo).value;
         var query = "name="+name+"&isbn="+isbn+"&price="+price+"&noOfDays="+noOfDays;
         
         xmlHttp.onreadystatechange = function stateChanged()
         {
             if ((xmlHttp.readyState == 4)&& (xmlHttp.status==200))
             {
      
            	 var y= xmlHttp.responseText;
					if(y){
						alert("Book updated successfully ");
					}
					else{
		            	 alert("Book could not be updated, enter valid data ");
		            }
             }
             
         };         
         xmlHttp.open("POST", "updatebook", true);
         xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
         xmlHttp.send(query);
     }
	</script>
	
	<script>
	 
     function deleteBook(rowNo,x) {
    	 var xmlHttp;
         xmlHttp = new XMLHttpRequest();
         if (xmlHttp == null)
         {
             alert("Your browser does not support AJAX!");
             return;
         }
         var isbn=document.getElementById("bookisbn"+rowNo).value;
 
         var query = "isbn=" + isbn;
         xmlHttp.onreadystatechange = function stateChanged()
         {
             if ((xmlHttp.readyState == 4)&& (xmlHttp.status==200))
             {
               var result= xmlHttp.responseText;
               var y= "true";
               alert(string.indexOf(y)>-1);
               if(y){
            	   alert("Book deleted successfully!");
            	   deleteRow(x);
               }
               else{
            	   alert("Sorry, book has pending transactions, can't be deleted!");
               }
             }
         };         
         xmlHttp.open("POST", "deletebook", true);
         xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
         xmlHttp.send(query);
     }
	</script>
	
	<script>
	function numbersonly(e){
	    var unicode=e.charCode? e.charCode : e.keyCode
	    if (unicode!=8){ //if the key isn't the backspace key (which we should allow)
	        if (unicode<48||unicode>57) //if not a number
	            return false //disable key press
	    }
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
	   			<a href="getsearchpage">Search Page</a>
	    	<a href="logout">Logout</a>
	    </c:when>
	    <c:when test="${!person.request}">
	   			Hello <c:out value="${person.userName}" />
	   			You can't upload books. Request pending with admin!
	    	<a href="logout">Logout</a>
	    </c:when>
    </c:choose>
  </c:otherwise>
</c:choose>
<div class="page-header">
    <h1>Manage your books</h1>
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

<!-- Search Navbar - END -->
<h4><u>Approve/Reject requested books</u></h4>
<div class="table-responsive">
	        		<c:choose>
				            <c:when test="${empty personApprovalBookList}">
				                <h6>No Books Found for approval :P</h6> 				                
				      		</c:when>
				      		<c:otherwise>
									<table class="table table-striped table-bordered table-hover">
						                <thead>
	                                        <tr>
	                                            <th>Name</th>
	                                            <th>ISBN</th>
	                                            <th>NUMBER OF DAYS</th>
	                                            <th>PRICE</th>
	                                            <th>BORROWER</th>
	                                            <th>APPROVE/REJECT</th>
	                                            
	                                        </tr>
                                    	</thead>
							             <c:forEach items="${personApprovalBookList}" var="approvalBook">
							                 <tr>
							                    <td> ${approvalBook.name}</td>
									            <td> ${approvalBook.isbn }</td>
									            <td> ${approvalBook.noOfDays}</td>
							           			<td> ${approvalBook.price}</td>
							           			<td> ${approvalBook.borrowerId}</td>
							           			<td> <button type="button" class="btn btn-info btn-lg" onclick="approveDecline('${approvalBook.isbn}'+'approve',this)">Approve</button></td>
							            		<td> <button type="button" class="btn btn-info btn-lg" onclick="approveDecline('${approvalBook.isbn}'+'reject',this)">Reject</button></td>
							            	</tr>
							        	</c:forEach>
						            </table>
							</c:otherwise>
					</c:choose>    
</div>
<div>
	<hr>
</div>

<h4><u>Books uploaded by you!</u></h4>
<div class="table-responsive">
	        		<c:choose>
				            <c:when test="${empty personBookList}">
				                <h6>No Books Found :P</h6> 				                
				      		</c:when>
				      		<c:otherwise>
				      		<form method="GET" id="bookupdate" action="bookupdate"></form>
									<table class="table table-striped table-bordered table-hover">
						                <thead>
	                                        <tr>
	                                            <th>Name</th>
	                                            <th>ISBN</th>
	                                            <th>NUMBER OF DAYS</th>
	                                            <th>PRICE</th>
	                                            <th>DELETE</th>
	                                            <th>UPDATE</th>
	                                        </tr>
                                    	</thead>
                                    	 <c:set var="index" value="${1}"/>
							             <c:forEach items="${personBookList}" var="book">
							                 <tr id="rowNo${index}">
								                 <form name="update" id="updatedelete" method="GET">
								                    <td><input type="text" id="bookname${index}" value="${book.name}" name="name" disabled="disabled"> </td>
										            <td><input type="text" id="bookisbn${index}" value="${book.isbn}" name="isbn" disabled="disabled"></td>
										            <td><input type="text" id="noofdays${index}" value="${book.noOfDays}" name="noOfDays" onkeypress="return numbersonly(event)"></td>
								           			<td><input type="text" id="bookprice${index}" value="${book.price}" name="price" onkeypress="return numbersonly(event)"></td>
								           			<td><input type="submit" id="update${index}" value="Update" onclick="updateDetails('${index}',this)" />
								           			<td><input type="submit" id="update${index}" value="Delete" onclick="deleteBook('${index}',this)" />
								           		 </form>
							            	</tr>
							            	<c:set var="index" value="${index+1}"/>
							        	</c:forEach>
						            </table>
							</c:otherwise>
					</c:choose>    
</div>

<div>
	<hr>
</div>
<h4><u>Borrowed Books</u></h4>
<div class="table-responsive">
	        		<c:choose>
				            <c:when test="${empty borrowedBookList}">
				                <h6>No Borrowed Books</h6> 				                
				      		</c:when>
				      		<c:otherwise>
									<table class="table table-striped table-bordered table-hover">
						                <thead>
	                                        <tr>
	                                            <th>Name</th>
	                                            <th>ISBN</th>
	                                            <th>NUMBER OF DAYS</th>
	                                            <th>PRICE</th>
	                                            <th>STATUS</th>
	                                        </tr>
                                    	</thead>
							             <c:forEach items="${borrowedBookList}" var="borrowedBookList">
							                 <tr>
							                    <td> ${borrowedBookList.name}</td>
									            <td> ${borrowedBookList.isbn }</td>
									            <td> ${borrowedBookList.noOfDays}</td>
							           			<td> ${borrowedBookList.price}</td>
							           			<c:choose>
							           				<c:when test="${borrowedBookList.request eq 1}">
							           					<td> Pending Approval from lender</td>
							           				</c:when>
							           				<c:when test="${borrowedBookList.request eq 2}">
							           					<td> Approved by the lender! You can collect it from  <c:out value="${borrowedBookList.person.street}"/></td>
							           				</c:when>
							           				<c:otherwise>
							           					<td> Approval Rejected by the lender </td>
							           				</c:otherwise>
							           			</c:choose>
							           			<c:choose>
							           				<c:when test="${borrowedBookList.request eq 3}">
							           					<td> <button type="button" class="btn btn-info btn-lg" onclick="requestDeclined('${borrowedBookList.isbn}',this)">OK</button></td>
							           				</c:when>
							           				<c:when test="${borrowedBookList.request eq 2}">
							           					<td> <button type="button" class="btn btn-info btn-lg" onclick="requestDeclined('${borrowedBookList.isbn}',this)">RETURN</button></td>
							           				</c:when>
							           				<c:when test="${borrowedBookList.request eq 1}">
									           			<td> Wait </td>							           					
							           				</c:when>
							           			</c:choose>
							            	</tr>
							        	</c:forEach>
						            </table>
							</c:otherwise>
					</c:choose>    
</div>

<div>
	<hr>
</div>

</div>

</body>
</html>
