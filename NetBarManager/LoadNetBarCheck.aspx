<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	LoadNetBarCheck
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
±àºÅ:<input type="text" id="netbarID" /><button class="ui-state-default ui-corner-all" type="button" onclick="searchLoad()">OK</button>
<div id="results"></div>
<script type="text/javascript" language="javascript">
    function searchLoad() {
        alert("µÈ´ý²âÊÔ½á¹û");
        var idArray = $("#netbarID").val().split(',');
        var barName = idArray[0];
        var areaID = idArray[1];
        
        $.ajax({
            url: "LoadNetBarCheck/",
            data: { BarName: barName, AreaID: areaID },
            type: "POST",
            dataType: "json",
            success: areaSuccessed
        });
    }

    function areaSuccessed(result) {
        $("#results").html(result.isSuccessed);
    }
</script>
</asp:Content>
