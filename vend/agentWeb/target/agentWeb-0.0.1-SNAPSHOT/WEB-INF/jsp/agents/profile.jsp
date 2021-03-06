<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="/WEB-INF/jsp/common/common.jsp" %>
  </head>

<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">
  
   <%@ include file="/WEB-INF/jsp/common/top.jsp" %>
   
   <%@ include file="/WEB-INF/jsp/common/left.jsp" %>
   
   
    <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>个人中心</h1>
      <ol class="breadcrumb">
        <li class="active">个人中心</li>
      </ol>
    </section>
  
    <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="profile-user-img img-responsive img-circle" src="${pageContext.request.contextPath}/static/dist/img/user4-128x128.jpg" alt="User profile picture">

              <h3 class="profile-username text-center">${info.name}</h3>
              <p class="text-muted text-center">${info.loginName}</p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>余额</b> <a class="pull-right">${info.leftMoney}元</a>
                </li>
                <li class="list-group-item">
                  <b>冻结金额</b> <a class="pull-right">${info.lockMoney}元</a>
                </li>
                <li class="list-group-item">
                  <b>积分</b> <a class="pull-right">${info.score}</a>
                </li>
                <li class="list-group-item">
                  <b>费率</b> <a class="pull-right">${info.rate}</a>
                </li>
              </ul>
              <a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">About Me</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <strong><i class="fa fa-pencil margin-r-5"></i> Skills</strong>
              <p>
                <span class="label label-danger">UI Design</span>
                <span class="label label-success">Coding</span>
                <span class="label label-info">Javascript</span>
                <span class="label label-warning">PHP</span>
                <span class="label label-primary">Node.js</span>
              </p>
              <hr>

              <strong><i class="fa fa-file-text-o margin-r-5"></i> Notes</strong>

              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#settings" data-toggle="tab">设置</a></li>
              <li><a href="#password" data-toggle="tab">重置密码</a></li>
              <li><a href="#cashConfig" data-toggle="tab">提现配置</a></li>
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="settings">
                <form class="form-horizontal" id="reset_agent_info_form" action="${pageContext.request.contextPath}/">
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">名称</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="name" id="inputName" value="${info.name}" placeholder="名字"  data-bv-notempty="true">
                    </div>
                  </div>
           
                  <div class="form-group">
                    <label for="inputLoginName" class="col-sm-2 control-label">登录名</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputLoginName" value="${info.loginName}" placeholder="登录名" disabled>
                      <p class="help-block">登录名是为登录而用，不能修改.</p>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-danger">更 新</button>
                    </div>
                  </div>
                </form>
              </div>
              <div class="tab-pane" id="password">
                <form class="form-horizontal" id="reset_password_form">
                  <div class="form-group">
                    <label for="oldPassword" class="col-sm-2 control-label">原始密码</label>
                    <div class="col-sm-10">
                      <input type="password" class="form-control" name="oldPassword" id="oldPassword" placeholder="原始密码" data-bv-notempty="true">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="newPassword" class="col-sm-2 control-label">新密码</label>

                    <div class="col-sm-10">
                      <input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="新密码" data-bv-notempty="true">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="confirmPassword" class="col-sm-2 control-label">确认密码</label>

                    <div class="col-sm-10">
                      <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="确认密码" data-bv-notempty="true">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-danger">重 置</button>
                    </div>
                  </div>
                </form>
              </div>
              <div class="tab-pane" id="cashConfig">
                <div id="toolbar">
                  <button type="button" data-ope="add" class="btn bg-maroon btn-flat">添加</button>
                  <button type="button" data-ope="delete" class="btn bg-olive btn-flat">删除</button>
                  <button type="button" data-ope="edit" class="btn bg-orange btn-flat">编辑</button>
                </div>
                <table id="cashConfig_table"></table>
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
    
    <!-- /.content-wrapper -->
   
    <%@ include file="/WEB-INF/jsp/common/foot.jsp" %>
  </div>
  
  
  <script src="${pageContext.request.contextPath}/static/bower_components/table/bootstrap-table.js"></script>
  <script src="${pageContext.request.contextPath}/static/bower_components/table/bootstrap-table-zh-CN.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bower_components/table/bootstrap-table.css">
 
  <div class="modal fade" id="modal-cash-config">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Default Modal</h4>
        </div>
              <!-- form start -->
          <form class="form-horizontal" id="cash-config-form" action="${pageContext.request.contextPath }/cashConfigs">
              
            <div class="modal-body">
              
              <div class="row">
                <!-- right column -->
                <div class="col-md-12">
                  <!-- Horizontal Form -->
                    <input type="hidden" name="id"/>
  	          
                    <div class="form-group">
                      <label for="type" class="col-sm-2 control-label">类型</label>
		          	  <div class="col-sm-10">
		          	    <div class="radio">
		          	      <span>
		          	        <input id="wx" name="type" type="radio" value="0" />
		          	        <label for="wx" style="padding-left: 10px;">微信</label>
		          	      </span>
		          	      <span>
		          	        <input id="zfb" name="type" checked type="radio" value="1" />
		          	        <label for="zfb" style="padding-left: 10px;">支付宝</label>
		          	      </span>
		          	      <span>
		          	        <input id="yl" name="type" checked type="radio" value="2" />
		          	        <label for="yl" style="padding-left: 10px;">银行卡</label>
		          	      </span>
		          	    </div>
		          	  </div>
                    </div>
  	          
                    <div class="form-group">
                      <label for="accNo" class="col-sm-2 control-label">收款号码</label>
                      <div class="col-sm-10">
                        <input type="text" name="accNo" id="accNo" class="form-control" placeholder="收款号码" data-bv-notempty="true"/>
                      </div>
                    </div>
  	          
                    <div class="form-group">
                      <label for="accUser" class="col-sm-2 control-label">收款人</label>
                      <div class="col-sm-10">
                        <input type="text" name="accUser" class="form-control" placeholder="收款人" data-bv-notempty="true"/>
                      </div>
                    </div>
  	          
                    <div class="form-group">
                      <label for="area" class="col-sm-2 control-label">区域</label>
                      <div class="col-sm-10">
                        <input name="area" class="form-control" placeholder="区域" />
                      </div>
                    </div>
                    
                </div>
                <!-- /.box -->
              </div>
              
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
              <button type="submit" id="save-config-btn" class="btn btn-primary">保存</button>
            </div>
          </form>
          
      </div>
    </div>
  </div>
  
  <script type="text/javascript">
      $(function(){
          $("form[id='reset_agent_info_form']").bootstrapValidator({
        	  feedbackIcons: {
        		  valid: 'glyphicon glyphicon-ok',
                  invalid: 'glyphicon glyphicon-remove',
                  validating: 'glyphicon glyphicon-refresh'
              }
          }).on('success.form.bv', function(e) {
              e.preventDefault();
              var $form = $(e.target);
              //var bv = $form.data('bootstrapValidator');
        	  request.ajax(request.contextPath+"/agents/name","put",$form.serialize(),true,function(result){
        		  if(result.success){
        			  alert(result.msg);
        		  }else{
        			  alert(result.msg);
        		  }
        	  });
          }); 
          
          $("form[id='reset_password_form']").bootstrapValidator({
        	  feedbackIcons: {
        		  valid: 'glyphicon glyphicon-ok',
                  invalid: 'glyphicon glyphicon-remove',
                  validating: 'glyphicon glyphicon-refresh'
              },
              fields: {
            	  oldPassword: {
                      validators: {
                          notEmpty: {
                              message: '密码必填'
                          },
			              different: {
			                  field: 'newPassword',
			                  message: '旧密码和密码不能相同。'
                          },regexp: {
                              regexp: "^[a-zA-Z0-9_\\.]{6,10}$",
                              message: '密码由[a-zA-Z0-9_.]组成的6到10位!'
                          }
                      }
                  },
                  newPassword: {
                      validators: {
                          notEmpty: {
                              message: '密码必填'
                          },
			              different: {
			                  field: 'oldPassword',
			                  message: '密码和旧密码不能相同。'
                          },
                          identical: {
                              field: 'confirmPassword',
                              message: '当前密码和确认密码不相同'
                          },regexp: {
                              regexp: "^[a-zA-Z0-9_\\.]{6,10}$",
                              message: '密码由[a-zA-Z0-9_.]组成的6到10位!'
                          }
                      }
                  },
                  confirmPassword: {
                      validators: {
                          notEmpty: {
                              message: '密码必填'
                          },
                          identical: {
                              field: 'newPassword',
                              message: '当前密码和确认密码不相同'
                          },regexp: {
                              regexp: "^[a-zA-Z0-9_\\.]{6,10}$",
                              message: '密码由[a-zA-Z0-9_.]组成的6到10位!'
                          }
                      }
                  }
              }
          }).on('success.form.bv', function(e) {
              e.preventDefault();
              var $form = $(e.target);
              //var bv = $form.data('bootstrapValidator');
        	  request.ajax(request.contextPath+"/agents/password","put",$form.serialize(),true,function(result){
        		  if(result.success){
        			  alert(result.msg);
        		  }else{
        			  alert(result.msg);
        		  }
        	  });
          });
          
          $("form[id='cash-config-form']").bootstrapValidator({
        	  feedbackIcons: {
        		  valid: 'glyphicon glyphicon-ok',
                  invalid: 'glyphicon glyphicon-remove',
                  validating: 'glyphicon glyphicon-refresh'
              }
          }).on('success.form.bv', function(e) {
              e.preventDefault();
              var $form = $(e.target);
        	  var id = $form.find("input[name='id']").val();
		  	  //提交数据
	  	      request.ajax(request.contextPath+"/cashConfigs/"+id,id?"put":"post",$form.serialize(),true,function(data){
  	  	          if(data.success){
  	  	        	  $('#modal-cash-config').modal('hide');
  	  	        	   $table.bootstrapTable('refresh');
  	  	          }else{
  	  	          	tip.error(data.msg);
  	  	          }
  	  	      }); 
          });
          
      	  var queryUrl = '${pageContext.request.contextPath}/cashConfigs';
      	  var $table = $('#cashConfig_table').bootstrapTable({
      		  url: queryUrl,                      //请求后台的URL（*）
              method: 'GET',                      //请求方式（*）
              toolbar: '#toolbar',                //工具按钮用哪个容器
              striped: true,                      //是否显示行间隔色
              cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
              pagination: true,                   //是否显示分页（*）
              sortable: true,                     //是否启用排序
              sortOrder: "asc",                   //排序方式
              
              sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
              
              pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
              pageSize: 10,                       //每页的记录行数（*）
              pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                 
              clickToSelect: true,                //是否启用点击选中行
              uniqueId: "id",                     //每一行的唯一标识，一般为主键列
              
              //得到查询的参数
              queryParams : function (params) {
                   var temp = {   
                       pageStart: (params.offset / params.limit) + 1,   //页码
                       sort: params.sort,      //排序列名  
                       sortOrder: params.order //排位命令（desc，asc） 
                   };
                 return temp;
              },
              
              columns: [{
                  checkbox: true,  
                  visible: true                  //是否显示复选框  
              },{
                  field: 'type',
                  title: '类型'
              },{
                  field: 'accNo',
                  title: '收款号码'
              },{
                  field: 'accUser',
                  title: '收款人'
              },{
                  field: 'area',
                  title: '区域'
              },{
                  field: 'createDate',
                  title: '创建时间',
                  formatter:createDateFormatter
              }],
              onLoadSuccess: function () {
                //加载成功触发
              },
              onLoadError: function () {
                //加载失败触发
              },
              responseHandler: function(res) {
                  return {
                      "total": res.total,//总页数
                      "rows": res.rows   //数据
                   };
              }
          });
      	  
      	  $('#modal-cash-config').on('show.bs.modal', function (e) {
      		 var $form = $(e).find("form[id='cash-config-form']");
      		 $form.bootstrapValidator('disableSubmitButtons', false).bootstrapValidator('resetForm', true);
      	  });
      	  
          //提现配置
          $("#toolbar > button").click(function(){
        	  var $form = $("form[id='cash-config-form']");
	          var ope = $(this).data("ope");  
        	  if("add"==ope){
        		   
 				  $form.find("input[name='id']").val("");
 				  //$form.find("input[name='type']").val("");
 				  $form.find("input[name='accNo']").val("");
 				  $form.find("input[name='accUser']").val("");
 				  $form.find("input[name='area']").val("");
 				   
 	      		 // $form.bootstrapValidator('disableSubmitButtons', false).bootstrapValidator('resetForm', true);
 				  
        		  //弹出层
            	  var $modal = $('#modal-cash-config');
                  $modal.modal({
                  	  keyboard: false
                  });
        	  }else{
	    		var idArray = $table.bootstrapTable('getAllSelections');
	    		if(idArray.length==0){
	    			tip.warn("至少选择一条提现配置记录");
	    			return;
	    		}
	    		idArray = $.map(idArray,function(item){
			       return item.id;
			    });
	    		if("delete"==ope){
	    			var ids = idArray.join(",");
	    			request.ajax("${pageContext.request.contextPath}/cashConfigs/"+ids,"delete",{},true,function(data){
	    				if(data.success){
	    					$table.bootstrapTable('refresh');
	    				}else{
	    					tip.error(data.msg);
	    				}
	    			});
	    		}else if("edit"==ope){
	    			//界面跳转
	    			request.ajax("${pageContext.request.contextPath}/cashConfigs/"+idArray[0],"PUT",{},true,function(data){
	    				if(data.success){
	    					data = data.data;
	    					$form.find("input[name='id']").val(data.id);  
	    					$form.find("input[name='type'][value='1']").prop("checked",true);
	    					$form.find("input[name='accNo']").val(data.accNo);
	    					$form.find("input[name='accUser']").val(data.accUser);
	    					$form.find("input[name='area']").val(data.area);
	    					$('#modal-cash-config').modal({
	    	                	  keyboard: false
	    	                });
	    				}else{
	    					tip.error(data.msg);
	    				}
	    			});
	    	     }
        	  }
    	  });
          
          $('input[name="type"]').iCheck({
              checkboxClass: 'icheckbox_square-blue',
              radioClass: 'iradio_square-blue',
              increaseArea: '20%' /* optional */
          });
      });
      
      function createDateFormatter(value,row,index) {
      	  var date = new Date(value);
      	  var y = date.getFullYear();  
      	  var m = date.getMonth() + 1;  
      	  m = m < 10 ? ('0' + m) : m;  
      	  var d = date.getDate();  
      	  d = d < 10 ? ('0' + d) : d;  
      	  var h = date.getHours();
      	  h = h < 10 ? ('0' + h) : h;
      	  var minute = date.getMinutes();
      	  var second = date.getSeconds();
      	  minute = minute < 10 ? ('0' + minute) : minute;  
      	  second = second < 10 ? ('0' + second) : second; 
      	  return y + '-' + m + '-' + d+' '+h+':'+minute+':'+second;  
      }
  </script>
</body>
</html>
 
 
 