<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/NetBar.Master" Inherits="System.Web.Mvc.ViewPage<TGProject.Models.News>" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	һ��ͨƽ̨
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h1>
��������
</h1>
<div class="main-div">
<%= Html.ValidationSummary("���ã����Ӳ�����û�гɹ������ܳ�������ԭ��.")%>
<% using (Html.BeginForm())
    { %>
<table width="90%" id="general-table" align="center">
  <tr>
	<td class="label" width="100">���ű��⣺</td>
	<td>
	    <%=Html.TextBox("TITLE", "", new { maxlength = 200 })%>
	   
  	    <%= Html.ValidationMessage("TITLE", "*")%>
	</td>
  </tr>
  <tr>
  	<td class="label">�����ӣ�</td>
  	<td>
  	<%=Html.TextBox("PS_VARCHAR", "", new { maxlength = 200 })%>
  	<%= Html.ValidationMessage("PS_VARCHAR", "*")%>
  	</td>
  </tr>
  
  
  	
  <tr>
    <td class="label">�������ݣ�</td>
    <td></td>
  </tr>
  <tr>
    <td align="center" colspan="2" >
        <%=Html.FckEditor("CONTENT","",new FckConfig { Width = "600", Height = "500", Skin = FckSkin.Office2003 })%>
    </td>
  </tr>
  <tr>
  
  <td>
  <center>
      <%=Html.RadioButton("TYPE","1",true) %>ֱ�Ӽ���
      <%=Html.RadioButton("TYPE","0",false)%>��ʱ����
  </center>
  </td>
  </tr>
</table>

<div class="button-div">
	<input type="submit" id="submit" value=" ȷ�� " class="button" />
	<input type="reset" value=" ���� " class="button" />
</div>
<%} %>
</div>
<script type="text/javascript" src="/fckeditor2.3.6/fckeditor.js"></script>

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