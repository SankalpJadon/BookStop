<html>
<head>
<title>Login Page</title>
	<link rel="stylesheet" media="all" href="${pageContext.servletContext.contextPath}/resources/login/login.css">


</head>
<body>
<div class="login-page">
<div>
<a href="gethomepage"><b>Home Page</b></a>
</div>
  <div class="form">
  	<h3>Member Registration</h3>
    <form name="register" class="login-form" ModelAttribute="person" action="register" method="post" onsubmit="return validateform()">
      <input type="text" placeholder="User Name" name="userName"/><br>
      <input type="text" placeholder="Email" name="email"/><br>
      <input type="text" placeholder="First Name" name="firstName"/><br>
      <input type="text" placeholder="Last Name" name="lastName"/><br><br>
      <input type="text" placeholder="age" name="age"/><br><br>
      <input type="text" placeholder="SSN" name="SSN"/><br><br>
      <input type="text" placeholder="Street" name="street"/><br><br>
      <input type="text" placeholder="zip code" name="zip"/><br><br>
      <input type="password" placeholder="Password" name="password"/><br><br>
      <input type="password" placeholder="Confirm Password" name="confirmPassword"/><br><br>
      <input type="submit" name="submit"/><br><br>
      <p class="message">Already registered? <a href="loginpage">Login</a></p>
    </form>
  </div>
</div>
<h3>${msg}</h3>

<script>  
function validateform(){  
	var username=document.register.userName;  
	var password=document.register.password; 
	var confirmpassword=document.register.confirmPassword; 
	var firstname=document.register.firstName; 
	var lastname=document.register.lastName; 
	var age=document.register.age; 
	var street=document.register.street; 
	var email=document.register.email; 
	var ssn=document.register.SSN; 
	var zip=document.register.zip; 
	
	
	/* username */
	var error = "";
    var illegalChars = /\W/; // allow letters, numbers, and underscores
 
    if (username.value == "") {
    	username.style.background = 'Yellow';
        error = "You didn't enter a username.\n";
        alert(error);
        return false;
 
    } else if (username.value.length > 15) {
    	username.style.background = 'Yellow';
        error = "The username should be small\n";
		alert(error);
		return false;
 
    } else if (illegalChars.test(username.value)) {
    	username.style.background = 'Yellow';
        error = "The username can only contains letters, numbers and underscore.\n";
		alert(error);
		return false;
 
    } else {
    	username.style.background = 'White';
    } 
	
    /*  Email Validation */
    
    if (email.value == "") {
    	email.style.background = 'Yellow';
        error = "You didn't enter an email.\n";
        alert(error);
        return false;
 
    }
    var apos=email.value.indexOf("@");
    var dotpos=email.value.lastIndexOf(".");
    if (apos<1||dotpos-apos<2){
    	email.style.background = 'Yellow';
        alert("Invalid Email");
        return false; 
    } 
    
    
    /* FirstName */
	if (firstname.value==null || firstname.value==""){ 
		firstname.style.background = 'Yellow';
		alert("First name can't be blank!");  
		return false;  
	} 

	else if(!firstname.value.match(/^[a-zA-Z\s]*$/))
    {
		firstname.style.background = 'Yellow';
   		alert("Please enter a valid First Name");
   		return false;
    }


	/* LastName */
	if (lastname.value==null || lastname.value==""){  
		lastname.style.background = 'Yellow';
		alert("Last name can't be blank!");  
		return false;  
	} 

	else if(!lastname.value.match(/^[a-zA-Z\s]*$/))
    {
		lastname.style.background = 'Yellow';
   		alert("Please enter a valid Last Name");
   		return false;
    }
	
	
/* Age Validation  */
	
	if (age.value==null || age.value==""){ 
		  age.style.background = 'Yellow';
		  alert("Age can't be blank!");  
		  return false;  
		}  
	
	else if (isNaN(age.value)){
		age.style.background = 'Yellow';
		alert("Age must be numbers!");  
		  return false;
	}
	
	/* SSN */
	else if (ssn.value==null || ssn.value==""){ 
		  ssn.style.background = 'Yellow';
		  alert("SSN can't be blank!");  
		  return false;  
	}
	
	/* Street validation */
    var error = "";
    var illegalChars = /[\W_]/; // allow only letters and numbers
 
    if (street.value == "") {
    	street.style.background = 'Yellow';
        error = "You didn't enter a street name\n";
        alert(error);
        return false;
 
    } else if (illegalChars.test(street.value)) {
        error = "The Street contains illegal characters.\n";
        street.style.background = 'Yellow';
        alert(error);
        return false;
 
    } else if ( (street.value.search(/[a-zA-Z]+/)==-1) || (street.value.search(/[0-9]+/)==-1) ) {
        error = "The Street must contain at least one numeral.\n";
        street.style.background = 'Yellow';
        alert(error);
        return false;
    } 
	
/* Zip Code Validation */
	
	if (zip.value==null || zip.value ==""){  
		  zip.style.background = 'Yellow';
		  alert("Zip can't be blank!");  
		  return false;  
		} 
	
	else if (isNaN(zip.value)){
		zip.style.background = 'Yellow';
		alert("Zip must be numbers!");  
		return false;
	}

    if(!zip.value.match(/^\d+$/))
        {
    	zip.style.background = 'Yellow';
        alert("Please only enter numeric characters only for Zip! (Allowed input:0-9)");
        return false; 
        }
    else if ((zip.value.length < 5) || (zip.value.length > 6)) {
        error = "Zip is of incorrect length \n";
        zip.style.background = 'Yellow';
        alert(error);
        return false; 

    }
 /* password validation */ 
    
    var error = "";
    var illegalChars = /[\W_]/; // allow only letters and numbers
 
    if (password.value == "") {
    	password.style.background = 'Yellow';
        error = "You didn't enter a password.\n";
        alert(error);
        return false;
 
    } else if ((password.value.length < 7) || (password.value.length > 15)) {
        error = "The password is small. \n";
        password.style.background = 'Yellow';
        alert(error);
        return false;
 
    } else if (illegalChars.test(password.value)) {
        error = "The password contains illegal characters.\n";
        password.style.background = 'Yellow';
        alert(error);
        return false;
 
    } else if ( (password.value.search(/[a-zA-Z]+/)==-1) || (password.value.search(/[0-9]+/)==-1) ) {
        error = "The password must contain at least one numeral.\n";
        password.style.background = 'Yellow';
        alert(error);
        return false;
 
    }    

    /* Confirm Password validation */	
	if (confirmpassword==null || confirmpassword==""){
		  confirmpassword.style.background = 'Yellow';
		  alert("Please confirm your password!");  
		  return false;  
	} 
    
    return true;
} 

</script> 

</body>
</html>