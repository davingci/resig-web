<%@ include file="../../beforeContentWithCkeditorInitialization.jsp" %>



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
	 <div class="col-xs-offset-2 col-xs-10">
	<span id="autosvdsecond"><span id="e_svdsecond"></span>&nbsp;
<a id="e_svd" onclick="Cautocode('svd');return false;" style="font-weight:normal;" href="javascript:;">Save(only for demo)</a>&nbsp;&nbsp;
<a id="e_rst" onclick="Cautocode('rst');return false;" style="font-weight:normal;" href="javascript:;">Restore(only for demo)</a>&nbsp;&nbsp;
&nbsp;&nbsp;<em id="e_svdsecond_tip"></em></span>
    </div>
      	<form class="form-horizontal" id="addBlogForm" >
		    <div class="form-group">
			 <label for="input password" class="col-sm-2 control-label">title</label>
			  <div class="col-sm-9">
				  <input type="text" class="form-control" id="title" name="title" placeholder="title" >
			 </div>
			</div>

			<div class="form-group">
				<label for="input password" class="col-sm-2 control-label">content</label>
				<div class="col-sm-9">
				  <textarea class="form-control" id="editor1" name="html">
				  </textarea>
				</div>
			</div>
		</form><!-- /.form -->
	<div class="col-sm-offset-2 col-sm-10">

	 <button  id="editorPost" class="btn btn-primary" >Post Blog</button>
	</div>
    </div>
   </div>
  </div><!-- /.page-content -->
</div>
</div><!-- /.main-content -->




<script src="<%= request.getContextPath()%>/vendor/jquery-form/jquery.form.min.js"></script>
<script src="<%= request.getContextPath()%>/vendor/ckeditor/ckeditor.js"></script>
<script src="<%= request.getContextPath()%>/vendor/bootbox/bootbox.js"></script>
<script src="<%= request.getContextPath()%>/js/content_autosave.js"></script>
<script>

$(window).load(function(){
	//restore user editor content
	var name = window.sessionStorage.getItem("username");
	console.log(name+ ' for rst');
	var data = loadUserdata(name);
	console.log(data);
	//ck.resetAll();
	ck.set('editor1', data);
});

jQuery(function($) {
	//init editor
	  var editor = CKEDITOR.replace('editor1');
	//handling the editor content

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
    var submitData = $('#addBlogForm').formSerialize() + "&" + "markdown=" + "" + "&" + "blogEditor=" + "htmlEditor";

    console.log(submitData);
    var option = {
    	  "async": true,
    	  "crossDomain": true,
    	  "url": "http://39.106.21.117:8080/v1/api/blog/add",
    	  "method": "POST",
            "headers": {
            	"content-type": "application/x-www-form-urlencoded",
            	"Authorization": "Bearer " + "<%= session.getAttribute("token")%>"
            },
    		"data": submitData,
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
    console.log(option);
    $.ajax(option);
	});
})//end ready



</script>

<%@ include file="../../afterContent.jsp" %>
