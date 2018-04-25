<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	PartTimeAddResult
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<ul class="verticality">
<% PTAccount condition = null;
   if (ViewData["condition"] != null) { condition = (PTAccount)ViewData["condition"]; }%>
  <li style="font-size:small; height: 20px; vertical-align:middle;">
            <b>您发展的兼职推广员<%=condition.Uname  %>，推广帐号为： </b>
        </li>
        </ul>
       
        <ul class="verticality" style=" text-align:center ; vertical-align:middle;">
            <h2 style="text-align:center; background-color:Orange;  border: 1px solid #ccc; width: 252px; height: 25px; font-size:large">8位帐号：
            <b><%=condition.Account %></b></h2>

            <h2 style="text-align:center; background-color:Orange;  border: 1px solid #ccc; width: 252px; height: 25px; font-size:large">密码：
            <b><%=condition.Pwd %></b></h2>

        <li style="text-align:center;font-size:small;">
            <span>请妥善保管该帐号和密码，切勿遗失或告知他人。 切勿遗失或告知他人。 </span>
        </li>
  </ul>
<p style="text-align: center"><button id="submitBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="GoFirst()">返回首页</button>
<button id="Button1" class="fg-button ui-state-default ui-corner-left" type="button" onclick="GoGenerate()">继续生成其它帐号</button></p>

<script type="text/javascript" language="javascript">
    function GoFirst() {
        var str = "http://" + location.host + "/Home.aspx/Index";
        location.reload(str);
    }
    function GoGenerate() {
        var str = "http://" + location.host + "/ScoreParttime.aspx/PartTimeGenerated";
        location.reload(str);
    }
</script>
</asp:Content>

