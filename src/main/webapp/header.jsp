<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<div id="navbar" class="navbar navbar-default          ace-save-state">
			<div class="navbar-container ace-save-state" id="navbar-container">
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>

				<div class="navbar-header pull-left">
					<a href="<%= request.getContextPath()%>/index.jsp" class="navbar-brand">
						<small>
							<i class="fa fa-leaf"></i>
							Resig Admin
						</small>
					</a>
				</div>

				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="light-blue dropdown-modal">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								
								<span class="user-info">
									<small>welcome,</small>
									<%=session.getAttribute("username") %>
								</span>

								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="#">
										<i class="ace-icon fa fa-cog"></i>
										setting
									</a>
								</li>

								<li>
									<a href="<%= request.getContextPath()%>/pages/profile/profile.jsp">
										<i class="ace-icon fa fa-user"></i>
										profile
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="<%= request.getContextPath()%>/LogoutService">
										<i class="ace-icon fa fa-power-off"></i>
										logout
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div><!-- /.navbar-container -->
		</div>

		