 
  function show(id,bg_div)
  {
     var Idiv=document.getElementById(id); 
     Idiv.style.display="block";
     //以下部分要将弹出层居中显示
     Idiv.style.left=(document.documentElement.clientWidth-Idiv.clientWidth)/2+document.documentElement.scrollLeft+"px"; 
     Idiv.style.top=(document.documentElement.clientHeight-Idiv.clientHeight)/2+document.documentElement.scrollTop-50+"px";//此处出现问题，弹出层左右居中，但是高度却不居中，显示在上部分，导致一                                                                                                                       //部分不可见,于是暂时在下面添加margin-top

     document.getElementById(bg_div).style.display='block' ;
     document.getElementById(bg_div).style.zIndex='500' ;
     var bgdiv = document.getElementById(bg_div);
     bgdiv.style.width = document.body.scrollWidth;
     // bgdiv.style.height = $(document).height();
     $("#"+bg_div).height($(document).height());
 


     //以下部分实现弹出层的拖拽效果
//var posX;
    // var posY;
   //  Idiv2.onmousedown=function(e)
    // {
       //  if(!e) e = window.event;  //IE
         //posX = e.clientX - parseInt(Idiv2.style.left);
        // posY = e.clientY - parseInt(Idiv2.style.top);
         //document.onmousemove = mousemove;           
    // }
    // document.onmouseup =function()
    // {
         //document.onmousemove =null;
     //}
     //function mousemove(ev)
    //{
       // if(ev==null) ev = window.event;//IE
       // Idiv2.style.left = (ev.clientX - posX) +"px";
       // Idiv2.style.top = (ev.clientY - posY) +"px";
    // }
   
 } 
 function closeDiv(id,bg_div)               //关闭弹出层
 {

     var Idiv=document.getElementById(id); 
     Idiv.style.display="none";
     document.getElementById(bg_div).style.display='none';
   
 }
