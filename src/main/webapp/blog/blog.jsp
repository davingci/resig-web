<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>Blog Page</title>

		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

        <%@ include file="../include.jsp" %>

		<link rel="stylesheet" href="css/jianshu.css" />
		<link rel="stylesheet" href="css/main.css" />
		<link rel="stylesheet" href="css/resigBlog.css" />

        <script src="assets/vendor/moment/moment.min.js"></script>






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
 						 <a class="search-btn" href="javascript:void(null)" style="font-size:24px"><span class="glyphicon glyphicon-search"></span></i></a>
 						 <div id="navbar-search-tips" style="display:none;"></div>
 					 </form>
 				 </li>
 			 </ul>
 		 </div>
    </div>
  </nav>
<div class="note">
	<div class="post">
		<div class="article">
			<h1 class="title" id="title1">Title</h1>
			<div class="author">
				<a class="avatar" href="">
				  <img id="avatar1" src="./pic/avatar-list1.png" alt="404">
			  </a>
				<div class="info">
					<span id="authorName1" class="name"><a href="#">author name</a></span>
					<!--follow button-->
					<a class="btn btn-success follow"><i class="fa fa-plus" aria-hidden="true"></i><span>Follow</span></a>
					<div class="meta">
						<span id="lastModifyAt1" class="publish-time">2017-11-1</span>
						<span id="wordage1" class="wordage">1000 words</span>
						<span id="viewCount1" class="views-count">100 views</span>
						<span class="comments-count">numOfComments</span>
						<span id="favouriteCount1" class="likes-count">10 likes</span>
					</div>
				</div>
			</div>
			<div id="html1" data-note-content class="show-content">
				blog goes here
			</div>
			<div class="" style="min-height:47px">
				<a id="editBtn" class="btn btn-danger" style="display:none; float:right; margin-top:4px; width:100px; font-size:16px;"><i class="fa fa-edit" aria-hidden="true"></i><span>Edit</span></a>
			</div>
		</div>
		<div class="follow-detail">
			<div class="info">
				<a id="avatar2" class="avatar" href="#"><img src="./pic/avatar-list1.png" alt="404"></a>
				<a class="btn btn-success follow"><i class="fa fa-plus" aria-hidden="true"></i><span id="markCount1">Follow</span></a>
				<a id="userId1" class="title" href="#">userId</a>
				<p id="info1">total 1000 words, 3 follows, 10 thumb up</p>
			</div>
			<div class="signature">
				user signature
			</div>
		</div>
		<div class="meta-bottom">
		</div>
		<div>
			<div id="comment-list" class="comment-list">
				<div>
					<form class="new-comment">
						<a class="avatar" href="#">
							<img src="./pic/avatar-list1.png" alt="404">
						</a>
						<div class="sign-container">
							<a href="#" class="btn btn-sign">Sign In</a>
							<span>before comment</span>
						</div>
					</form>
				</div>
				<div id="normal-comment-list" class="normal-comment-list">
					comments go here
				</div>
				<div></div>
			</div>
		</div>
	</div>
</div>
<div class="note-bottom">
	<div>
		<div class="recommend-note">
			<div class="meta">
			</div>
			<div class="list">
				<h3>recommended blog lists go here</h3>
				<div class="note have-img">list1</div>
				<div class="note have-img">list2</div>
				<div class="note have-img">list3</div>
				<div class="note have-img">list4</div>
				<div class="note have-img">list5</div>
			</div>
		</div>
	</div>
</div>

<script>




$(function(){
		//var token = "Bearer" + token<%= session.getAttribute("token")%>;
		//var loginUserId = <%= session.getAttribute("userId") %>;
		//var loginUsername = <%= session.getAttribute("username") %>;
		var loginUserId = '1';
		var para = getParaFromUrl();
		//console.log(para);
		var blogId = para.blogId;
		if (loginUserId == '') {
			//ajax without login
			var option = {
				"method" : "GET",
				"url" : "http://39.106.21.117:8080/v1/api/blog/get/" + blogId,
				"success" : function (response) {
					console.log(response);
					var data = response.data;
					$("#title1").html(data.title);
					$("#avatar1").attr("avatar", "");//to be added
					$("#authorName1").html(data.username + " " + data.userId);
					$("#markCount1").html(data.markCount + " Follow");
					$("#lastModifyAt1").html(moment(data.lastModifyAt).format("YYYY-MM-DD"));
					$("#wordage1").html(data.html.length + " Words");
					$("#viewCount1").html(data.viewCount + " Views");
					$("#favouriteCount1").html(data.favouriteCount + " Thumb Up");
					$("#html1").html(data.html);
					$("#avatar2").attr("avatar", "");//to be added
					$("#userId1").html(data.username + ' ' + data.userId);
					$("#info1").html("total " + data.html.length + " words, " + data.markCount + " follow and " + data.favouriteCount + " Thumb Up");
				}
			};
			$.ajax(option);
		}//end if
		else {
			//handlig navbar
			//then ajax
			console.log('loginUserId ' + loginUserId);
			//userInfo path
			//var userInfo = '<%= request.getContextPath()%>/pages/blog/resig-userInfo.jsp?userId=' + userId

			//navbar manipulate
			var userInfo = loginUserId;
			$("#sign-up-user").attr('target','_blank')
												.attr('href', userInfo)
												.html('Welcome ' + loginUserId);
			$("#sign-up-user span").remove();
      //Log off and redirct to index page
			var indexPath = 'resig-index-ajax.html';
			var $userLogOff = $("#user-log-off");
			$userLogOff.attr('href', indexPath)
								 .html('Log Off');
			$userLogOff.on('click', function(e){
				console.log('clear sessionStorage');
				window.localStorage.clear();
			});
     //ajax and manipulate main
			var option = {
				"method" : "GET",
				"url" : "http://39.106.21.117:8080/v1/api/blog/get/" + blogId,
				"success" : function (response) {
					//console.log(response);
					var data = response.data;
					$("#title1").html(data.title);
					$("#avatar1").attr("avatar", "");//to be added
					$("#authorName1").html(data.username + " " + data.userId);
					$("#markCount1").html(data.markCount + " Follow");
					$("#lastModifyAt1").html(moment(data.lastModifyAt).format("YYYY-MM-DD"));
					$("#wordage1").html(data.html.length + " Words");
					$("#viewCount1").html(data.viewCount + " Views");
					$("#favouriteCount1").html(data.favouriteCount + " Thumb Up");
					$("#html1").html(data.html);
					$("#avatar2").attr("avatar", "");//to be added
					$("#userId1").html(data.username + ' ' + data.userId);
					$("#info1").html("total " + data.html.length + " words, " + data.markCount + " follow and " + data.favouriteCount + " Thumb Up");
					//Is this my blog? yes, add edit btn; no, do nothing.
					var blogUserId = data.userId;
					console.log('blogUserId ' + data.userId);
					if(loginUserId == blogUserId){
						$("#editBtn").css("display", "block");
					}

				}
			};
			$.ajax(option);
		}//end else

$("#editBtn").on('click', function(){
	console.log('go to edit page');
	//location.href='<%= request.getContextPath()%>/pages/blog/editBlog.jsp?blogId=' + blogId;
	window.location.href= 'resig-blogEdit.html?blogId=' + blogId;
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
