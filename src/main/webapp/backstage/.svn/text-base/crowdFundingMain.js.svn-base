$(function() {
	$('#queryInvoiceGrid')
	.datagrid(
			{
				title : '众筹列表',
				width : 'auto',
				height : 'auto',
				fit : true,
				fitColumns : true,
				nowrap : true,
				striped : true,
				collapsible : true,
				singleSelect : true,
				url : 'query_invoice_report',
				pageSize : 20,
				idField : 'id',
				queryParams: {
					'goodName': $('#goodName').textbox('getValue'),
					'model': $('#model').textbox('getValue'),
					'beginTime': $('#beginTime').datetimebox('getValue'),
					'endTime': $('#endTime').datetimebox('getValue'),
					'name': $('#name').textbox('getValue')
				},
				columns : [ [ {
					field : 'goodName',
					title : '订单号',
					width : $(this).width() * 0.1,
					align : 'center'
				},{
					field : 'createTime',
					title : '订单完成时间',
					width : $(this).width() * 0.2,
					align : 'center'
				}, {
					field : 'goodName',
					title : '订单类型',
					width : $(this).width() * 0.1,
					align : 'center'
				},{
					field : 'name',
					title : '会员姓名',
					width : $(this).width() * 0.1,
					align : 'center'
				},{
					field : 'phone',
					title : '手机号码',
					width : $(this).width() * 0.1,
					align : 'center'
				},{
					field : 'price',
					title : '发票申请日期',
					width : $(this).width() * 0.1,
					align : 'center'
				},{
					field : 'color',
					title : '发票类型',
					width : $(this).width() * 0.2,
					align : 'center'
				},{
					field : 'goodsCostPrice',
					title : '发票抬头',
					width : $(this).width() * 0.1,
					align : 'center'
				},{
					field : 'color',
					title : '发票金额',
					width : $(this).width() * 0.2,
					align : 'center'
				},{
					field : 'goodsSalePrice',
					title : '开具状态',
					width : $(this).width() * 0.1,
					align : 'center'
				}
				] ],
				pagination : true,
				rownumbers : true
			});
	
	
	// 查询
	$("#btnQuery").bind("click", function() {
		search();
	});
	// 绑定enter建查询
	$(document).keydown(function(event) {
		if (event.keyCode == 13) {
			search();
		}
	});
	// 清空
	$("#btnClear").bind("click", function() {
		if($('#goodName').length > 0) {
			$('#goodName').textbox('setValue', '');
		}
		if($('#model').length > 0) {
			$('#model').textbox('setValue', '');
		}
		$('#beginTime').datetimebox('setValue', '');
		$('#endTime').datetimebox('setValue', '');
		if($('#name').length > 0) {
			$('#name').textbox('setValue', '');
		}
	});
	// 查询
	function search() {	
		$('#queryInvoiceGrid').datagrid('load', {
			'goodName': $('#goodName').textbox('getValue'),
			'model': $('#model').textbox('getValue'),
			'beginTime': $('#beginTime').textbox('getValue'),
			'endTime': $('#endTime').textbox('getValue'),
			'name': $('#name').textbox('getValue')
		});	
	}

	//商城商品库存查询导出excel链接
	$("#btnExport").bind("click",function(){
	    var goodName = $.trim($("input[name='goodName']").val());
	    var model = $.trim($("input[name='model']").val());
	    var beginTime = $.trim($("input[name='beginTime']").val());
	    var endTime = $.trim($("input[name='endTime']").val());
	    var name = $.trim($("input[name='name']").val());
	    $("#queryInvoice").form("submit", {
					url : "export_query_invoice_excel?goodName="+goodName+"&model="+model+"&beginTime="+beginTime+"&endTime="+endTime+"&name="+name,
					onSubmit : function() {
						
					},
					success : function(result) {
					}
				});
	    });	
	});
