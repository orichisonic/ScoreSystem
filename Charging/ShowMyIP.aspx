<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ShowMyIP
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <div style="text-align:center;padding-top:100px;"><h2><font color="Orange">您现在的IP为:<%=ViewData["MyIP"].ToString() %></font></h2></div>

</asp:Content>
