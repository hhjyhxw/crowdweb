/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.filebrowserUploadUrl="actions/ckeditorUpload";
	var pathName = window.document.location.pathname;
	    //获取带"/"的项目名，如：/uimcardprj
	var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	config.filebrowserImageUploadUrl = projectName+'/servlet/CkeditorFileUpload'; //固定路径 

    config.language = 'zh-cn'; 

   // 设置宽高 
   // config.width = 400;
//    config.height = 500; 

   // 编辑器样式，有三种：'kama'（默认）、'office2003'、'v2' 
    config.skin = 'v2'; 

    // 背景颜色 
    config.uiColor = '#FFF'; 
    
    // 工具栏（基础'Basic'、全能'Full'、自定义）plugins/toolbar/plugin.js 
    //   config.toolbar = 'Basic'; 
//    config.toolbar = 'Full';
    config.font_names='宋体/宋体;黑体/黑体;仿宋/仿宋_GB2312;楷体/楷体_GB2312;隶书/隶书;幼圆/幼圆;微软雅黑/微软雅黑;'+ config.font_names;
    config.font_defaultLabel = '宋体';
    ////是屏蔽p标签的。
    config.shiftEnterMode = CKEDITOR.ENTER_P;
    //是屏蔽br标签的。回车会产生br标签
    config.enterMode = CKEDITOR.ENTER_BR;
    //默认是源文件
    //config.startupMode = 'source';
    config.extraPlugins += (config.extraPlugins ? ',lineheight' : 'lineheight');
    config.toolbarStartupExpanded = true; //默认展开工具栏
    config.removePlugins = 'elementspath';//不显示底部标签
   // config.toolbarCanCollapse = false;//设置工具栏是否可以收缩
    config.resize_enabled = false;
    //定义工具栏
    config.toolbar_Full = [ ['Source'], 
['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'], 
['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'], 
['Bold','Italic','Underline','Strike','-','Subscript','Superscript'], 
['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'], 
['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'], 
['Image','Table','HorizontalRule','SpecialChar'], 
['Styles','Format','Font','FontSize'], 
['TextColor','BGColor'] 
]; 











};
