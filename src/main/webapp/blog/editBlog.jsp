<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Blog</title>
		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

        <%@ include file="../include.jsp" %>

		<link rel="stylesheet" href="<%= request.getContextPath()%>/css/jianshu.css" />
		<link rel="stylesheet" href="<%= request.getContextPath()%>/css/main.css" />
		<link rel="stylesheet" href="<%= request.getContextPath()%>/css/resigBlog.css" />

	<script src="<%= request.getContextPath()%>/vendor/jquery-form/jquery.form.min.js"></script>
	<script src="<%= request.getContextPath()%>/vendor/ckeditor/ckeditor.js"></script>
	<script src="<%= request.getContextPath()%>/vendor/bootbox/bootbox.js"></script>
	<script src="<%= request.getContextPath()%>/js/content_autosave.js"></script>
    <script src="<%= request.getContextPath()%>/vendor/moment/moment.min.js"></script>
  <script>      
  var cookiedomain = isUndefined(cookiedomain) ? '' : cookiedomain;
var cookiepath = isUndefined(cookiepath) ? '' : cookiepath;
function $$(id) {return document.getElementById(id);}
function isUndefined(variable) {return typeof variable == 'undefined' ? true : false;}
function setcookie(cookieName, cookieValue, seconds, path, domain, secure) {
	var expires = new Date();expires.setTime(expires.getTime() + seconds * 1000);
	domain = !domain ? cookiedomain : domain;path = !path ? cookiepath : path;
	document.cookie = escape(cookieName) + '=' + escape(cookieValue)
		+ (expires ? '; expires=' + expires.toGMTString() : '')
		+ (path ? '; path=' + path : '/')
		+ (domain ? '; domain=' + domain : '')
		+ (secure ? '; secure' : '');
}
function getcookie(name) {
	var cookie_start = document.cookie.indexOf(name);
	var cookie_end = document.cookie.indexOf(";", cookie_start);
	return cookie_start == -1 ? '' : unescape(document.cookie.substring(cookie_start + name.length + 1, (cookie_end > cookie_start ? cookie_end : document.cookie.length)));
}
function in_array(needle, haystack) {
	if(typeof needle == 'string' || typeof needle == 'number') {
    for(var i in haystack) {if(haystack[i] == needle) {return true;}}}
	return false;}
function trim(str) {return (str + '').replace(/(\s+)$/g, '').replace(/^\s+/g, '');}



//autosave para define
var editorid = 'e';
var savedataInterval = 10; //init 30s autosave
var savedatac = 0; //
var autosave = 1; //
var savedatat = null;

	function Cautocode(str){
		switch(str){
		case 'svd': 
			var name = window.sessionStorage.getItem("username");
			//console.log(name);
			var data = ck.get('editor1');
			saveUserdata(name, data);
		break;		
		case 'rst': 
			var name = window.sessionStorage.getItem("username");
			console.log(name+ ' for rst');
			var data = loadUserdata(name);
			console.log(data);
			//ck.resetAll();
			ck.set('editor1', data);
		break;		
		case 'tpr': 			
		break;
		
	}
	}

	var ck = {
			updateAll: function () {
					for (instance in CKEDITOR.instances) {
							CKEDITOR.instances[instance].updateElement();
					}
			},
			resetAll: function () {
					for (instance in CKEDITOR.instances) {
							CKEDITOR.instances[instance].setData("");
					}
			},
			update: function (id) {
					CKEDITOR.instances[id].updateElement();
			},
			reset: function (id) {
					CKEDITOR.instances[id].setData("");
			},
			set: function (id, content) {
					CKEDITOR.instances[id].setData(content);
			},
			get: function(id) {
					return CKEDITOR.instances[id].getData();
			},
			insert: function (id, content) {
					CKEDITOR.instances[id].insertHtml(content);
			}
		};
	
</script>      
        
        
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
 
<div class="container">
<div class="row">
	<div class="col-xs-24">
	 <div class="col-xs-offset-2 col-xs-20">
	<span>&nbsp;&nbsp;<em id="e_svdsecond_tip"></em></span>
    </div>
      	<form class="form-horizontal" id="addBlogForm" >
		    <div class="form-group">
			 <label for="input password" class="col-xs-4 control-label">title</label>
			  <div class="col-xs-20">
				  <input type="text" class="form-control" id="title" name="title" placeholder="title" >
			 </div>
			</div>

			<div class="form-group">
				<label for="input password" class="col-xs-4 control-label">content</label>
				<div class="col-xs-20">
				  <textarea class="form-control" id="editor1" name="html">
				  </textarea>
				</div>
			</div>
		</form><!-- /.form -->
	<div class="col-xs-offset-20 col-xs-4">
	 <button  id="editorPost" class="btn btn-primary" >Post Blog</button>
	</div>
    </div>
   </div>
</div>
<script>

jQuery(function($) {

	//init editor
  var editor = CKEDITOR.replace('editor1');
	//get blog
  var para = getParaFromUrl();
//if blogId doesn't exist, href to index page
//need to be done.
  var blogId = para.blogId;
  console.log(para.blogId);
  var option = {
			"method" : "GET",
			"url" : "http://39.106.21.117:8080/v1/api/blog/get/" + blogId,
			"success" : function (response) {
				//console.log(response);
				var data = response.data;				
				$('#title').html(data.title);
				ck.set('editor1', data.html);
			}
		};
		$.ajax(option);

	//initialize self-defined autosave
	   if($(editorid + '_svdsecond') && savedatat === null) {
		   savedatac = savedataInterval;
		   autosave = !getcookie('editorautosave_' + editorid) || getcookie('editorautosave_' + editorid) == 1 ? 1 : 0;
		   savedataTime();
		   savedatat = setInterval("savedataTime()", 5000);
		   }
	//------end initialize----------

	//click save btn, save evt fired
	editor.on('save', function (evt){
		var name = window.sessionStorage.getItem("username");
		//console.log(name);
		var data = ck.get('editor1');
		saveUserdata(name, data);
	})


	var token = "Bearer " + "<%= session.getAttribute("token")%>";
	console.log(token);

 $('#editorPost').click(function(){

	 try{
		 for(instance in CKEDITOR.instances){
			 CKEDITOR.instances[instance].updateElement();
			 }
		var editorContent = ck.get('editor1');
     $('#editor1').val(editorContent);
	}catch(ex){}
    //include title
    var submitData = $('#addBlogForm').formSerialize() + "&" + "markdown=" + "" + "&" + "blogId=" + blogId;

    console.log(submitData);
    var option = {
    	  "async": true,
    	  "crossDomain": true,
    	  "url": "http://39.106.21.117:8080/v1/api/blog/update",
    	  "method": "POST",
          "headers": {
            	"content-type": "application/x-www-form-urlencoded",
            	"Authorization": "Bearer " + "<%= session.getAttribute("token")%>"
            },
    	  "data": submitData,
    	  "success" :function(data){
    			var dialog = bootbox.dialog({
    			    message: '<p class="text-center">' + data.message + '</p>',
    			    size: 'small',
    			    closeButton: false,
    			    callback:function(){
    			    	Message.show('success');
    			    }
    			});
    			// do something in the background
    			setTimeout(function(){
		    		dialog.modal('hide');
		    		}, 3000);
		         }
    };
    console.log(option);
    $.ajax(option);
	});
})//end ready


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