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
													  <textarea class="form-control" rows="10" id="editor" name="editor" value="write your blog here..." >
													  </textarea>
													</div>
										</div>								
						</form><!-- /.form -->
										<div class="col-sm-offset-5 col-sm-10">
											  <button  id="editorSave" class="btn btn-primary" >Save</button>
											  <button  id="editorPost" class="btn btn-primary" >Post Blog</button>
											  
											</div>

  
						</div>
						</div>
						</div><!-- /.page-content -->
				</div>
				
				
				
				
</div><!-- /.main-content -->
<script src="<%= request.getContextPath()%>/vendor/ckeditor-selfbuild/ckeditor/ckeditor/ckeditor.js"></script>
<script src="<%= request.getContextPath()%>/vendor/ckeditor-selfbuild/ckeditor/plupload-2.3.6/js/plupload.full.min.js"></script>
<script>

$(window).load(function(){
    console.log("load bolg title and content");
    var para = getParaFromUrl();
    var blogId = para.blogId;
    console.log(para.blogId);
    var setup = function(obj){
    	if (obj.code == 200){
    		//var data = obj.data;
    		//$('#title').val(data.title);
    		//$('#content').val(data.content);
    	}
    }
    //var url = 'http://localhost:8080/resig-server/api/blog/get/' + blogId
    //$.getJSON(url, setup);
});

jQuery(function($) {
	//handling the editor content
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
	//init editor
  CKEDITOR.replace('editor');
	 
	
	 
	// save editor content 
	$('#editorSave').click(function(){
	var token = <%= session.getAttribute("token")%>;
    var para = getParaFromUrl();
    var blogId = para.blogId;
    var editorContent = ck.get();
    var editorContent = $('#editBlogForm').formSerialize();
    console.log(editorContent);
    var option = {
    		type: "POST",
    		url: 'http://39.106.21.117:8080/v1/api/blog/add',
    		data: editorContent,
    		beforeSend: function(request){
    			request.setRequestHeader("Authorization", token);
    		},
    		success:function(data){
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
    $.ajax(option);
    
    

	});
})//end ready



</script>
<%@ include file="../../afterContent.jsp" %>