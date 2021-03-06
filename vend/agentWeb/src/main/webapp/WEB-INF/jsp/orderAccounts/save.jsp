<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>订单月统计管理</title>
    <%@ include file="/WEB-INF/jsp/common/common.jsp" %>
  </head>

<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">
  
   <%@ include file="/WEB-INF/jsp/common/top.jsp" %>
   
   <%@ include file="/WEB-INF/jsp/common/left.jsp" %>
   
    <div class="content-wrapper">
      <section class="content-header">
        <h1>${id==null?'添加订单月统计':'编辑订单月统计'}</h1>
        <ol class="breadcrumb">
          <li><a href="#"><i class="fa fa-dashboard"></i>系统管理</a></li>
          <li><a href="#">订单月统计管理</a></li>
          <li class="active">列表</li>
        </ol>
      </section>
  
      <!-- Main content -->
      <section class="content">
        <div class="row">
        <!-- right column -->
        <div class="col-md-12">
          <!-- Horizontal Form -->
          <div class="box box-info">
            <!-- form start -->
            <form:form class="form-horizontal" action="${pageContext.request.contextPath }/orderAccounts/${orderAccount.id }" modelAttribute="orderAccount">
            
              <form:hidden path="id"/>
              <input type="hidden" name="_method" value="${empty orderAccount.id ? 'POST' : 'PUT' }">
              
              <div class="box-body">
              
  	  
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="agentId" class="col-sm-2 control-label">代理Id</label>
                    <div class="col-sm-10">
                      <form:input path="agentId"  cssClass="form-control" placeholder="代理Id" data-bv-notempty="true"/>
                    </div>
                  </div>
  	  
                  <div class="form-group">
                    <label for="agentName" class="col-sm-2 control-label">代理名称</label>
                    <div class="col-sm-10">
                      <form:input path="agentName"  cssClass="form-control" placeholder="代理名称" data-bv-notempty="true"/>
                    </div>
                  </div>
                </div>
  	  
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="cornFinishCount" class="col-sm-2 control-label">XXXX</label>
                    <div class="col-sm-10">
                      <form:input path="cornFinishCount"  cssClass="form-control" placeholder="XXXX" />
                    </div>
                  </div>
  	  
                  <div class="form-group">
                    <label for="cornErrorCount" class="col-sm-2 control-label">XXXX</label>
                    <div class="col-sm-10">
                      <form:input path="cornErrorCount"  cssClass="form-control" placeholder="XXXX" />
                    </div>
                  </div>
                </div>
  	  
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="ticketFinishCount" class="col-sm-2 control-label">彩票</label>
                    <div class="col-sm-10">
                      <form:input path="ticketFinishCount"  cssClass="form-control" placeholder="彩票" />
                    </div>
                  </div>
  	  
                  <div class="form-group">
                    <label for="ticketFErrorCount" class="col-sm-2 control-label">XXXX</label>
                    <div class="col-sm-10">
                      <form:input path="ticketFErrorCount"  cssClass="form-control" placeholder="XXXX" />
                    </div>
                  </div>
                </div>
  	  
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="scoreFinishCount" class="col-sm-2 control-label">积分</label>
                    <div class="col-sm-10">
                      <form:input path="scoreFinishCount"  cssClass="form-control" placeholder="积分" />
                    </div>
                  </div>
  	  
                  <div class="form-group">
                    <label for="scoreErrorCount" class="col-sm-2 control-label">积分</label>
                    <div class="col-sm-10">
                      <form:input path="scoreErrorCount"  cssClass="form-control" placeholder="积分" />
                    </div>
                  </div>
                </div>
  	  
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="doorTicketFinishCount" class="col-sm-2 control-label">门票</label>
                    <div class="col-sm-10">
                      <form:input path="doorTicketFinishCount"  cssClass="form-control" placeholder="门票" />
                    </div>
                  </div>
  	  
                  <div class="form-group">
                    <label for="doorTicketErrorCount" class="col-sm-2 control-label">门票</label>
                    <div class="col-sm-10">
                      <form:input path="doorTicketErrorCount"  cssClass="form-control" placeholder="门票" />
                    </div>
                  </div>
                </div>
  	  
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="yearTicketFinishCount" class="col-sm-2 control-label">年票</label>
                    <div class="col-sm-10">
                      <form:input path="yearTicketFinishCount"  cssClass="form-control" placeholder="年票" />
                    </div>
                  </div>
  	  
                  <div class="form-group">
                    <label for="yearTicketErrorCount" class="col-sm-2 control-label">年票</label>
                    <div class="col-sm-10">
                      <form:input path="yearTicketErrorCount"  cssClass="form-control" placeholder="年票" />
                    </div>
                  </div>
                </div>
  	  
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="WXFinishCount" class="col-sm-2 control-label">微信</label>
                    <div class="col-sm-10">
                      <form:input path="WXFinishCount"  cssClass="form-control" placeholder="微信" />
                    </div>
                  </div>
  	  
                  <div class="form-group">
                    <label for="WXErrorCount" class="col-sm-2 control-label">微信</label>
                    <div class="col-sm-10">
                      <form:input path="WXErrorCount"  cssClass="form-control" placeholder="微信" />
                    </div>
                  </div>
                </div>
  	  
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="ZFBFinishCount" class="col-sm-2 control-label">支付宝</label>
                    <div class="col-sm-10">
                      <form:input path="ZFBFinishCount"  cssClass="form-control" placeholder="支付宝" />
                    </div>
                  </div>
  	  
                  <div class="form-group">
                    <label for="ZFBErrorCount" class="col-sm-2 control-label">支付宝</label>
                    <div class="col-sm-10">
                      <form:input path="ZFBErrorCount"  cssClass="form-control" placeholder="支付宝" />
                    </div>
                  </div>
                </div>
  	  
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="payAmount" class="col-sm-2 control-label">订单金额</label>
                    <div class="col-sm-10">
                      <form:input path="payAmount"  cssClass="form-control" placeholder="订单金额" data-bv-notempty="true"/>
                    </div>
                  </div>
  	  
                  <div class="form-group">
                    <label for="status" class="col-sm-2 control-label">交易完成</label>
                    <div class="col-sm-10">
                      <form:input path="status"  cssClass="form-control" placeholder="交易完成" />
                    </div>
                  </div>
                </div>
  	  
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="createDate" class="col-sm-2 control-label">统计时间</label>
                    <div class="col-sm-10">
                      <form:input path="createDate"  cssClass="form-control" placeholder="统计时间" data-bv-notempty="true"/>
                    </div>
                  </div>
                </div>
                
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="reset" class="btn btn-default btn-flat">重 置</button>
                <button type="submit" class="btn btn-success btn-flat">${empty orderAccount.id ? '保 存' : '更 新'}</button>
              </div>
              <!-- /.box-footer -->
            </form:form>
          </div>
          <!-- /.box -->
        </div>
        <!--/.col (right) -->
      </div>
        <!-- /.row -->
      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    
    <%@ include file="/WEB-INF/jsp/common/foot.jsp" %>
  </div>
  
  <script type="text/javascript">
    $(function(){
        $("form[id='orderAccount']").bootstrapValidator({
      	  feedbackIcons: {
      		  valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        }); 
    });
  </script>
  
</body>
</html>
 
 
