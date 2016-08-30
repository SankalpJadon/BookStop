<html>
<head>
<title>Login Page</title>
	<link rel="stylesheet" media="all" href="${pageContext.servletContext.contextPath}/resources/upload/upload.css">
</head>
<body>
<h3>${msg}</h3>
<div class="login-page">
<div class="header">
<div>
 Hello <c:out value="${person.userName}" />
	<a href="logout">Logout</a>
	Your points: <c:out value="${points}" />
	<a href="getdeletebooks">Dashboard</a>
	<a href="gethomepage">Home Page</a>
</div>
</div>
  <div class="form">
  	<h3>Upload Books</h3>
    <form name="upload" class="login-form" action="uploadbooks" method="post" onsubmit="return validateform()">
      <input type="text" placeholder="Book Name" name="name"/><br>
      <input type="text" placeholder="ISBN" name="isbn"/><br>
      <input type="text" placeholder="No. of Days" name="noOfDays"/><br>
      <input type="text" placeholder="Price for duration" name="price"/><br><br>
      <select name="bookcategory">
	    <option value="mystery">Mystery</option>
	    <option value="fantasy">Fantasy</option>
	    <option value="literaryfiction">Literary Fiction</option>
	    <option value="children's">Children's</option>
	    <option value="thriller">Thriller</option>
	    <option value="romance">Romance</option>
	    <option value="sciencefiction">Science Fiction</option>
	    <option value="historical">Historical</option>
	    <option value="collegebook">College Book</option>
	  </select><br><br>
	  <input type="hidden" name="userName" value='${person.userName}'/>
      <input type="submit" name="submit"/><br><br>
      <p class="message">Upload later? <a href="getsearchpage">Search Page</a></p>
    </form>
  </div>
</div>

<script>
function validateform(){  
	var name=document.upload.name;
	var isbn=document.upload.isbn; 
	var noofdays=document.upload.noOfDays; 
	var price=document.upload.price; 


	debugger;
	
	/* Book Name Validation */
	var error = "";
    var illegalChars = /^([a-zA-Z]+\s)*[a-zA-Z]+$/; // allow letters, numbers, and underscores
 
    if (name.value == "") {
    	name.style.background = 'Yellow';
        error = "You didn't enter a Book Name.\n";
        alert(error);
        return false;
 
    }  else if(!name.value.match(illegalChars)) {
 		name.style.background = 'Yellow';
    		alert("Please enter a valid Book Name");
    		return false;
     }
    else {
    	name.style.background = 'White';
    } 
    
    /* ISBN Validation */
    
    
 	var error = "";
    var stripped = isbn.value.replace(/[\(\)\.\-\ ]/g, '');
 
  	 if (isbn.value == "") {
        error = "You didn't enter an ISBN.\n";
        isbn.style.background = 'Yellow';
        alert(error);
		return false;
 
   	 } 
  	 
  	 else if(!isbn.value.match(/^\+?(0|[1-9]\d*)$/))
     {
 		isbn.style.background = 'Yellow';
    		alert("Please enter a valid ISBN");
    		return false;
     }
  	 
  	 else if (isNaN(parseInt(stripped))) {
        error = "The ISBN contains illegal characters. Don't include dash (-)\n";
        isbn.style.background = 'Yellow';
        alert(error);
		return false;
     } 
  	 
   	 else if (!(stripped.length == 10)) {
        error = "The ISBN number is wrong length\n";
        isbn.style.background = 'Yellow';
        alert(error);
		return false;
     }
  	 
  	 /* No. of days Validation */
  	 if (noofdays.value==null || noofdays.value==""){ 
  		  noofdays.style.background = 'Yellow';
		  alert("No. of days can't be blank!");  
		  return false;  
		}  
  	
  	 else if(!noofdays.value.match(/^\+?(0|[1-9]\d*)$/))
    {
  		noofdays.style.background = 'Yellow';
   		alert("Please enter valid no. of days");
   		return false;
    }
	
	 else if (isNaN(noofdays.value)){
		  noofdays.style.background = 'Yellow';
		  alert("No. of days must be numbers!");  
		  return false;
	 }
  	 
  	/* Price Validation */
  	 if (price.value==null || price.value==""){ 	
  		  price.style.background = 'Yellow';
		  alert("Price can't be blank!");  
		  return false;  
		}  
  	
  	else if(!price.value.match(/^\+?(0|[1-9]\d*)$/))
    {
  		price.style.background = 'Yellow';
   		alert("Please enter valid no. of days");
   		return false;
    }
	
	 else if (isNaN(price.value)){
		  price.style.background = 'Yellow';
		  alert("Price must be a number!");  
		  return false;
	 }
  	
  	return true;
  	 
}
</script>
</body>
</html>