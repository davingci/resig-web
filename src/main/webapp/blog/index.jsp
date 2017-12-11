<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>Index</title>

		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<%@ include file="../include.jsp" %>

		<link rel="stylesheet" href="<%= request.getContextPath()%>/css/jianshu.css" />
		<link rel="stylesheet" href="<%= request.getContextPath()%>/css/main.css" />
		<link rel="stylesheet" href="<%= request.getContextPath()%>/css/resigBlog.css" />

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
		 <a href="#" class="navbar-brand pull-right" style="color:#ea6f5a; font-size: 18px; padding-top: 15px">
		  Log In<span class="glyphicon glyphicon-log-in"></span></a>

		 <a href="#" class="navbar-brand pull-right" style="color:#ea6f5a; font-size: 18px; padding-top: 15px">
		 	Sign Up<span class="glyphicon glyphicon-user"></span></a>
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
						 <input type="text" name="sea" id="sea" autocomplete="off" placeholder="search" class="search-input" data-mounted="1">
						 <a class="search-btn" href="javascript:void(null)" style="font-size:24px"><span class="glyphicon glyphicon-search"></span></a>
						 <div id="navbar-search-tips" style="display:none;"></div>
					 </form>
				 </li>
			 </ul>
		 </div>
   </div>
 </nav>
<div class="container index">
      <div class="row">
			<div class="col-md-17 main">
				<h1>blog card</h1>
			<div id="listContainer">
				<ul class="note-list" style="display:block; width:625px">

				</ul>
			</div><!--list-container-->
			<a data-page="1" href="" class="load-more">Load More</a>
			</div>
    </div>
    <!--/row-->
</div>


 <script>

$(function() {

//loadList initialization
var pageNum = 0;
var pageStart = 0;
var pageSize = 2;
loadList(pageStart, pageSize);
$(document).on('click', '.load-more', function(e){
	e.preventDefault();
	pageNum ++;
	pageStart = pageNum * pageSize;
	loadList(pageStart, pageSize);
});
})

function loadList(offset, size){
	var startTime = "2017-01-04";
	var endTime = "2020-01-08";

	var template = '<li class="have-img" id="blogId1" style="display:list-item">'+
 								'<a class="wrap-img btn btn-default" href="resig-blog.html?blogId=blogId1"  target="_blank" data-blogId = "blogId1">'+
 									'<img class="img-blur-done" src="./pic/pic-list1.jpg" alt="404">'+
 								'</a>' +
 								'<div class="content">' +
 									'<div class="author">'+
 										'<a class="avatar" href="#" target="_blank" data-userId = "userId1" onclick= "getUserInfo(); return false;">' +
 											'<img src="./pic/avatar-list1.png" alt="404">'+
 										'</a>'+
 										'<div class="info">'+
 											'<a class="nickname" target="_blank" href="#" data-userId = "userId1" onclick= "getUserInfo(); return false;">username1 userId1</a>'+
 											'<a target="_blank" href="#">'+
 												'<img width="30" height="30" class="badge-icon" data-toggle="tooltip" title src="./pic/badge.png">'+
 											'</a>'+
 											'<span class="time" data-modifiedTime="modifiedTime1">modifiedTime2</span>'+
 										'</div>'+
 									'</div>'+
 									'<a class="title" target="_blank" href="resig-blog.html?blogId=blogId1">titleContent</a>'+
 									'<p class="abstract">abstractContent</p>'+
 									'<div class="meta">'+
 										'<a class="collection-tag" target="_blank" href="#">æå½±</a>'+
 										'<a target="_blank" href="#"><i class="fa fa-eye" aria-hidden="true"></i>101</a>'+
 										'<a target="_blank" href="#"><i class="fa fa-comments" aria-hidden="true"></i>102</a>'+
 										'<span><i class="fa fa-gratipay" aria-hidden="true"></i>103</span>'+
 										'<span><i class="fa fa-usd" aria-hidden="true"></i>104</span>'+
 									'</div>'+
 								'</div>'+
 							'</li>';
							var option = {
				 				"method": "POST",
				 				"url": "http://39.106.21.117:8080/v1/api/blog/query",
				 				"data": "startTime=" + startTime + "&" + "endTime=" + endTime,
				 				"success": function(response){
										//alert(data.message);
									  var obj = response.data;
										var listNum = obj.length;
										var html = '';
										if(listNum - offset < size){
											size = listNum - offset;
										}
				 						for (var i=offset; i<(offset + size); i++){
				 							var snippet = template.replace(/blogId1/g, obj[i].blogId)
																						.replace(/userId1/g, obj[i].userId)
																						.replace("username1", obj[i].username)
				 																		.replace("titleContent", obj[i].title)
				 																		.replace("abstractContent", obj[i].html.replace(/<[^>]+>/g,""))
																						.replace("modifiedTime1", obj[i].lastModifyAt)
																						.replace("modifiedTime2", moment(obj[i].lastModifyAt).format("YYYY-MM-DD"));

											html = html + snippet;
											console.log(html);
				 						}

										//console.log(html);

											$("#listContainer ul").append(html);

				 				}
				 			};
				 			$.ajax(option);
	}
/*----------  load template end------------ */

/*---------- click events handling function------------ */





							function modifiedTime(){
								var blogId = $(this).data(blogId);
							}

							function getCategory(categoryId){
							//not available in backend in current version
							}
							function getComments(blogId){
								//jump to comments section
								//not available in backend in current version
							}

							///////add and cancel can use toggle btn with the change of icons
							function addFavourite(blogId){
								//authorization: Bearer
							}
							function cancleFavourite(blogId){
								//authorization: Bearer
							}



</script>


  </body>
 </html>
