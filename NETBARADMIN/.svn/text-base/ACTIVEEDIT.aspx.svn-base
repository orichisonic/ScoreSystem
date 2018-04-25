<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/NetBar.Master" Inherits="System.Web.Mvc.ViewPage<TGProject.Models.TGS_9YOUACTIVE>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	一卡通平台
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h1>
编辑活动信息
</h1>
<div class="main-div">
<%= Html.ValidationSummary("您好，添加操作作没有成功，可能出现以下原因.")%>
<%using (Html.BeginForm())
  { %>
<table width="90%" id="general-table" align="center">
   
   <tr>
  	<td class="label">选择游戏：</td>
  	<td>
  	 <%SelectList selectlevel = ViewData["GAMESName"] as SelectList; %>
     <%=Html.DropDownList("GAMECODE", selectlevel)%>
     <%=Html.Hidden("ACTIVEID", Model.ACTIVEID)%>
  	</td>
  </tr>
  <tr>
	<td class="label" width="100">活动名称：</td>
	<td>
	    <%=Html.TextBox("ACTIVENAME",Model.ACTIVENAME, new { maxlength = 50 })%>
  	    <%= Html.ValidationMessage("ACTIVENAME","*")%>
	</td>
  </tr>
  <tr>
  	<td class="label">开始时间：</td>
  	<td>
  	<%=Html.TextBox("ACTIVEDATE",Model.ACTIVEDATE, new { maxlength = 50 })%>
  	<%= Html.ValidationMessage("ACTIVEDATE","*")%>
  	</td>
  </tr>
  <tr>
  	<td class="label">结束时间：</td>
  	<td>
  	 <%=Html.TextBox("ACTIVEENDDATE",Model.ACTIVEENDDATE, new { maxlength = 50 })%>
  	<%= Html.ValidationMessage("ACTIVEENDDATE","*")%>
  	</td>
  </tr>
  
   <tr>
  	<td class="label">活动奖励：</td>
  	<td>
  	<%=Html.TextBox("AWARD",Model.AWARD , new { maxlength = 5 })%> 积分
  	<%= Html.ValidationMessage("AWARD","*")%>
  	</td>
  </tr>
  <tr>
  	<td class="label">活动介绍：</td>
  	<td>
  	<%=Html.TextArea("ACTIVEDESC", Model.ACTIVEDESC, new { rows=5})%>
  	<%= Html.ValidationMessage("ACTIVEDESC","*")%>
  	</td>
  </tr>
  <tr>
  	<td class="label">活动链接：</td>
  	<td>
  	<%=Html.TextBox("LINK",Model.LINK, new { maxlength = 100 })%>
  	<%= Html.ValidationMessage("LINK", "*")%>
  	</td>
  </tr>
  <tr>
        <td class="label">活动大区：</td>
    <td>
  	<select name="GAMEAREAList" id="GAMEAREAList" multiple="multiple" size="5" onclick="cc()">
  	    <option value="0" onclick="click">
  	        所有大区
  	    </option>
  	    <option value="1" onclick="click">
  	        华东一区
  	    </option>
  	    <option value="2">
  	        全国同城
  	    </option>
  	</select>
 
    <textarea rows="5" name="GAMEAREA" id="GAMEAREA" >
    <%=Model.GAMEAREA.Trim()%>
    </textarea>
    <%= Html.ValidationMessage("GAMEAREA","*")%>
  	</td>
  </tr>
  <tr>
  	<td class="label">活动图片：</td>
  	<td>
  	    
  	   <img alt="" src='<%=Html.Encode(Model.IMGPATH)%>' id="item_img_9you" width="50" height="50" />
  	   <%=Html.Hidden("IMGPATH")%>
  	   <a href="javascript:;" style="color:#333;margin-left:15px;" onclick="selectImg('item_img_9you');return false;">选择图片</a>
  	</td>
  </tr>
</table>
        
<div class="button-div">
	<input type="submit" id="submit" value=" 确定 " class="button" />
	<input type="reset" value=" 重置 " class="button" />
</div>
<%} %>
</div>

<link href="/Content/css/jscal2.css" rel="stylesheet" type="text/css" />
<link href="/Content/css/reduce-spacing.css" rel="stylesheet" type="text/css" />
<script src="/Scripts/jscal2.js" type="text/javascript"></script>
<script src="/Scripts/cn.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
    function selectImg(id) {
        $("#browser_img_div").show();
        tb_show("", '<%= Url.Action("ListImages") %>?arg=' + id + '#?KeepThis=true&TB_iframe=true&height=400&width=630&modal=true', "thickbox");


    }
    $(
        function() {
            showCal('ACTIVEDATE');
            showCal('ACTIVEENDDATE');
            $("#submit").click(
            function() {
                var path = $("#item_img_9you").attr("src");
                $("#IMGPATH").val(path);
            }
            );


        }
    );

    function cc() {

        var text = $("#GAMEAREAList option:selected").text() + ",";

        var GAMEARETEXT = $("#GAMEAREA").val();

        if ((GAMEARETEXT.toLowerCase().indexOf(text) >= 0)) {

        }
        else {
            GAMEARETEXT = GAMEARETEXT + text;
            $("#GAMEAREA").val(GAMEARETEXT);
        }

    }


    function showCal(id) {
        var LEFT_CAL = Calendar.setup({
            //cont: "cont",
            weekNumbers: false,
            selectionType: Calendar.SEL_MULTIPLE,
            //showTime: 12,
            showTime: 24,
            fdow: 0,
            trigger: id, // 触发控件id
            inputField: id,
            //min: 最小
            //max: 最大
            titleFormat: "%B %Y",
            onSelect: function(cal) {
                cal.hide();
                var date = cal.selection.get();
                if (date) {
                    date = Calendar.intToDate(date);
                    document.getElementById(id).value = Calendar.printDate(date, "%Y-%m-%d");
                }
            }
        })
    }
</script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
