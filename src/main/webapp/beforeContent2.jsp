<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>resig</title>

		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		
		<%@ include file="include.jsp" %>
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

	<body class="no-skin">
		<%@ include file="header.jsp" %>
		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>
			
			<%@ include file="menu.jsp" %>