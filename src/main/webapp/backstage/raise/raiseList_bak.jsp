<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
      String path=request.getContextPath();
      String basePath=request.getScheme() + "://" 
      + request.getServerName() + ":" + request.getServerPort() 
      + path +"/";
%>			
<!DOCTYPE html>
<html lang="en">
 <head> 
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> 
  <meta charset="utf-8" /> 
  <meta name="description" content="" /> 
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" /> 
<title>众筹列表</title> 
  <link rel="stylesheet" href="${basePath}/backstage/ui_lib/css/bootstrap.css" /> 
  <link rel="stylesheet" href="${basePath}/backstage/ui_lib/css/font-awesome.css" /> 
  <link rel="stylesheet" href="${basePath}/backstage/ui_lib/css/ace-fonts.css" /> 
  <link rel="stylesheet" href="${basePath}/backstage/ui_lib/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" /> 
  <link rel="stylesheet" href="${basePath}/backstage/ui_lib/css/select2.css" />
  <spring:url value="${basePath}/backstage/ui_lib/js/checkBoxUtil.js" var="checkBoxUtilJs" />

        <script src="${checkBoxUtilJs}"></script> 
  <script src="${basePath}/backstage/ui_lib/js/ace-extra.js"></script> 
  <script src="${basePath}/backstage/ui_lib/js/jquery.js"></script> 

  <style>
    .btn-primary {padding: 2px 10px;}
  </style>
  <script type="text/javascript">
  var baseUrl="<%=basePath%>";
  var nameurl="?brandname=";
  function batchDelete(){
		var brandIds = "";
		var brandIdArry = getCheckBoxs('checkbox');
		if(brandIdArry.length==0){
			SimplePop.alert('未选择要批处理的信息！');
			return false;
		}
     SimplePop.confirm("你确定删除所选记录吗？删除操作不能恢复!",{
              type: "error",
              confirm: function(){
                  for(var i=0;i<brandIdArry.length;i++){
                    brandIds += brandIdArry[i].value+",";
                  }
                  document.location.href = "brandBatchDelete?brandIds="+brandIds;
              }
          });    

	}
	
	
	function query(){
		var brandname= document.getElementById("brandname1").value;
		document.location.href = "brandList?brandname="+brandname;
	}


function updatemod(brandids){
	$.ajax({
		url:"brandModify",
		type:"GET",
		async:"false",
		data:{brandid:brandids},
		error : function(msg) { //若Ajax处理失败后返回的信息
            //SimplePop.alert("1");    
        },
        success :function(msg) { //若Ajax处理成功后返回的信息
            $("#updatede").click();
            $("#uptext").html($(msg).find("#uptext").html());   
        }
	});	
    }
	function updatemod2(brandids){
		$.ajax({
			url:"brandCheckInfo",
			type:"GET",
			async:"false",
			data:{brandid:brandids},
			error : function(msg) { //若Ajax处理失败后返回的信息
	            //SimplePop.alert("1");    
	        },
	        success :function(msg) { //若Ajax处理成功后返回的信息
	            $("#updatede").click();
	            $("#uptext").html($(msg).find("#uptext").html());   
	        }
		});	
	    }
	function updatachx(){
		var str=getCheckBoxs('checkbox');
		var strArr=str.length;
		if(strArr==""||strArr==0){
			SimplePop.alert("请选择一个要修改的数据！");
		}else if(strArr>1){
			SimplePop.alert("只能选择一条数据！");
			return false;
		}else{
			updatemod(str[0].value);
			return true;
		}
		
	}
    function addmod(){
	
		$.ajax({
			url:"brandAdd",
			type:"GET",
			async:"false",
			data:null,
			error : function(msg) { //若Ajax处理失败后返回的信息
                //SimplePop.alert("1");    
            },
            success :function(msg) { //若Ajax处理成功后返回的信息
            	//SimplePop.alert("2");
            	$("#uptext").html($(msg).find("#uptext").html()); 
            }
		});	
    }
	
	function clearData(obj){
		 $("#brandname1").val('');
	}
  </script>
 </head> 
 <body>
  <!--新增--> 
  <div class="md-modal md-effect-19" id="modal-5" style="width:52%;"> 
   <div class="md-content"> 
    <h3>新增修改品牌信息</h3> 
    <div> 
      <!-- 新增 --> 
   <div class="page-content"> 
    <div class="row"> 
     <div class="col-xs-12" id="uptext"> 
    <form method="POST" class="form-horizontal" role="form" action="brandAddToSave" id="brandAddForm" name="brandAddForm">
      <table width="100%" class="table6"> 
       <tbody id="tby1">
       <tr> 
         <td class="td_left" colspan="4"><b>品牌信息</b></td>  
        </tr>  
        <tr> 
         <td>品牌名称<span class="xi">*</span></td> 
         <td><input type="hidden" name="brandid"  value="${info.brandid}" id="brandid" />
         <input type="text" name="brandname" value="${info.brandname}" id="brandname" msgg="品牌名称" />
         </td>  
         <td>状态</td> 
         <td>
         <select name="status"  id="status">
          <option value="1" ${info.status==1?'selected':''}>启用</option>
           <option value="0" ${info.status==0?'selected':''}>禁用</option>
           </select>
         </td> 
        </tr>
        <tbody id="tby2"></tbody>
       </tbody> 
      </table>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />  
    </form> 
     <div class="col-xs-6" style="margin-top: 15px;"> 
     <!-- 
     <c:if test="${sessionScope.BRAND_SAVE}">
     <c:if test="${brandCheck!=1}">
      <button class="btn_new btn-primary btn-default btn-bold asd e_checked" id ="submit" name="submit" onclick="submit()" style=" margin-left:0px;display: none;" > </button>
      <button class="btn_new btn-primary btn-default btn-bold asd" id ="sub" name="sub" onclick="checktests()" style=" margin-left:0px;" >保存 </button>  
      </c:if>
      </c:if>
       -->
       <button class="btn_new btn-primary btn-default btn-bold asd e_checked" id ="submit" name="submit" onclick="submit()" style=" margin-left:0px;display: none;" > </button>
      <button class="btn_new btn-primary btn-default btn-bold asd" id ="sub" name="sub" onclick="checktests()" style=" margin-left:0px;" >保存 </button>
     </div>  
     </div>
    </div>
   </div>

     <!-- 关闭按钮 --> 
     <button class="md-close">X</button> 
    </div> 
   </div> 
  </div>
  
  <!--查询弹框--> 
  <div class="md-modal md-effect-19" id="modal-1" style="width:40%;"> 
   <div class="md-content"> 
    <h3>搜索</h3> 
    <div> 
     <form class="search-wrapper" id="search" onsubmit="return false;" style="text-align: center;"> 
      <input type="hidden" name="tabsType" value="2" /> 
      
      <table class="table6">
      <tr>
      <td>品牌名</td>
      <td><input label="品牌名" name="brandname" placeholder=" " type="text" id="brandname1" value="${brandname }"/></td>
      </tr>
      </table>
     </form> 
     <div class="btn-wrapper"> 
      <a onclick="query();" class="icon-search" id="" title="确定" >确定</a>
      <a class="icon-search" id="" onclick="clearData('modal-1')" title="重置">重置</a> 
     </div> 
     <!-- 关闭按钮 --> 
     <button class="md-close">X</button> 
    </div> 
   </div> 
  </div> 
  <!-- 表格数据 --> 
  <div class="page-content"> 
   <!-- /.page-header --> 
   <div class="row"> 
    <div class="col-xs-6" style="margin-top: 3px;"> 
    	
	   <%--  <c:if test="${sessionScope.BRAND_ADD}"> --%>
	     <button class="btn_new btn-primary btn-default btn-bold md-trigger" data-modal="modal-5" onclick="addmod();" style="margin-left:0px;"> 新增 </button> 
	  <%--    </c:if>
	     <c:if test="${sessionScope.BRAND_MODIFY}"> --%>
	     <button class="btn_new btn-primary btn-default btn-bold md-trigger" data-modal="modal-5" id="updatede" onclick="" style="display: none;"> 编辑 </button>
	     <button class="btn_new btn-primary btn-default btn-bold" id="" onclick="updatachx()" style=""> 编辑 </button>
	    <%--  </c:if>
	     <c:if test="${sessionScope.BRAND_DELETE}"> --%>
	     <button class="btn_new btn-primary btn-default btn-bold" onclick="batchDelete()"> 删除 </button> 
	    <%--  </c:if>
	     <c:if test="${sessionScope.BRAND_SELECT}"> --%>
	     <button class="btn_new btn-primary btn-default btn-bold md-trigger" data-modal="modal-1"> 查询 </button> 
	   <%--   </c:if> --%>

    </div> 
    <div class="col-xs-6" style="margin-top: 5px;float:right;"> 
     <div class="dataTables_paginate paging_simple_numbers" id="sample-table-2_paginate"> 
      <%@include file="simplePager.jsp"%> 
     </div> 
    </div> 
   </div> 
  </div> 
  <div class="hr hr-18 dotted"></div> 
  <div class="row"> 
   <div class="col-xs-12"> 
    <div class="row"> 
     <div class="col-xs-12"> 
      <div id="chenkbox"> 
       <table id="sample-table-1" class="table table-bordered "> 
        <thead class="fixedHeader"> 
         <tr> 
          <td class="tc min-3"><span>选择</span><div class="ww"></div></td> 
          <!-- <td class="tc min-5" sort="int"><span>序号</span><div class="ww"></div></td>  -->
          <td class="tc min-8" sort="int"><span>品牌ID</span><div class="ww"></div></td>
		      <td class="tc min-20" sort="string"><span>品牌名称</span><div class="ww"></div></td>
		      <td class="tc min-7" sort="string"><span>拼音码</span><div class="ww"></div></td>
		      <td class="tc min-7" sort="int"><span>状态</span><div class="ww"></div></td>
           
         </tr> 
        </thead> 
         <tbody class="scrollContent" id="tests"> 
        <c:forEach items="${page.results}" varStatus="status" var="list" >
          <tr> 
           <td class="min-3"><label class="position-relative"> 
           <input type="checkbox" class="ace" value="${list.id}" id="checkbox" name="checkbox"/> 
           <span class="lbl"></span> </label></td>  
           <!-- <td class="min-5 td_center"><a href="#" onclick="updatemod(${brand.brandid})">${status.index+1}</a></td> -->
           <td class="min-8 td_center"><a href="#" onclick="updatemod2(${list.id})">${list.raiseName}</a></td> 
           <td class="min-20 ">${list.currentPeriod}</td> 
          <%--  <td class="min-7 td_center">${brand.opcode}</td> 
           <td class="min-7 td_center">
                <c:choose>
				<c:when test="${brand.status==1}">
						启用
				</c:when>
				<c:when test="${brand.status==0}">
						禁用
				</c:when>
				
				</c:choose>
				</td> 

            --%>
          </tr> 
          <input type="hidden" value="${brand}" id="page1" />
		  </c:forEach>
		  <div id="page1tr" style="display:none;text-align:center;border: 0px;position: absolute;top: 30px;left: 30%;background-color: #fff;"><span colspan="6" id="page1tr" style="width:800px;border: 0px;">
      没有查询到相应数据，请重新输入....
      </span></div>
         </tbody>
        </table>  
      </div> 
     </div>
     <!-- /.span --> 
    </div>
    <!-- /.row --> 
   </div>
   </div>
   <!-- PAGE CONTENT ENDS --> 
  </div>
  <!-- /.col --> 
  <!-- /.row --> 
  <!-- /.page-content -->   
  <!-- 遮罩层 --> 
  <div class="md-overlay"></div> 
  <script src="../resources/core/js/popup/classie.js"></script> 
  <script src="../resources/core/js/popup/modalEffects.js"></script> 
  <script type="text/javascript">
		// 根据屏幕分辨率不同给tbody加上合适的高度
		total = document.documentElement.clientHeight;
		colHeight = total-110;
		document.getElementById("tests").style.height=colHeight+"px";
		
		 // 拖拽、排序调用
    $(document).ready(function(){
    table("sample-table-1");
    });
		
		function checktests(){
        	var nametext=document.getElementById("brandname").value;
        	
        	if(nametext==""){
        		//document.getElementById("sp1").style.display="";
        		SimplePop.alert("品牌名称不能为空");
        		return false;
        	
        	}else{
        		//$("#brandAddForm").submit();
        		submit();
        	}
        }
        function submit(){
        		showLoading();
        		$.ajax({
                    url : "brandAddToSave",
                    type : "POST", //传参方式，get 或post
                    data : $('#brandAddForm').serialize(),// 你的formid 
                    error : function(msg) { //若Ajax处理失败后返回的信息
                        //SimplePop.alert("新增失败！");
                    },
                    success : function(text) { //若Ajax处理成功后返回的信息
                        //alert(JSON.stringify(text));
                        if(text.code==1){
                        	var page = $('#pageForm').serialize();
                        	var params = $('#search').serialize();
							document.location.href = "brandList?"+page+"&"+params;
                        }else if(text.code==0){
                        	SimplePop.alert(text.msg);
                        }
                        
                    }
             });	
    	}
		</script> 
    <script src="${basePath}/backstage/ui_lib/js/bootstrap.js"></script> 
   <script src="${basePath}/backstage/ui_lib/js/style.js"></script>
 </body>
</html>				