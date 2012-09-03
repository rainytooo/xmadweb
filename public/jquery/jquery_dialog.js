<!--
/*****************************************************************************

[作者]
吴剑 http://wu-jian.cnblogs.com/
http://www.cnblogs.com/wu-jian/archive/2010/02/03/1662751.html

[版本记录]
2009-06-01：版本1.0.1发布。
2009-07-05：版本1.0.2，更新了一些明显的BUG，完全支持了IE系列浏览器。
2009-08-15：版本1.0.3，封装了标准DOM，多浏览器下兼容，样式美化，添加了阴影效果。
2009-11-05：版本2.0.0，基于JQuery全新封装，应用了JS的命名空间，避免了客户端id冲突。
			项目正式更名为JQuery Dialog，优化了拖拽的核心实现，完全支持跨浏览器。
2009-12-13：版本2.0.1，优化了核心的拖拽算法，分离出DragAndDrop类。
			使用异步的Javascript让拖拽更为流畅。
			修复了鼠标拖动过快Dialog停顿的BUG。
			对拖拽的位置与滚动条之间进行协调，限制拖拽范围，修复了原有BUG。
			修复了当Dialog宽或高大于页面时定位的BUG。
			修复了鼠标样式与拖拽控制区不精确的BUG。
			至此，完善为一个较为强壮JQuery插件了。
2010-02-03：版本2.0.3，JQuery升级为1.4。
			为Open增加了内部扩展接口。
			修复IE6下部分显示BUG。
2010-07-29：版本2.0.4，修改了部分配置及调用方法
2012-08-09：版本2.0.5，修复子页面控件无法获取焦点BUG。
            修复IE下调用Close方法导致其它脚本错误的BUG。

*****************************************************************************/

var JqueryDialog = {
	
	//配置项
	//模态窗口背景色
	"cBackgroundColor"			:	"#ffffff",
	
	//阴影距离(右)
	"cShdowRight"				:	5,
	//阴影距离(下)
	"cShdowDown"				:	5,
	
	//边框尺寸(像素)
	"cBorderSize"				:	2,
	//边框颜色
	"cBorderColor"				:	"#999999",

	//Header背景色
	"cHeaderBackgroundColor"	:	"#f0f0f0",
	//右上角关闭显示文本
	"cCloseText"				:	"X 关闭",
	//鼠标移上去时的提示文字
	"cCloseTitle"				:	"关闭",
	
	//Bottom背景色
	"cBottomBackgroundColor"	:	"#f0f0f0",
	//提交按钮文本
	"cSubmitText"				:	"提 交",
	//取消按钮文本
	"cCancelText"				:	"取 消",
	
	//拖拽效果
	"cDragTime"					:	"100",
	
	/// <summary>创建对话框(自定义)</summary>
	/// <param name="dialogTitle">对话框标题</param>
	/// <param name="iframeSrc">iframe嵌入页面地址</param>
	/// <param name="iframeWidth">iframe嵌入页面宽</param>
	/// <param name="iframeHeight">iframe嵌入页面高</param>
	Open:function(dialogTitle, iframeSrc, iframeWidth, iframeHeight){
		JqueryDialog.init(dialogTitle, iframeSrc, iframeWidth, iframeHeight, true, true);
	},
	
	/// <summary>创建对话框(自定义1,不包含底部)</summary>
	/// <param name="dialogTitle">对话框标题</param>
	/// <param name="iframeSrc">iframe嵌入页面地址</param>
	/// <param name="iframeWidth">iframe嵌入页面宽</param>
	/// <param name="iframeHeight">iframe嵌入页面高</param>
	Open1:function(dialogTitle, iframeSrc, iframeWidth, iframeHeight){
		JqueryDialog.init(dialogTitle, iframeSrc, iframeWidth, iframeHeight, false, true);
	},
	
init:function(dialogTitle, iframeSrc, iframeWidth, iframeHeight, isBottom, isDrag){var _px_shadow = 5;var _px_top = 30;var _px_bottom = 50;if(!isBottom){_px_bottom = 0;}var _client_width = document.body.clientWidth;var _client_height = document.documentElement.scrollHeight;if(typeof($("#jd_shadow")[0]) == "undefined"){$("body").prepend("<div id='jd_shadow'>&nbsp;</div>");var _jd_shadow = $("#jd_shadow");_jd_shadow.css("width", _client_width + "px");_jd_shadow.css("height", _client_height + "px");}if(typeof($("#jd_dialog")[0]) != "undefined"){$("#jd_dialog").remove();}$("body").prepend("<div id='jd_dialog'></div>");var _jd_dialog = $("#jd_dialog");var _left = (_client_width - (iframeWidth + JqueryDialog.cBorderSize * 2 + JqueryDialog.cShdowRight)) / 2;_jd_dialog.css("left", (_left < 0 ? 0 : _left) + document.documentElement.scrollLeft + "px");var _top = (document.documentElement.clientHeight - (iframeHeight + JqueryDialog.cBorderSize * 2 + _px_top + _px_bottom + JqueryDialog.cShdowDown)) / 2;_jd_dialog.css("top", (_top < 0 ? 0 : _top) + document.documentElement.scrollTop + "px");_jd_dialog.append("<div id='jd_dialog_s'>&nbsp;</div>");var _jd_dialog_s = $("#jd_dialog_s");_jd_dialog_s.css("width", iframeWidth + JqueryDialog.cBorderSize * 2 + "px");_jd_dialog_s.css("height", iframeHeight + JqueryDialog.cBorderSize * 2 + _px_top + _px_bottom + "px");_jd_dialog_s.css("left", JqueryDialog.cShdowRight + "px");_jd_dialog_s.css("top", JqueryDialog.cShdowDown + "px");_jd_dialog.append("<div id='jd_dialog_m'></div>");var _jd_dialog_m = $("#jd_dialog_m");_jd_dialog_m.css("border", JqueryDialog.cBorderColor + " " + JqueryDialog.cBorderSize + "px solid");_jd_dialog_m.css("width", iframeWidth + "px");_jd_dialog_m.css("background-color", JqueryDialog.cBackgroundColor);_jd_dialog_m.append("<div id='jd_dialog_m_h'></div>");var _jd_dialog_m_h = $("#jd_dialog_m_h");_jd_dialog_m_h.css("background-color", JqueryDialog.cHeaderBackgroundColor);_jd_dialog_m_h.append("<span id='jd_dialog_m_h_l'>" + dialogTitle + "</span>");_jd_dialog_m_h.append("<span id='jd_dialog_m_h_r' title='" + JqueryDialog.cCloseTitle + "' onclick='JqueryDialog.Close();'>" + JqueryDialog.cCloseText + "</span>");_jd_dialog_m.append("<div id='jd_dialog_m_b'></div>");var _jd_dialog_m_b = $("#jd_dialog_m_b");_jd_dialog_m_b.css("width", iframeWidth + "px");_jd_dialog_m_b.css("height", iframeHeight + "px");_jd_dialog_m_b.append("<div id='jd_dialog_m_b_1'>&nbsp;</div>");var _jd_dialog_m_b_1 = $("#jd_dialog_m_b_1");_jd_dialog_m_b_1.css("top", "30px");_jd_dialog_m_b_1.css("width", iframeWidth + "px");_jd_dialog_m_b_1.css("height", iframeHeight + "px");_jd_dialog_m_b_1.css("display", "none");_jd_dialog_m_b.append("<div id='jd_dialog_m_b_2'></div>");$("#jd_dialog_m_b_2").append("<iframe id='jd_iframe' src='"+iframeSrc+"' scrolling='no' frameborder='0' width='"+iframeWidth+"' height='"+iframeHeight+"' />");if(isBottom){_jd_dialog_m.append("<div id='jd_dialog_m_t' style='background-color:"+JqueryDialog.cBottomBackgroundColor+";'></div>");var _jd_dialog_m_t = $("#jd_dialog_m_t");_jd_dialog_m_t.append("<span><input id='jd_submit' value='"+JqueryDialog.cSubmitText+"' type='button' onclick='JqueryDialog.Ok();' /></span>");_jd_dialog_m_t.append("<span class='jd_dialog_m_t_s'><input id='jd_cancel' value='"+JqueryDialog.cCancelText+"' type='button' onclick='JqueryDialog.Close();' /></span>");}if(isDrag){DragAndDrop.Register(_jd_dialog[0], _jd_dialog_m_h[0]);}$("#jd_iframe")[0].focus();},Close:function(){if(typeof($("#jd_shadow")[0]) != "undefined"){$("#jd_shadow").remove();}if(typeof($("#jd_dialog")[0]) != "undefined"){$("#jd_iframe")[0].src = "";$("#jd_dialog").remove();}},Ok:function(){var frm = $("#jd_iframe");frm[0].contentWindow.Ok();frm[0].focus();},SubmitCompleted:function(alertMsg, isCloseDialog, isRefreshPage){if($.trim(alertMsg).length > 0 ){alert(alertMsg);}if(isCloseDialog){JqueryDialog.Close();}if(isRefreshPage){window.location.href = window.location.href;}},SubmitCompleted1:function(alertMsg, parentUrl){if($.trim(alertMsg).length > 0 ){alert(alertMsg);}JqueryDialog.Close();window.location.href = parentUrl;}};var DragAndDrop = function(){var _clientWidth;var _clientHeight;var _controlObj;var _dragObj;var _flag = false;var _dragObjCurrentLocation;var _mouseLastLocation;var getElementDocument = function(element){return element.ownerDocument || element.document;};var dragMouseDownHandler = function(evt){if(_dragObj){evt = evt || window.event;_clientWidth = document.body.clientWidth;_clientHeight = document.documentElement.scrollHeight;$("#jd_dialog_m_b_1").css("display", "");_flag = true;_dragObjCurrentLocation = {x : $(_dragObj).offset().left,y : $(_dragObj).offset().top};_mouseLastLocation = {x : evt.screenX,y : evt.screenY};$(document).bind("mousemove", dragMouseMoveHandler);$(document).bind("mouseup", dragMouseUpHandler);if(evt.preventDefault){evt.preventDefault();}else{evt.returnValue = false;}}};var dragMouseMoveHandler = function(evt){	if(_flag){	evt = evt || window.event;var _mouseCurrentLocation = {x : evt.screenX,y : evt.screenY};_dragObjCurrentLocation.x = _dragObjCurrentLocation.x + (_mouseCurrentLocation.x - _mouseLastLocation.x);_dragObjCurrentLocation.y = _dragObjCurrentLocation.y + (_mouseCurrentLocation.y - _mouseLastLocation.y);_mouseLastLocation = _mouseCurrentLocation;$(_dragObj).css("left", _dragObjCurrentLocation.x + "px");$(_dragObj).css("top", _dragObjCurrentLocation.y + "px");if(evt.preventDefault){evt.preventDefault();}else{evt.returnValue = false;}}};var dragMouseUpHandler = function(evt){if(_flag){evt = evt || window.event;$("#jd_dialog_m_b_1").css("display", "none");cleanMouseHandlers();_flag = false;}};var cleanMouseHandlers = function(){if(_controlObj){$(_controlObj.document).unbind("mousemove");$(_controlObj.document).unbind("mouseup");}};return {Register : function(dragObj, controlObj){_dragObj = dragObj;_controlObj = controlObj;$(_controlObj).bind("mousedown", dragMouseDownHandler);}}}();
//-->