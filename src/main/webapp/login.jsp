<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>resig</title>

		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<%@ include file="include.jsp" %>
	</head>

<body class="login-layout">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<i class="ace-icon fa fa-leaf green"></i>
									<span class="red">resig</span>
									<span class="white" id="id-text2">admin</span>
								</h1>
								<h4 class="blue" id="id-company-text">&copy; davingci</h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="ace-icon fa fa-coffee green"></i>
												resig admin
											</h4>

											<div class="space-6"></div>

											<form id="loginForm" name="loginForm">
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" id="username" name="username" placeholder="username" />
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" id="password" name="password" placeholder="password" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<div class="space"></div>

													<div class="clearfix">
														<label class="inline">
															<input type="checkbox" class="ace" />
															<span class="lbl"> remember</span>
														</label>

														<button  id="login" class="width-35 pull-right btn btn-sm btn-primary">
															
															login
														</button>
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>
											
											<!--  
											<div class="social-or-login center">
												<span class="bigger-110">other</span>
											</div>

											<div class="space-6"></div>

											<div class="social-login center">
												<a class="btn btn-primary">
													<i class="ace-icon fa fa-facebook"></i>
												</a>

												<a class="btn btn-info">
													<i class="ace-icon fa fa-twitter"></i>
												</a>

												<a class="btn btn-danger">
													<i class="ace-icon fa fa-google-plus"></i>
												</a>
											</div>
											-->
										</div><!-- /.widget-main -->

										
									</div><!-- /.widget-body -->
								</div><!-- /.login-box -->
								
								
								
							</div><!-- /.position-relative -->

							<div class="navbar-fixed-top align-right">
								<br />
								&nbsp;
								<a id="btn-login-dark" href="#">black</a>
								&nbsp;
								<span class="blue">/</span>
								&nbsp;
								<a id="btn-login-blur" href="#">gray</a>
								&nbsp;
								<span class="blue">/</span>
								&nbsp;
								<a id="btn-login-light" href="#">white</a>
								&nbsp; &nbsp; &nbsp;
							</div>
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
			
			
			


			
			
		</div><!-- /.main-container -->

		
		<script type="text/javascript" src="<%= request.getContextPath()%>/vendor/bootbox/bootbox.js"></script>
		
		

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			
			
			//you don't need this, just used for changing background
			jQuery(function($) {
			 $('#btn-login-dark').on('click', function(e) {
				$('body').attr('class', 'login-layout');
				$('#id-text2').attr('class', 'white');
				$('#id-company-text').attr('class', 'blue');
				
				e.preventDefault();
			 });
			 $('#btn-login-light').on('click', function(e) {
				$('body').attr('class', 'login-layout light-login');
				$('#id-text2').attr('class', 'grey');
				$('#id-company-text').attr('class', 'blue');
				
				e.preventDefault();
			 });
			 $('#btn-login-blur').on('click', function(e) {
				$('body').attr('class', 'login-layout blur-login');
				$('#id-text2').attr('class', 'white');
				$('#id-company-text').attr('class', 'light-blue');
				
				e.preventDefault();
			 });
			 
			});
			
			
			
		$( document ).ready( function () {
			//login
			
			
			
			$("#login").on("click",function() {
				var username = $("#username").val();
				
				var options = {
		                url: '<%= request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()%>/LoginService',
		                type: 'post',
		                dataType: 'text',
		                data: $("#loginForm").serialize(),
		                success: function (response,status,xhr) {
		                	var obj = JSON.parse(response);
		                	var code = obj.code;
		                	switch(code) {
		                	case 200:
		                		window.sessionStorage.setItem("username",username);
		                		window.location.href = "index.jsp";
		                		break;
		                	case 401:
		                		bootbox.alert({
		                		    message: obj.message,
		                		    size: 'small'
		                		});
		                		break;
		                	default:
		                		bootbox.alert({
		                		    message: obj.message,
		                		    size: 'small'
		                		});
		                		break;
		                	}	
		                	
		                },
		                failure: function(response,status,xhr) {
							console.log(xhr.status);
							console.log("failure.")
						}
		            };
		            	
		            $.ajax(options);
		            return false;
	        });
			
			//check authuntication
			$(document).on('ajaxError', function(event, xhr,setting, error) {
				  if (xhr.status === 401) {
				   
				    window.location.href = "login.jsp";
				  }
			});
			
		});
		
		
		
		
		
		
		
		
		</script>
	</body>


	</html>
