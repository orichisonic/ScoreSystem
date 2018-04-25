<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/NetBar.Master" Inherits="System.Web.Mvc.ViewPage<TGProject.Models.News>" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	一卡通平台
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h1>
新闻编辑
</h1>
<div class="main-div">
<%= Html.ValidationSummary("您好，添加操作作没有成功，可能出现以下原因.")%>
<% using (Html.BeginForm())
    { %>
<table width="90%" id="general-table" align="center">
  <tr>
	<td class="label" width="100">新闻标题：</td>
	<td>
	    <%=Html.TextBox("TITLE",Model.TITLE, new { maxlength = 50 })%>
	   
  	    <%= Html.ValidationMessage("TITLE", "*")%>
	</td>
  </tr>
  <tr>
  	<td class="label">外连接：</td>
  	<td>
  	<%=Html.TextBox("PS_VARCHAR",Model.PS_VARCHAR , new { maxlength = 10 })%>
  	<%= Html.ValidationMessage("PS_VARCHAR", "*")%>
  	</td>
  </tr>	
  <tr>
    <td class="label">新闻内容：</td>
    <td></td>
  </tr>
  <tr>
    <td align="center" colspan="2" >
        <%=Html.TextArea("Account",Model.CONTENT)%>
        <%=Html.FckEditor("CONTENT","", new FckConfig { Width = "600", Height = "500", Skin = FckSkin.Office2003 })%>
    
    </td>
  </tr>
</table>

<div class="button-div">
	<input type="submit" id="submit" value=" 确定 " class="button" />
	<input type="reset" value=" 重置 " class="button" />
</div>
<%} %>
</div>
<script type="text/javascript" src="/fckeditor2.3.6/fckeditor.js"></script>

<link href="/Content/css/jscal2.css" rel="stylesheet" type="text/css" />
<link href="/Content/css/reduce-spacing.css" rel="stylesheet" type="text/css" />
<script src="/Scripts/jscal2.js" type="text/javascript"></script>
<script src="/Scripts/cn.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">

    $(
        function() {
                $("#Account").hide();
                var ITEMDESC = $("#Account").val();
                $("#CONTENT").val(ITEMDESC);
        }
    );
</script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
