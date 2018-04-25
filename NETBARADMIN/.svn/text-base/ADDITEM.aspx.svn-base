<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/NetBar.Master" Inherits="System.Web.Mvc.ViewPage<TGProject.Models.TGS_9YOUITEM>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	一卡通平台
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
添加道具信息
</h1>
<div class="main-div">
<%= Html.ValidationSummary("您好，添加操作作没有成功，可能出现以下原因.")%>
<form action="<%=Url.Action("ADDITEM") %>" enctype="multipart/form-data" method="post">
<table width="90%" id="general-table" align="center">
  <tr>
	<td class="label" width="100">道具名称：</td>
	<td>
	    <%=Html.TextBox("ITEMNAME","", new { maxlength = 50 })%>
	   
  	    <%= Html.ValidationMessage("ITEMNAME")%>
	</td>
  </tr>
  <tr>
  	<td class="label">道具ID：</td>
  	<td>
  	<%=Html.TextBox("ITEMID","",new {maxlength=50})%>
  	<%= Html.ValidationMessage("ITEMID")%>
  	</td>
  </tr>
  <tr>
  	<td class="label">所属游戏：</td>
  	<td>
  	 <%SelectList selectlevel = ViewData["GAMESName"] as SelectList; %>
     <%=Html.DropDownList("GAMEID", selectlevel)%>
  	</td>
  </tr>
   <tr>
  	<td class="label">道具类型：</td>
  	<td>
  	<select name="DUMMYTYPE" id="DUMMYTYPE">
  	    <option value="1">
  	        坐骑
  	    </option>
  	    <option value="2">
  	        发型
  	    </option>
  	    <option value="3">
  	        上衣
  	    </option>
  	    <option value="4">
  	        下衣
  	    </option>
  	    <option value="5">
  	        鞋子
  	    </option>
  	    <option value="6">
  	        套装
  	    </option>
  	    <option value="7">
  	        脸型
  	    </option>
  	    <option value="8">
  	        伙伴
  	    </option>
  	    <option value="9">
  	        动作
  	    </option>
  	    <option value="10">
  	        手持
  	    </option>
  	    <option value="11">
  	        DJ台
  	    </option>
  	    <option value="12">
  	        翅膀
  	    </option>
  	    <option value="13">
  	        乐器
  	    </option>
  	    <option value="14">
  	        其他
  	    </option>
  	    <option value="15">
  	        功能道具
  	    </option>
  	    <option value="16">
  	        附加道具
  	    </option>
  	</select>
  	</td>
  </tr>
  <tr>
  	<td class="label">适用性别：</td>
  	<td>
  	<select name="ITEMGENDER" id="ITEMGENDER">
  	    <option value="1">
  	        男
  	    </option>
  	    <option value="0">
  	        女
  	    </option>
  	    <option value="3">
  	        共用
  	    </option>
  	</select>
  	</td>
  </tr>
   <tr>
  	<td class="label">有效天数：</td>
  	<td>
  	<%=Html.TextBox("VAILDDATE", "0", new { maxlength = 5 })%><input type="radio" name="one" id="vaild" checked="checked"  />
    
  	<%= Html.ValidationMessage("VAILDDATE")%>
  	</td>
  </tr>
  <tr>
  	<td class="label">次数：</td>
  	<td>
  	<%=Html.TextBox("TEMLIMIT", "0", new { maxlength = 2, @readonly = "readonly" })%><input type="radio" name="one" id="time" />
  	<%= Html.ValidationMessage("TEMLIMIT")%>
  	</td>
  </tr>
  <tr>
  	<td class="label">积分：</td>
  	<td>
  	<%=Html.TextBox("POINTS","0", new { maxlength = 10 })%>
  	<%= Html.ValidationMessage("POINTS")%>
  	</td>
  </tr>
  <tr>
  	<td class="label">道具数量：</td>
  	<td>
  	    <%=Html.RadioButton("ISBIG",true,true)%> 无限
  	    <%=Html.RadioButton("ISBIG",false,false)%>有限
  	    <%=Html.TextBox("ITEMNUM", "0", new {maxlength=2 })%>个
  	</td>
  </tr>
  <tr>
  	<td class="label">图片路径：</td>
  	<td>
  	   <img alt="" src="/content/images/cardpush/no.jpg" id="item_img_9you" width="50" height="50" />
  	   <%=Html.Hidden("IMGPATH")%>
  	   <a href="javascript:;" style="color:#333;margin-left:15px;" onclick="selectImg('item_img_9you');return false;">选择图片</a>
  	</td>
  </tr>
  <tr>
  	<td class="label">热门：</td>
  	<td>
  	   <select name="HOT">
  	     <option value=1>
  	        热门商品
  	     </option>
  	     <option value=0>
  	        非热门商品
  	     </option>
  	   </select>  
  	</td>
  </tr>
  <tr>
  	<td class="label">直接激活：</td>
  	<td>
  	   <%=Html.RadioButton("ISUSE", 1,false)%> 直接激活
  	   <%=Html.RadioButton("ISUSE", 0, true)%> 不激活
  	</td>
  	
  </tr>
</table>
        
<div class="button-div">
	<input type="submit" id="submit" value=" 确定 " class="button" />
	<input type="reset" value=" 重置 " class="button" />
</div>
</form>
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

            $("#vaild").click(
                function() {
                    $("#TEMLIMIT").val("0");
                    $("#TEMLIMIT").attr("readonly", "readonly");
                    $("#VAILDDATE").removeAttr("readonly");
                }
            );

                $("#time").click(
                    function() {
                        $("#VAILDDATE").val("0");
                        $("#VAILDDATE").attr("readonly", "readonly");
                        $("#TEMLIMIT").removeAttr("readonly");
                    }
                );

            $("#submit").click(
            function() {
                var path = $("#item_img_9you").attr("src");
                $("#IMGPATH").val(path);
            }
            );
        }
    );
</script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
