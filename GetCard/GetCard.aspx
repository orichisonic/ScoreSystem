<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	新手卡领用
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <p style="text-align:center;"><button class="ui-state-default ui-corner-all" type="submit" onclick="getCard()">新手卡领用</button></p>
 
 <div id="divIframe" title="正在领卡中........." style="text-align: center; height: 90px; width: 370px">
        <span id="displayInfo">
            <img src="/Content/images/ajax-loader.gif" /><br />
        </span><span id="msg"></span>
        <p id="closeDailog" style="text-align: center">
            <button class="fg-button ui-state-default ui-corner-left" type="button" onclick="javascript: $('#divIframe').dialog('close')">
                关闭</button>
        </p>
    </div>
 <script language="javascript" type="text/javascript">
     function getCard() {
         $("#displayInfo").show();
         $("#closeDailog").hide();

         $("#msg").html("正在领卡中.........");
         $("#divIframe").dialog("open");
         
         $.ajax({
             url: "GetCard/",
             type: "POST",
             dataType: "json",
             success: getCardSuccessed
         });
     }

     function getCardSuccessed(result) {
     
         var str = "目前已经领取的所有卡号数量 " + result.CardCount + " 张<br/>" + "目前已经被激活的所有卡号数量 " + result.ActiveCount + " 张<br/>";
         if (result.Result == 0)
             str = str + "未能成功绑定足够多的卡号,不能继续领取!<br/>";
         else if(result.Result==1)
             str = str + "成功领取!<br/>";
         else
             str = str + "领取卡号的帐号不符合规范!<br/>";

         $("#msg").html(str);
         $("#displayInfo").hide();
         $("#closeDailog").show();
     }
     
     $(function() {
         $("#divIframe").dialog({
             show: 'drop',
             bgiframe: false,
             autoOpen: false,
             draggable: true,
             resizable: true,
             modal: true,
             dialogClass: "removeCloseBtn",
             closeOnEscape: false
         });
     });
 </script>
</asp:Content>
