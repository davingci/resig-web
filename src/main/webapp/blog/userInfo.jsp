<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>userInfo Page</title>

		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

   <!-- bootstrap & fontawesome & ace & jquery & google fonts-->

		<link rel="stylesheet" href="<%= request.getContextPath()%>/vendor/bootstrap-3.3.6/bootstrap.min.css" />
		<link rel="stylesheet" href="<%= request.getContextPath()%>/vendor/font-awesome-4.7.0/css/font-awesome.min.css" />
		<link rel="stylesheet" href="<%= request.getContextPath()%>/vendor/google-fonts/fonts.googleapis.com.css" />

		
		<link rel="stylesheet" href="<%= request.getContextPath()%>/css/resig.css" />

		

		<script src="<%= request.getContextPath()%>/vendor/jquery-1.11.3/jquery-1.11.3.min.js"></script>
	
		<script src="<%= request.getContextPath()%>/vendor/bootstrap-3.3.6/bootstrap.min.js"></script>

		<script src="<%= request.getContextPath()%>/js/resig.js"></script>

		<link rel="stylesheet" href="<%= request.getContextPath()%>/css/jianshu.css" />
		<link rel="stylesheet" href="<%= request.getContextPath()%>/css/main.css" />
		<link rel="stylesheet" href="<%= request.getContextPath()%>/css/resigBlog.css" />
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/resigUserInfo.css" />
        <script src="<%= request.getContextPath()%>/vendor/moment/moment.min.js"></script>






<style>
</style>

</head>

<body>

	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
 	 <div class="width-limit" style="margin: 0 30px 0 30px">
 		 <!--top-left logo-->
 		 <a class="navbar-brand" href ="#" style="color:#ea6f5a;font-size: 24px; padding-top: 15px">Resig</a>
 		 <!--top-right sign in and register-->
		 <a id="user-log-off" href="#" class="navbar-brand pull-right" style="color:#ea6f5a; font-size: 18px; padding-top: 15px">
 		 	Sign Up<span class="glyphicon glyphicon-user"></span></a>

		 <a id="sign-up-user" href="#" class="navbar-brand pull-right" style="color:#ea6f5a; font-size: 18px; padding-top: 15px">
 		  Log In<span class="glyphicon glyphicon-log-in"></span></a>


 	 </div>
 	 <div class="container">
 			 <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu" aria-expanded="false">
 				 <span class="icon-bar"></span>
 				 <span class="icon-bar"></span>
 				 <span class="icon-bar"></span>
 			 </button>

 		 <div class="collapse navbar-collapse" id="menu">
 			 <ul class="nav navbar-nav">
 				 <li class="active" style="border:0; padding-top: 5px;">
 				   <a class="nav-brand" href="#" style="font-size: 18px;"><span class="glyphicon glyphicon-home" style="margin:0 10px 0 0"></span>HOME</a>
 			   </li>
 				 <li class="search" style="border:0;">
 					 <form target="_blank" accept-charset="UTF-8" action="">
 						 <input name="uft8" type="hidden" value="">
 						 <input type="text" name="sea" id="sea" value autocomplete="off" placeholder="search" class="search-input" data-mounted="1">
 						 <a class="search-btn" href="javascript:void(null)" style="font-size:24px"><span class="glyphicon glyphicon-search"></span></a>
 						 <div id="navbar-search-tips" style="display:none;"></div>
 					 </form>
 				 </li>
 			 </ul>
 		 </div>
    </div>
  </nav>
  
<div class="container person">
	<div class="row">
		<div class="col-xs-16 main">
			<div class="main-top">
				<a class="avatar" href="#" >
					<img src="./pic/avatar-list1.png" alt="240">
				</a>
				<button data-v-num class="btn btn-success follow" >
					<i class="fa fa-plus" aria-hidden="true"></i>
					<span data-v-num>Follow</span>
				</button>
				<a class="btn btn-hollow" href="">Mail Author</a>
				<div class="title" style="padding: 5px 0 0 100px;">
					<a class="name" href="">loginUserId</a>
				</div>
				<div class="info">
					<ul>
						<li>
							<div class="meta-block">
								<a href=""><p>883</p>Follow<i class="iconfont ic-arrow"></i></a>
							</div>
						</li>
						<li>
							<div class="meta-block">
								<a href=""><p>883</p>Fans<i class="iconfont ic-arrow"></i></a>
							</div>
						</li>
						<li>
							<div class="meta-block">
								<a href=""><p>883</p>Blogs<i class="iconfont ic-arrow"></i></a>
							</div>
						</li>
						<li>
							<div class="meta-block">
								<a href=""><p>883</p>Words<i class="iconfont ic-arrow"></i></a>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<ul class="trigger-menu" data-pjax-container="#list-container">
				<li class="active">
					<a href=""><i class="fa fa-file-text-o" aria-hidden="true"></i>Blog</a>
				</li>
				<li class>
					<a href=""><i class="fa fa-comments" aria-hidden="true"></i>New Comments</a>
				</li>
				<li class>
					<a href=""><i class="fa fa-thermometer-full" aria-hidden="true"></i>Hot Topics</a>
				</li>
			</ul>
			<div id="list-container">
				<ul class="note-list" infinite-scroll-url="#">
				</ul>
			</div>
		</div>
		<div class="col-xs-7 col-xs-offset-1 aside">
			<div class="title">Myself</div>
			<div class="description">
				<div class="js-intro">Why do blog?</div>
			</div>
			<div id="user-publications"></div>
			<ul class="list user-dynamic">
				<li>
					<a href=""><i class="fa fa-list" aria-hidden="true"></i><span style="font-size: 20px">My Blogs</span></a>
				</li>
				<li>
					<a href=""><i class="fa fa-th-large" aria-hidden="true"></i><span style="font-size: 20px">My Interests</span></a>
				</li>
			</ul>
			<div></div>
		</div>
	</div>
</div>
  



<script>




$(function(){
		//var token = "Bearer " + "<%= session.getAttribute("token")%>";
		//var loginUserId = "<%= session.getAttribute("userId") %>";
		//var loginUsername = "<%= session.getAttribute("username") %>";
		
	var para = getParaFromUrl();
	//console.log(para);
	var userId = para.userId;


});//end ready

function getParaFromUrl() {

	  var url = location.search; //obtain substring after '?'
	   var paraFromUrl = new Object();
	   if (url.indexOf("?") != -1) {
	      var str = url.substr(1);
	      strs = str.split("&");
	      for(var i = 0; i < strs.length; i ++) {
	         paraFromUrl[strs[i].split("=")[0]]=(strs[i].split("=")[1]);
	      }
	   }
	   return paraFromUrl;
	}



</script>


  </body>
 </html>
