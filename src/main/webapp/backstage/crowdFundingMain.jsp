<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="UTF-8">
	<title>众筹列表</title>
    <link rel="stylesheet" type="text/css" href="ui_lib/css/themes/metro-gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="ui_lib/css/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="ui_lib/css/themes/color.css">
    <script type="text/javascript" src="ui_lib/js/jquery.min.js"></script>
    <script type="text/javascript" src="ui_lib/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="ui_lib/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="ui_lib/js/validator-extend.js" charset="UTF-8"></script>
	<script type="text/javascript" src="crowdFundingMain.js"></script>	
	
	<style type="text/css" >
	#conversionForm {
		margin: 0;
		padding: 10px 30px;
	}
	
	.ftitle {
		font-size: 14px;
		font-weight: bold;
		padding: 5px 0;
		margin-bottom: 10px;
		border-bottom: 1px solid #ccc;
	}
	
	.fitem {
		margin-bottom: 5px;
	}
	
	.fitem label {
		display: inline-block;
		width: 80px;
		
	}
	
	.fitem input {
		width: 160px;
	}
	
	.fitem a {
		margin-right: 5px;
	}
	</style>
</head>

<body>
   
	<table id="queryInvoiceGrid" toolbar="#toolbar"></table>

	<!--列表工具栏 -->
	<form id="queryInvoice" method="post" action="#" enctype="multipart/form-data" >
	<div id="toolbar" style="height:auto">
	 <div id="toolbar" style="height:auto">
		 	<c:choose>
				<c:otherwise>
					<label class="label">订单号&nbsp;</label>
					<input class="easyui-textbox"" name="goodName" id="goodName" style="width: 120px;">
				</c:otherwise>
			</c:choose>		
	     	<c:choose>
			<c:otherwise>
					<label class="label">订单类型&nbsp;</label>
                   <input class="easyui-combobox" id="model" data-options="url:'searchGoodsModel',valueField:'model',textField:'model',panelHeight:'150'"> 
			</c:otherwise>
			</c:choose>
            <c:choose>
			 <c:otherwise>
				 <label class="label">会员姓名&nbsp;</label>
				  <input class="easyui-textbox"" name="name" id="name" style="width: 120px;">
				</c:otherwise>
			</c:choose>
            <c:choose>
			 <c:otherwise>
				 <label class="label">会员手机&nbsp;</label>
				  <input class="easyui-textbox"" name="phone" id="phone" style="width: 120px;">
				</c:otherwise>
			</c:choose>	
			<br/>
			<label class="label">日期&nbsp;</label>
			<input id="beginTime" name="beginTime" class="easyui-datetimebox"/>
			<label class="label" style="text-align: center;">至</label>
			<input id="endTime" name="endTime" class="easyui-datetimebox"/>		
			<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" plain="true" id="btnQuery">查询</a>
		    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-print" plain="true"  id="btnExport">导出excel</a> 
		    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" plain="true"  id="btnExport">发票已开具</a> 
			<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-reload" plain="true" id="btnClear">清空</a>
		</div>	
	</div>
	</form>
</body>
</html>