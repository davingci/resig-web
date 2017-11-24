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
									Edit Blog
								</small>
							</h1>
						</div><!-- /.page-header -->


						




    <div class="row">
							<div class="col-xs-12">
      	<form class="form-horizontal" id="editBlogForm" >
		                                
										
									
									    
										
										<div class="form-group">
													<label for="input" class="col-sm-3 control-label">title</label>
													<div class="col-sm-9">
													  <input type="text" class="form-control" id="title" name="title" placeholder="title" >
													</div>
										</div>
										
										
										
										
										<div class="form-group">
													<label for="input" class="col-sm-3 control-label">content</label>
													<div class="col-sm-9">
													  <textarea class="form-control" rows="10" id="content" name="content" value="write your blog here..." >
													  </textarea>
													</div>
										</div>
						</form><!-- /.form -->
										
											<div class="col-sm-offset-5 col-sm-10">
											  <button  id="editConfirm" class="btn btn-primary" >Confirm</button>
											  
											</div>
																	


  
						</div>
						</div>
						
						
						
						</div><!-- /.page-content -->
				</div>
				
				
				
<script src="<%= request.getContextPath()%>/vendor/jquery-ui.min.js"></script>	
<script src="<%= request.getContextPath()%>/vendor/jquery.form.min.js"></script>
<script src="<%= request.getContextPath()%>/vendor/bootbox.js"></script>
<script>

$(window).load(function(){
    console.log("load bolg title and content");
    var para = getParaFromUrl();
    var blogId = para.blogId;
    console.log(para.blogId);
    var setup = function(obj){
    	if (obj.code == 200){
    		var data = obj.data;
    		$('#title').val(data.title);
    		$('#content').val(data.content);
    	}
    }
    var url = 'http://localhost:8080/resig-server/api/blog/get/' + blogId
    $.getJSON(url, setup);
});



jQuery(function($) {
	$('#editConfirm').click(function(){
    var para = getParaFromUrl();
    var blogId = para.blogId;
    var updateString = $('#editBlogForm').formSerialize();
    console.log(updateString);
    updateString = "blogId=" + blogId + "&" + updateString;
    console.log(updateString);
    var option = {
    		type: "POST",
    		url: 'http://localhost:8080/resig-server/api/blog/update',
    		data: updateString,
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


var Example = (function(){
	"use strict";
	var elem,
		hideHandler,
		that = {};
	that.init = function(options){
		elem = $(options.selector);
	};
	that.show = function(text){
		clearTimeout(hideHandler);
		
		elem.find("p").html(text);
		elem.delay(200).fadeIn().delay(4000).fadeOut();
	};
	
	return that;
}());

</script>
			
</div><!-- /.main-content -->

<%@ include file="../../afterContent.jsp" %>