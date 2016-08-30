<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BookStop: Free book hosting and renting website </title>
<link rel="stylesheet" media="all" href="${pageContext.servletContext.contextPath}/resources/home/homepage-015c5bc1ff6298df518be8acec2904f9.css">

<meta name="csrf-param" content="authenticity_token">
<meta name="csrf-token" content="mWvunjHVfcchvLULVlxlDSEcAXyaNNOSeEb3qEprR8cP2sMwQWI2a3cBEdIEzvzFQIIFKMdPLzdq1JMB8JL5Lg==">
<meta content="width=device-width, initial-scale=1.0, user-scalable=no" name="viewport">
<meta content="Sign up for free today, and start reading instantly!" name="description">
<meta content="311548868887910" property="fb:app_id">
<meta content="2fd24df97ba071a5364fba7b5b11eaa1" name="p:domain_verify">
<link href="${pageContext.servletContext.contextPath}/resources/home/css" rel="stylesheet" type="text/css">

<link rel="icon" type="image/x-icon" href="https://d2616tuem1neks.cloudfront.net/assets/modules/touch_icons/BB_196x196-c43b1fe62e40736092927cb49b8a31c4.png" sizes="196x196">
<link rel="apple-touch-icon" type="image/x-icon" href="https://d2616tuem1neks.cloudfront.net/assets/modules/touch_icons/BB_60x60-6fcd223aeea2a33e45401ef3df88d4fb.png">
<link rel="apple-touch-icon" type="image/x-icon" href="https://d2616tuem1neks.cloudfront.net/assets/modules/touch_icons/BB_76x76-ef6987199349cc5613d8ffa38df3d1db.png" sizes="76x76">
<link rel="apple-touch-icon" type="image/x-icon" href="https://d2616tuem1neks.cloudfront.net/assets/modules/touch_icons/BB_120x120-4ac929d60aedad7697c23a0902aa926f.png" sizes="120x120">
<link rel="apple-touch-icon" type="image/x-icon" href="https://d2616tuem1neks.cloudfront.net/assets/modules/touch_icons/BB_152x152-255b10e05014b710fe7c1e4e193035e8.png" sizes="152x152">
<link href="https://www.bookbub.com/home/" rel="canonical">

</head>
<body data-current-region="us" data-logged-in="false" data-subscribed="false">
<div class="site-alert" id="browser-notice" style="display:none; margin:0; padding:0">
<div class="container">
<p><strong>Great books are timeless, web browsers are not.</strong> It looks like your browser is out of date. We do our best to support a wide variety of browsers and devices, but BookStop works best in a modern browser. For help upgrading, check out <a href="http://www.whatbrowser.org/">http://www.whatbrowser.org/</a>.</p>
</div>
</div>
<div class="site-alert" id="cookie-notice" style="display:none; margin: 0; padding: 0">
<div class="container">
<p><strong>BookStop offers a great personalized experience.</strong> Unfortunately, your browser doesn't accept cookies, which limits how good an experience we can provide.  For more info on how to enable cookies, check out <a href="http://www.whatarecookies.com/enable.asp">http://www.whatarecookies.com/</a>.</p>
</div>
</div>

<div data="{&quot;user&quot;:{&quot;loggedIn&quot;:false,&quot;userId&quot;:null,&quot;emailAddress&quot;:null},&quot;features&quot;:{&quot;bookStoryModal&quot;:false,&quot;bookStoryComments&quot;:false,&quot;bookStoryMentions&quot;:false,&quot;bookStoryBookMentions&quot;:false,&quot;browseAuthors&quot;:false},&quot;profile&quot;:{},&quot;userSettings&quot;:{&quot;followAuthorsOfBooksRated&quot;:null}}" id="user-store-data"></div>


<div id="page-viewport">
<div id="page-content">

<div id="page-content">
<div class="topbar" id="top">
<div class="container">
<div class="menuitem">
<div class="tagline">
<p>Join millions of happy readers!</p>
</div>
</div>
<div class="menuitem">
</div>
<div class="menuitem">
<p class="sign-in">
  	<a href="getsearchpage">Search Books</a>
<c:choose>
  <c:when test="${empty sessionScope['person']}"> 
 	<span class="sign-in1">Already a member?</span>
	<a class="sign-in2" href="loginpage">Sign In</a>
  </c:when>
  <c:otherwise>
  	<a href="uploadbookspage">Upload Books</a>
  	Hello <c:out value="${person.userName}" />
    <a href="logout">Logout</a>
  </c:otherwise>
</c:choose>
</p>
</div>
</div>
</div>

<c:choose>
  <c:when test="${empty sessionScope['person']}"> 
		<div class="section1 top-wrapper" id="top">
			<div class="container homepage-content">
				<div class="row-inner">
					<div class="left-side">
						<div class="blackoverlay">
							<div class="header">Join BookStop Today!<span class="nextline"><br/></span> Join the community, contribute and collaborate!</div>
								<div class="desktop-signup-form">
									<form class="form-borderless subscribe-form" role="form" id="new_user" action="registerpage" accept-charset="UTF-8"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="mWvunjHVfcchvLULVlxlDSEcAXyaNNOSeEb3qEprR8cP2sMwQWI2a3cBEdIEzvzFQIIFKMdPLzdq1JMB8JL5Lg==">
										<div class="nav_text">
											<input type="submit" name="commit" value="Let&#39;s get started" class="subscribe-submit submitButton" id="subscribe-submit">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			<div>
			<span class="arrow-circle">
				<a href="https://www.bookbub.com/home/#section2" id="arrow" rel="relativeanchor">
					<img src="./BookBub_ Free Ebooks - Great deals on bestsellers you&#39;ll love_files/arrow-a4f5a8dfaf1d222196c4874b1f7f4aaf.png" alt="Arrow">
				</a>
			</span>
			</div>
		</div> 
  </c:when>
  <c:otherwise>
  	  <div class="section1 top-wrapper" id="top">
			<div class="container homepage-content">
				<div class="row-inner">
					<div class="left-side">
						<div class="blackoverlay">
							<div class="header">Hi <c:out value="${person.userName}" />!<span class="nextline"><br/></span> Start uploading your books now, gain points and borrow a new book! Economical you see!</div>
							</div>
						</div>
					</div>
				</div>
			<div>
				<span class="arrow-circle">
					<a href="https://www.bookbub.com/home/#section2" id="arrow" rel="relativeanchor">
						<img src="./BookBub_ Free Ebooks - Great deals on bestsellers you&#39;ll love_files/arrow-a4f5a8dfaf1d222196c4874b1f7f4aaf.png" alt="Arrow">
					</a>
				</span>
			</div>
	   </div> 
  </c:otherwise>
</c:choose>

<div class="section2" id="section2">
<div class="container">
<div class="row-inner">
<div class="center-align">
<div class="header">How it works</div>
<div class="subheader">BookStop connects you to millions of readers and students</div>
<div class="subheader">It's free to join, you can upload your books, rent out and help people low on cash</div>
<div class="subheader">And Hey! You can also borrow books from wide range of books including course books</div>
<div class="icons-container">
<ul id="list">
<li class="icon1">
<p>Tell us what you<br> like to read</p>
</li>
<li class="icon2">
<p>Get the daily email and browse your deals</p>
</li>
<li class="icon3">
<p>Download to any<br>device &amp; enjoy</p>
</li>
</ul>
</div>
<div class="hr-style">
<hr>
</div>
</div>
</div>
</div>
</div>
<div class="section4" id="section4">
<div class="container">
<div class="row-inner">
<div>
<div class="header">Join millions of happy readers</div>
<div id="testimonial-wrap">
<div class="testimonial_container">
<img class="bubble" src="${pageContext.servletContext.contextPath}/resources/home/bubble1-46243b049ee738f50f45e5febe8ae25a.png" alt="Bubble1">
<p class="blurb">“It's fantastic, and I'm super happy to lend my books to a fellow reader and make friends!”</p>
<div id="extra_space"></div>
<img class="reader" src="${pageContext.servletContext.contextPath}/resources/home/reader1-fd2a040a71666922f43d5bfaedf114fb.png" alt="Reader1">
</div>
<div class="testimonial_container">
<img class="bubble" src="${pageContext.servletContext.contextPath}/resources/home/bubble2-459dabf045fef0aa824856fb5c9b7874.png" alt="Bubble2">
<p class="blurb">“I would tell anyone to just sign up without reservation. I now have read more books than I can read in a lifetime.”</p>
<div id="extra_space" style="height: 84px;"></div>
<img class="reader" src="${pageContext.servletContext.contextPath}/resources/home/reader2-cf6a0632dfa88ce21bff1d654adf67a4.png" alt="Reader2">
</div>
<span class="bubble_block"></span>
<div class="testimonial_container">
<img class="bubble" src="${pageContext.servletContext.contextPath}/resources/home/bubble1-46243b049ee738f50f45e5febe8ae25a.png" alt="Bubble1">
<p class="blurb">“Coming to US,I could'nt believe how expensive course books were! I envy younger generation for an option to rent a book for a semster now on BookStop”</p>
<div id="extra_space" style="height: 73px;"></div>
<img class="reader" src="${pageContext.servletContext.contextPath}/resources/home/reader3-390eaa765484cea921402467f0a452b4.png" alt="Reader3">
</div>
<div class="testimonial_container">
<img class="bubble" src="${pageContext.servletContext.contextPath}/resources/home/bubble4-5657657858646f2f5822114faf4ed8c4.png" alt="Bubble4">
<p class="blurb">“It's said 'If we encounter a man of rare intellect, we should ask him what books he reads' I've connected with tons of like minded friends through BookStop”</p>
<div id="extra_space" style="height: 65px;"></div>
<img class="reader" src="${pageContext.servletContext.contextPath}/resources/home/reader4-91112dbdf997f939d3b226013c64fe33.png" alt="Reader4">
</div>
</div>
</div>
</div>
<div class="news-section">
<div class="container">
<h4>Company</h4>
<a href="aboutuspage">About Us</a>
</div>
</div>
<p class="small">© 2016 BookStop.  All rights reserved.</p>
</div>
</div>
</div>
<div style="width:0px; height:0px; display:none; visibility:hidden;" id="batBeacon0.8965321853228188"><img style="width:0px; height:0px; display:none; visibility:hidden;" id="batBeacon0.9203060299540813" width="0" height="0" src="./BookBub_ Free Ebooks - Great deals on bestsellers you&#39;ll love_files/0"><img style="width:0px; height:0px; display:none; visibility:hidden;" id="batBeacon0.4068620752988652" width="0" height="0" src="${pageContext.servletContext.contextPath}/resources/home/0(1)"></div><div style="display: none; visibility: hidden;"><script>(function(){var a=window._fbq||(window._fbq=[]);if(!a.loaded){var b=document.createElement("script");b.async=!0;b.src="//connect.facebook.net/en_US/fbds.js";var c=document.getElementsByTagName("script")[0];c.parentNode.insertBefore(b,c);a.loaded=!0}a.push(["addPixelId","821480571226892"])})();window._fbq=window._fbq||[];window._fbq.push(["track","PixelInitialized",{}]);</script>
<noscript></noscript></div></body></html>