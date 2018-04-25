<%@ Page Language="C#" MasterPageFile="~/Views/Shared/NetBar.Master" Inherits="System.Web.Mvc.ViewPage<System.Web.Mvc.HandleErrorInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	异常信息
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div id="dialog" title="异常信息">
			<%--<strong>请将错误内容发送到</strong>：<br />胡军/数据管理中心/上海/runstar<br /><br />--%>
			<%=ViewData["ErrorMessage"].ToString() %>
		</div>
		
		
		
		<script type="text/javascript">

		    $(function() {
		        $('#dialog').dialog({
		            autoOpen: true,
		            width: 700,
		            show: 'drop',
		            bgiframe: false,
		            autoOpen: true,
		            draggable: true,
		            resizable: true,
		            modal: true,
		            buttons: {
		                "Close": function() {
		                    $('#dialog').dialog("close");
		                    location.href = "/netbaradmin.aspx/logout";
		                }
		            }
		        });
		    });
		</script>
</asp:Content>
