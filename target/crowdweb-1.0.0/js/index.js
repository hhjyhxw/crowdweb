var pageWidth = 1000;
var scrollDelay = 3000;
var scrollDuration = 1000;
var nodeContainer;
var nodePages;
var nodeWrap;
var hover = false;
nodeContainer = document.getElementById('logo');
nodeContainer.onmouseover = function() {hover = true};
nodeContainer.onmouseout = function() {hover = false};
nodePages = nodeContainer.getElementsByTagName('div');
nodeWrap = document.createElement('div');
nodeWrap.style.width = pageWidth * nodePages.length + 'px';
while (nodePages[0]) {
    nodeWrap.appendChild(nodePages[0]);
}
nodePages = nodeWrap.getElementsByTagName('div');
nodeContainer.appendChild(nodeWrap);
setInterval(function() {
    !hover && new Tween({
        duration: scrollDuration,
        trans: 'strongEaseInOut',
        from: 0,
        to: pageWidth,
        func:function() {
            nodeContainer.scrollLeft = Math.round(this.tween);
        },
        ondestroy: function() {
            nodeWrap.appendChild(nodeWrap.childNodes[0]);
            nodeContainer.scrollLeft = 0;
        }
    });
}, scrollDelay);

jQuery('.banner_box').cycle({
    fx: 'fade',
    speed:0,
    timeout:10000,
    pager:'#nav',
    pagerAnchorBuilder: function(idx, slide) {
        return '<li><a href="#" class="banner_point"></a></li>';
    },
    before:function(currSlideElement, nextSlideElement, options, forwardFlag){
        var next =  $(nextSlideElement);
        $(currSlideElement).css("background","transparent");
        next.css("background","#2a9cda").parents(".index_banner_new").css("background","#2a9cda");
        $("#enterprise_consulting").removeClass("content").attr('href','/common/ent_contact');
        if(next.attr("src") === "/images/sn_add_images/content_banner.png"){
            $("#enterprise_consulting").addClass("content").attr('href','/common/wel_content');
        }
        $("#enterprise_consulting").show();
    }
});

jQuery('.banner_box').hover(
    function(){
        jQuery('.banner_box').cycle('pause');
    },
    function(){
        jQuery('.banner_box').cycle('resume');
    }
).trigger("mouseleave");

$(".function_area_list>li").hover(function(){
	var $img = $(this).find("img");
	$img.attr("src",$img.attr("data-img")+"focus.png");
},function(){
	var $img = $(this).find("img");
	$img.attr("src",$img.attr("data-img")+"blur.png");
});
