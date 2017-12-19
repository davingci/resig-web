<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>Setting Profile</title>

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
*, :after, :before {
	box-sizing: border-box;
}

.row {
	margin-left: -15px;
	margin-right: -15px;
}
.avatar {
	display: block;
	cursor: pointer;
}
img {
	vertical-align: middle;
}
.avatar img {
	width: 100%;
	height: 100%;
	border: 1px solid #ddd;
	border-radius: 50%;
}
.setting .row{
	padding-top: 30px;
}
.setting .main {
	padding-left: 0;
}
.setting .main .avatar {
	width: 100px;
	height: 100px;
}
.setting .main. .top-line {
	padding-top: 0;
}
table {
	background-color: transparent;
	border-collapse: collapse;
	border-spacing: 0;
}
thead {
	display: table-header-group;
	vertical-align: middle;
	border-color: inherit;
}
caption, th {
	text-align: left;
}
td, th {
	padding: 0;
}
tbody {
	display: table-row-group;
	wertical-align: middle; 
	border-color: inherit;
}

.setting .main table {
	width: 100%;
}
.setting .main td {
	padding: 20px 0;
}
.setting .main tr{
	border-bottom: 1px solid #f0f0f0;
}
.setting .main tr:last-child{
	border: none;
}

.setting .main .base tr:first-child {
	border:none;
}
.setting .main .setting-head {
	width: 150px;
}
.setting .main .top-line {
	padding-top: 0;
}
.setting .main .setting-title {
	font-size: 15px;
	color: #969696;
}
.setting .main input[type=email], .setting .main input[type=text]{
	padding: 5px 10px;
	font-size: 15px;
	border: 1px solid #c8c8c8;
	border-radiud: 4px;
	background-color: hsla(0, 0%, 71%, .1);
}

ul {
	margin-top: 0;
	margin-bottom: 10px;
}
a, body {
	color: #333;
}
a {
	cursor: pointer;
	text-decoration: none;
}
.setting .aside {
	position: fixed;
	top: 0;
	bottom: 0;
	margin: 86px 0 0;
	padding: 0 0 30px;
	width: 280px;
	overflow: auto;
}
.setting .aside a {
	padding: 10px 15px;
	font-size: 15px;
	display: block;
}
.setting .aside .setting-icon {
	margin-right: 15px;
	padding-top: 6px;
	width: 32px;
	height: 32px;
	text-align: center;
	color: #fff;
	background-color: #a0a0a0;
	border-radius: 4px;
	display: inline-block;
	vertical-align: middle;
}
.setting .aside li.active a, .setting . aside li:hover a {
	background-color: #f0f0f0;
	border-radius: 4px;
}



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
  
<div class="container setting">
	<div class="row">
		<div class="aside" style="list-style:none;">
			<ul>	
				<li>
					<a href="/setting/profile" class="setting-list">
						<div class="setting-icon"><i style="font-size:20px" class="fa fa-id-card" aria-hidden="true"></i></div>
						<span>Profile</span>
					</a>
				</li>
				<li>
					<a href="/setting/account"  class="setting-list">
						<div class="setting-icon"><i style="font-size:20px" class="fa fa-cog" aria-hidden="true"></i></div>
						<span>Account</span>
					</a>
				</li>
			</ul>
		</div>
		<div class="col-xs-16 col-xs-offset-8 main">
			<table >
				<thead>
					<tr>
						<th class="setting-head responsive-head"></th>
						<th></th>
					</tr>
				</thead>
				<tbody class="base">
					<tr>
						<td class="top-line">
							<div class="avatar">
								<img src="pic/pic-list1.jpg">
							</div>
						</td>
						<td class="top-line">
							<a class="btn btn-hollow">
								<input unselectable="on" type="file" class="hide">Change Photo
							</a>
						</td>
					</tr>
					<tr>
						<td class="setting-title">Nickname</td>
						<td>
							<input type="text" placeholder="new nickname">
						</td>
					</tr>
					<tr>
						<td class="setting-title">Email</td>
						<td>
							<form>
								<input type="button" value="Send" class="btn btn-hollow pull-right">
								<input type="email" placeholder="new email address">
							</form>
						</td>
					</tr>				
				</tbody>
			</table>
			<input type="submit" class="btn btn-success setting-save" value="Save">
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
	
	$(document).on('click', 'a.setting-list', function(e){
	var href = $(this).attr('href'); 
	//console.log(para);
	var index = href.lastIndexOf("\/");
	var paraFromAtag = href.substring(index + 1, para.length);
	//console.log(paraFromAtag);
	e.preventDefault();
	switch(paraFromAtag){
	case "profile":
		var template = 			'<table >' +
		'<thead>' +
		'<tr>' +
'			<th class="setting-head"></th>' +
'			<th></th>' +
'		</tr>' +
'	</thead>' +
'	<tbody class="base">' +
'		<tr>' +
'			<td class="top-line">' +
'				<div class="avatar">' +
'					<img src="pic/pic-list1.jpg">' +
'				</div>' +
'			</td>' +
'			<td class="top-line">' +
'				<a class="btn btn-hollow">' +
'					<input unselectable="on" type="file" class="hide">Change Photo' +
'				</a>' +
'			</td>' +
'		</tr>' +
'		<tr>' +
'			<td class="setting-title">Nickname</td>' +
'			<td>' +
'				<input type="text" placeholder="new nickname">' +
'			</td>' +
'		</tr>' +
'		<tr>' +
'			<td class="setting-title">Email</td>' +
'			<td>' +
'				<form>' +
'					<input type="button" value="Send" class="btn btn-hollow pull-right">' +
'					<input type="email" placeholder="new email address">' +
'				</form>' +
'			</td>' +
'		</tr>		' +		
'	</tbody>' +
'</table>'+
'<input type="submit" class="btn btn-success setting-save" value="Save">';
	if(!$('tbody').is('.base')){
		$('table').remove();
 		$('.main').prepend(template); 		
	}
		break;
	case "account":
		console.log('account button clicked.')
				var template = 			'<table >' +
		'<thead>' +
		'<tr>' +
'			<th class="setting-head"></th>' +
'			<th></th>' +
'		</tr>' +
'	</thead>' +
'	<tbody class="account">' +
'		<tr>' +
'			<td class="setting-title top-line">' +
'				Download My Bolgs' +
'			</td>' +
'			<td class="top-line">' +
'				<a class="btn btn-hollow" href="/download">Download' +					
'				</a>' +
'			</td>' +
'		</tr>' +
'		<tr>' +
'			<td class="setting-title">Delete Account</td>' +
'			<td>' +
'				<a class="btn btn-delete">Delete Account</a>' +
'			</td>' +
'		</tr>' +	
'	</tbody>' +
'</table>';
 
	if(!$('tbody').is('.account')){
		$('table').remove();
		$('.main').prepend(template);		
	}
	if($('tbody').is('.account')){
		$('.setting-save').remove();
	}
		break;
	default: 
		console.log("get tag para failure");
	}
		
	});
	

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
