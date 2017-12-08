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
   
<script src="<%= request.getContextPath()%>/vendor/jquery-ui/jquery-ui.min.js"></script>
 <script src="<%= request.getContextPath()%>/vendor/data-tables/datatables.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/vendor/data-tables/datatables.min.css"/>
<script src="<%= request.getContextPath()%>/vendor/data-tables/jquery.dataTables.min.js"></script>
<script src="<%= request.getContextPath()%>/vendor/data-tables/jquery.dataTables.bootstrap.min.js"></script>
<script src="<%= request.getContextPath()%>/vendor/moment/moment.min.js"></script>
<script src="<%= request.getContextPath()%>/vendor/bootstrap-datepick/bootstrap-datetimepicker.js"></script>
<script src="<%= request.getContextPath()%>/vendor/bootbox/bootbox.js"></script>

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
				return str = '<button class="btn btn-info btn-sm" data-id=' + data + ' onclick="editBlog('+ row + ')"'+ '><i class="fa fa-pencil"></i>Edit</button>'
                + '<button class="btn btn-danger btn-sm" data-id=' + data + ' onclick="delBlog('+ row.blogId + ')"'+'><i class="fa fa-trash-o"></i>Delete</button>'
                + '<button class="btn btn-danger btn-sm" data-id=' + data + ' onclick="addBlog()"'+'>Add</button>';
         },
         "targets": 6
     }
 ]
});
   


    
  })
  
     // add, edit, delete, check, list events handling
    
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
