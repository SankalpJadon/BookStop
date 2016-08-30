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
  	<h3>Member Login</h3>
    <form class="login-form" action="login" method="post" >
      <input type="text" placeholder="User Name" name="userName"/>
      <input type="password" placeholder="Password" name="password"/>
      <input type="submit" name="login" value="Login"/> 
      <p class="message">Not registered? <a href="registerpage">Create an account</a></p>
    </form>
  </div>
</div>
	<h3>${msg}</h3>
</body>
</html>