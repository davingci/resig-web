<%@ include file="../../beforeContent.jsp" %>


<div class="main-content">
  <div class="page-content">
      <div class="row">
        <div class="col-xs-12">
          <!-- PAGE CONTENT BEGINS -->

          <!-- PAGE CONTENT ENDS -->
          <!--newRow-->
          <div class="row">
            <div class="class-xs-12">
              <h3 class="header smaller lighter blue">Test table</h3>
                <div class="clearfix">
                  <div class="pull-right tableTools-container"></div>
                </div>
                <div class="table-header">
                  Test
                </div>
                <div>
                  <table id="testdataTables" class="table table-striped table-bordered table-hover">
                    <thead>
                      <tr>
                        <th>username(Id)</th>
                        <th>userId</th>
                        <th>title</th>
                        <th>content</th>
                        <th>cteateTime</th>
                        <th>lastModifyTime</th>
                        <th>operation</th>
                      </tr>
                    </thead>
                    <tbody>

                    </tbody>
                  </table>
                </div>
            </div>
          </div><!--newRow-->



        </div><!-- /.col -->
      </div><!-- /.row -->
    </div><!-- /.page-content -->
    </div>><!-- main-content -->
   
<script src="<%= request.getContextPath()%>/vendor/moment.min.js"></script>
<script src="<%= request.getContextPath()%>/vendor/bootstrap-datepicker.min.js"></script>
<script src="<%= request.getContextPath()%>/vendor/bootstrap-datetimepicker.min.js"></script>
<script src="<%= request.getContextPath()%>/vendor/datatables.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/vendor/datatables.min.css"/>
<script src="<%= request.getContextPath()%>/vendor/jquery.dataTables.min.js"></script>
<script src="<%= request.getContextPath()%>/vendor/jquery.dataTables.bootstrap.min.js"></script>
<script src="<%= request.getContextPath()%>/vendor/jquery-ui.min.js"></script>

<script type="text/javascript">
  jQuery(function($) {
    
    var sAjaxSource = 'http://localhost:8080/resig-server/api/blog/query';
    var testTable =
    $('#testdataTables')
    .DataTable({
      "bAutoWidth": true,
      "processing":true,

"ajax": {
    url:sAjaxSource,
    type:"POST",
    data:function() {
        var startTime = $("#startDate").val();
        var endTime = $("#endDate").val();
        if(typeof(startTime) == "undefined" || startTime == "") {
            startTime = "2016-01-01";
        }
        if(typeof(endTime) == "undefined" || endTime =="") {
            endTime = moment().add(1,'days').format("YYYY-MM-DD");            
        }
        return "startTime="  + startTime + "&" + "endTime=" + endTime;
        
    }

 },
 "columns": [
	 { "data": "username" },
     { "data": "userId"},
     { "data": "title" },
     { "data": "content" },
     { "data": "createTime" },
     { "data": "lastModifyTime" },
     { "data": "blogId"}
 ],
 "columnDefs": [
     {
         // The `data` parameter refers to the data for the cell (defined by the
         // `data` option, which defaults to the column being worked with, in
         // this case `data: 0`.
         "render": function ( data, type, row ) {
        	 
             return data +' ('+ row.userId+')';
         },
         "targets": 0
     },
     { "visible": false,  "targets": [ 1 ] },
     {
         "render": function ( data, type, row ) {
				var day = moment(data);
				var str = day.format("YYYY-MM-DD");
				return str;
         },
         "targets": 4
     },
     {
         "render": function ( data, type, row ) {
				var day = moment(data);
				var str = day.format("YYYY-MM-DD");
				return str;
         },
         "targets": 5
     },
     {
         "render": function ( data, type, row ) {
				var str ="";
				//alert(row.blogId);
				var modalHtml = '<button type="button" onclick="editBtnClick(' + row.blogId + ')" + class="btn btn-primary btn-sm" data-toggle="modal" data-target="#update' + row.blogId + '" data-backdrop="static">edit</button>'
                +'<div class="modal fade" id="update' + row.blogId + '" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'
                +'<div class="modal-dialog">'
                +   '<div class="modal-content">'
                +       '<div class="modal-header">'
                +            '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>'
                +              '<div class="col-sm-9 modal-title">'
				+                '<input type="text" class="form-control " id="myModalTitle'+ row.blogId +'" name="myModalTitle" value="' + row.title + '" >'
				+              '</div>'                
                +        '</div>'
                +        '<div class="">'
                +          '<div class="col-sm-9 modal-body">'
				+            '<textarea class="form-control" rows="10" id="myModalContent'+ row.blogId +'" name="myModalContent" value="new content here" >'
				+             row.content + '</textarea>'
				+          '</div>'               
                +        '</div>'

                +        '<div class="modal-footer">'
                +            '<button type="button" class="btn btn-default" data-dismiss="modal">close</button>'
                +            '<button type="button" class="btn btn-primary"  data-dismiss="modal" onclick="editBlogConfirmInModal(' + row.blogId + ')">confirm</button>'
                +        '</div>'
                +    '</div>'                 
                +'</div>'
                +'</div>';
				return str = '<button class="btn btn-danger btn-sm" data-id=' + data + ' onclick="delBlog('+ row.blogId + ')"'+'><i class="fa fa-trash-o"></i>Delete</button>'
                + '<button class="btn btn-danger btn-sm" data-id=' + data + ' onclick="toAddPage()" ' +'>Add</button>'
                + modalHtml;
         },
         "targets": 6
     }
 ]
});
   
 

   




})//end ready
  
  // fire modal for editing blog
  function editBtnClick(id){
	  if(id){
	  var options = {backdrop: true, keyboard: false};
	  var modalId= 'update' + id;
	  $(modalId).on('show.bs.modal',function(event) {
	  	var button = $(event.relatedTarget)
	  });
	  }
    }
  
     // add, edit, delete, check, list events handling
     
   function editBlogConfirmInModal(id){
	var nblogId = id;
	console.log(id);
	var ntitle = $('#myModalTitle'+id).val();
	console.log(ntitle);
	var ncontent = $('#myModalContent'+id).val();
	console.log(ncontent);
	if(ncontent!==''){
       $.ajax({
		         type:"POST",
		         url:"http://localhost:8080/resig-server/api/blog/update",
		         data: "blogId=" + id + "&" + "title=" + ntitle + "&" + "content=" +ncontent,
		         success:function(data){
			      alert(data.message);
			      var table = $("#testdataTables").DataTable();
	              table.ajax.reload();
		         },
		         error:function(data){
		          var obj = JSON.parse(data);
			      console.log(obj);
		         }  		 
	      });          
	}else{alert('blog content is required.')}
}

     
    function toAddPage(){
    	location.href='<%= request.getContextPath()%>/pages/blog/blogAdd.jsp';
    }
     
     
    function delBlog(id){
    	  console.log(id);
    	  $.ajax({
    		  type:"POST",
    		  url:"http://localhost:8080/resig-server/api/blog/delete",
    		  data: "blogId=" + id,
    		  success:function(data){
    			  alert(data.message);
    			  var table = $("#testdataTables").DataTable();
    	          table.ajax.reload();
    		  },
    		  error:function(){
    			  alert("error");
    		  },
    	  });    	  	
      } 
     
   
  
</script>

<%@ include file="../../afterContent.jsp" %>
