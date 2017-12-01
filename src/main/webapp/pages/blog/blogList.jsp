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
                
                 
                  <div>
                  
			<form class="form-inline" id="queryForm" style="margin-bottom:20px; margin-left:20px; margin-top:20px">
			
										<div class="form-group " >
													<label for="input password" class="control-label">Start Date</label>
													
														<input id="startDate" type="text" class="form-control" name="startDate" >
													
										</div>
										
										<div class="form-group " >
													<label for="input password" class="control-label">End Date</label>
													
														<input id="endDate" type="text" class="form-control" name="endDate" >
													
										</div>
										
										
										
										<div class="form-group " >
													
													<button class="btn btn-primary btn-sm" type="button" id="btnQuery">
												
														SearchByDate
													</button>
													
										</div>
										
			</form>
		</div>
                
                <div>
                  <table id="testdataTables" class="table table-striped table-bordered table-hover">
                    <thead>
                      <tr>
                        <th>blogId</th>
                        <th>creatAt</th>
                        <th>lastModifyAt</th>
                        <th>username(Id)</th>
                        <th>userId</th>
                        <th>title</th>
                        <th>content</th>
                        <th>favoriteCount</th>
                        <th>markCount</th>
                        <th>viewCount</th>
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
 <script src="<%= request.getContextPath()%>/vendor/jquery-ui.min.js"></script>
 <script src="<%= request.getContextPath()%>/vendor/DataTables/datatables.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/vendor/DataTables/datatables.min.css"/>
<script src="<%= request.getContextPath()%>/vendor/jquery.dataTables.min.js"></script>
<script src="<%= request.getContextPath()%>/vendor/jquery.dataTables.bootstrap.min.js"></script>
<script src="<%= request.getContextPath()%>/vendor/moment.min.js"></script>
<script src="<%= request.getContextPath()%>/vendor/bootstrap-datetimepicker.js"></script>
<script src="<%= request.getContextPath()%>/vendor/bootbox/bootbox.js"></script>




<script type="text/javascript">
  jQuery(function($) {
    
    var sAjaxSource = 'http://39.106.21.117:8080/v1/api/blog/query';
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
	 { "data": "blogId"},
	 { "data": "createAt"},
	 { "data": "lastModifyAt"},
	 { "data": "username"},
     { "data": "userId"},
     { "data": "title"},
     { "data": "html"},
     {"data": "favouriteCount"},
     {"data": "markCount"},
     {"data": "viewCount"},
     {"data": "blogEditor"}
 ],
 "columnDefs": [
     {
         // The `data` parameter refers to the data for the cell (defined by the
         // `data` option, which defaults to the column being worked with, in
         // this case `data: 0`.
         "render": function ( data, type, row ) {
        	 
             return data +' ('+ row.blogId+')';
         },
         "targets": 0
     },
     {
         "render": function ( data, type, row ) {
				var day = moment(data);
				var str = day.format("YYYY-MM-DD");
				return str;
         },
         "targets": 1
     },
     {
         "render": function ( data, type, row ) {
				var day = moment(data);
				var str = day.format("YYYY-MM-DD");
				return str;
         },
         "targets": 2
     },
     {
    	 "render": function (data, type, row) {
    		 return data + '(' + row.userId + ')';
    	 },
     	"targets": 3
     },
     {"visible": false,  	"targets": [4]},
     {
    	 "render": function (data, type, row) {
    		 return data;
    	 },
     	"targets": 5
     },
     {
    	 "render": function (data, type, row) {
    		 //remove all html tag using exp
    		 return data.replace(/<[^>]+>/g,"");
    	 },
     	"targets": 6
     },
     { "visible": false,  "targets": [7] },
     { "visible": false,  "targets": [8] },
     { "visible": false,  "targets": [9] },
     {
         "render": function ( data, type, row ) {
				var str ="";
				//alert(row.blogId);
				return str = '<button class="btn btn-danger btn-sm" data-id=' + row.blogId + ' onclick="delBlog('+ row.blogId + ')"'+'><i class="fa fa-trash-o"></i>Delete</button>'
                + '<button class="btn btn-danger btn-sm" data-id=' + row.blogId + ' onclick="addBlog()" ' +'>Add</button>'
                + '<button class="btn btn-danger btn-sm" data-id=' + row.blogId + ' onclick="editBlog(' + row.blogId + ')" ' +'>Edit</button>';
         },
         "targets": 10
     }
 ]
});
   
 
 //search by date and reload dataTable
$("#btnQuery").on("click",function() {
	var table = $("#testdataTables").DataTable();
	table.ajax.reload();
});
   
	//datepicker plugin
	$("#startDate, #endDate").datetimepicker({
		format: "yyyy-mm-dd",
	    minView:'month',
	    autoclose:true,
	    todayBtn:true
    });



})//end ready
  

  
     // add, edit, delete, check, list events handling
     
    function editBlog(id){
    	 location.href='<%= request.getContextPath()%>/pages/blog/editBlog.jsp?blogId=' + id;
     }
     
    function addBlog(){
    	location.href='<%= request.getContextPath()%>/pages/blog/blogAdd.jsp';
    }
     
     
    function delBlog(id){
    	  console.log(id);
    	  $.ajax({
        	  "async": true,
        	  "crossDomain": true,
        	  "method": "POST",
        	  "url": "http://39.106.21.117:8080/v1/api/blog/delete",
              "headers": {
              	"content-type": "application/x-www-form-urlencoded",
              	"Authorization": "Bearer " + "<%= session.getAttribute("token")%>"
              },
    		  data: "blogId=" + id,
    		  success:function(data){
    			  alert(data.code + '  ' + data.message);
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
