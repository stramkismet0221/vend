<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <%@ include file="/WEB-INF/jsp/common/common.jsp" %>
  <title>商品详情</title>
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <%@ include file="/WEB-INF/jsp/common/top.jsp" %>

  <%@ include file="/WEB-INF/jsp/common/left.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>商品详情</h1>
      <ol class="breadcrumb">
        <li class="active">商品详情</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-4">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="img-responsive" style="margin: 0 auto;" src="${applicationScope.imageServer}${product.img}" alt="User profile picture">
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-8">

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-body">

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>名称</b> <a class="pull-right">${product.name}</a>
                </li>
                <li class="list-group-item">
                  <b>编号</b> <a class="pull-right">${product.productNum}</a>
                </li>
                <li class="list-group-item">
                  <b>成本</b> <a class="pull-right">${product.cost}</a>
                </li>
                <li class="list-group-item">
                  <b>单价</b> <a class="pull-right">${product.price}</a>
                </li>
                <li class="list-group-item">
                  <b>库存</b> <a class="pull-right">${product.storeCount}</a>
                </li>
                <li class="list-group-item">
                  <b>货道</b> <a class="pull-right">${product.orderNum}</a>
                </li>
                <li class="list-group-item">
                  <b>阀值</b> <a class="pull-right">${product.threshold}</a>
                </li>
                <li class="list-group-item">
                  <b>缺货状态</b> <a class="pull-right">${product.countStatus==1?"充足":"缺货"}</a>
                </li>
              </ul>

              <strong><i class="fa fa-pencil margin-r-5"></i>商品组</strong>
              <p>
                <span class="label label-primary">${product.productGroup.name}</span>
              </p>
              <hr>
              <strong><i class="fa fa-pencil margin-r-5"></i>所属设备</strong>
              <p>
                <span class="label label-success">${product.dev.num}</span>
              </p>
              <hr>
              <strong><i class="fa fa-file-text-o margin-r-5"></i>备注</strong>
              <p>暂无备注</p>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
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
</body>
</html>


