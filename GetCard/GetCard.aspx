<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	���ֿ�����
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <p style="text-align:center;"><button class="ui-state-default ui-corner-all" type="submit" onclick="getCard()">���ֿ�����</button></p>
 
 <div id="divIframe" title="�����쿨��........." style="text-align: center; height: 90px; width: 370px">
        <span id="displayInfo">
            <img src="/Content/images/ajax-loader.gif" /><br />
        </span><span id="msg"></span>
        <p id="closeDailog" style="text-align: center">
            <button class="fg-button ui-state-default ui-corner-left" type="button" onclick="javascript: $('#divIframe').dialog('close')">
                �ر�</button>
        </p>
    </div>
 <script language="javascript" type="text/javascript">
     function getCard() {
         $("#displayInfo").show();
         $("#closeDailog").hide();

         $("#msg").html("�����쿨��.........");
         $("#divIframe").dialog("open");
         
         $.ajax({
             url: "GetCard/",
             type: "POST",
             dataType: "json",
             success: getCardSuccessed
         });
     }

     function getCardSuccessed(result) {
     
         var str = "Ŀǰ�Ѿ���ȡ�����п������� " + result.CardCount + " ��<br/>" + "Ŀǰ�Ѿ�����������п������� " + result.ActiveCount + " ��<br/>";
         if (result.Result == 0)
             str = str + "δ�ܳɹ����㹻��Ŀ���,���ܼ�����ȡ!<br/>";
         else if(result.Result==1)
             str = str + "�ɹ���ȡ!<br/>";
         else
             str = str + "��ȡ���ŵ��ʺŲ����Ϲ淶!<br/>";

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
