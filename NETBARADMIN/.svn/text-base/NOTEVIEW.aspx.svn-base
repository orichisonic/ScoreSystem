<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/NetBar.Master" Inherits="System.Web.Mvc.ViewPage<TGProject.Models.TGS_EXCHANGEREALITEM>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	一卡通平台
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h1>
查看/编辑道具信息
</h1>
<div class="main-div">
<%= Html.ValidationSummary("您好，添加操作作没有成功，可能出现以下原因.")%>
<form action="<%=Url.Action("ITEMEDIT") %>" enctype="multipart/form-data" method="post">
<table width="90%" id="general-table" align="center">
  <tr>
	<td class="label" width="100">道具名称：</td>
	<td>
	   <%=Model.ITEMNAME%>
	</td>
  </tr>
  <tr>
  	<td class="label">用户ID：</td>
  	<td>
  	    <%=Model.YOU9ID%>
  	</td>
  </tr>
  <tr>
  	<td class="label">真实姓名：</td>
  	<td>
  	    <%=Model.REALNAME%>
  	</td>
  </tr>
  <tr>
  	<td class="label">电话：</td>
  	<td>
  	    <%=Model.PHONE%>
  	</td>
  </tr>
  <tr>
  	<td class="label">邮编：</td>
  	<td>
  	    <%=Model.ZIPCODE%>
  	</td>
  </tr>
 <tr>
  	<td class="label">地址：</td>
  	<td>
  	<%=Html.TextArea("ADDRESS", Model.ADDRESS, new { rows = 5 })%>
  	<%= Html.ValidationMessage("ADDRESS", "*")%>
  	</td>
  </tr>
   <tr>
  	<td class="label">玩家留言：</td>
  	<td>
  	<%=Html.TextArea("MEMO", Model.MEMO, new { rows = 5 })%>
  	<%= Html.ValidationMessage("MEMO", "*")%>
  	</td>
  </tr>
</table>
       
</form>
</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
