<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/NetBar.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	NETBARTurn
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 style="color:Red"> &nbsp;<%=ViewData["Message"] %></h2>
    
    如果您不做出选择，将在<span id="number"></span>秒后跳转到第一个链接地址。
    <br />
    <a style="color:Red" id="color" href='<%=Url.RouteUrl("Account", new {action=ViewData["MYURL"],page=1,strsql=1,desc=1,filename=1}) %>'>--点这里返回</a>
    <script language="javascript" type="text/javascript">
        var t;
        $(function() {
            t = setInterval("printMsg()", 1000);
        });
    var time=3;
    function printMsg() {
        time = time - 1;
        $("#number").text(time);
        if (time == 0) {
            window.clearInterval(t);
            window.location.href = '<%=Url.RouteUrl("Account", new {action=ViewData["MYURL"],page=1,strsql=1,desc=1,filename=1}) %>';
        }
    }
    </script>
    

</asp:Content>
