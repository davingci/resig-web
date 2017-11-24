<%@ include file="../../beforeContent.jsp" %>

<div class="main-content">
				<div class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="<%= request.getContextPath()%>/index.jsp">home</a>
							</li>
							
						</ul><!-- /.breadcrumb -->

						
					</div>

					<div class="page-content">
						<div class="ace-settings-container" id="ace-settings-container">
							

							</div><!-- /.ace-settings-container -->

						<div class="page-header">
							<h1>
								Resig Admin
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									Add Blog
								</small>
							</h1>
						</div><!-- /.page-header -->


						




    <div class="row">
							<div class="col-xs-12">
      	<form class="form-horizontal" id="addBlogForm" >
		                                
										
									
									    
										
										<div class="form-group">
													<label for="input password" class="col-sm-3 control-label">title</label>
													<div class="col-sm-9">
													  <input type="text" class="form-control" id="title" name="title" placeholder="title" >
													</div>
										</div>
										
										
										
										
										<div class="form-group">
													<label for="input password" class="col-sm-3 control-label">content</label>
													<div class="col-sm-9">
													  <textarea class="form-control" rows="10" id="content" name="content" value="write your blog here..." >
													  </textarea>
													</div>
										</div>

										<div class="form-group">
											<div class="col-sm-offset-5 col-sm-10">
											  <button type="submit" class="btn btn-primary" id="btnAddCommunity">Submit</button>
											  
											</div>
										</div>								
						</form><!-- /.form -->

  
						</div>
						</div>
						</div><!-- /.page-content -->
				</div>
				
				
				
				
</div><!-- /.main-content -->

<%@ include file="../../afterContent.jsp" %>