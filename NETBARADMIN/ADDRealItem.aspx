<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/NetBar.Master" Inherits="System.Web.Mvc.ViewPage<TGProject.Models.TGS_9YOU_REALITEM>" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	һ��ͨƽ̨
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h1>
ʵ���������
</h1>
 <script type="text/javascript" src="/fckeditor2.3.6/fckeditor.js"></script>
<div class="main-div">
<%= Html.ValidationSummary("���ã����Ӳ�����û�гɹ������ܳ�������ԭ��.")%>
<% using (Html.BeginForm())
    { %>
<table width="90%" id="general-table" align="center">
  <tr>
	<td class="label" width="100">�������ƣ�</td>
	<td>
	    <%=Html.TextBox("ITEMNAME", "", new { maxlength = 50 })%>
	   
  	    <%= Html.ValidationMessage("ITEMNAME","*")%>
	</td>
  </tr>

  <tr>
  	<td class="label">���֣�</td>
  	<td>
  	<%=Html.TextBox("POINTS", "0", new { maxlength = 10 })%>
  	<%= Html.ValidationMessage("POINTS","*")%>
  	</td>
  </tr>
  <tr>
    <td class="label">��棺</td>
    <td>
    <%=Html.TextBox("ITEMNUM", "0", new {maxlength=5})%>
    <%=Html.ValidationMessage("ITEMNUM","*")%>
    </td>
  </tr>
  <tr>
  	<td class="label">�г��ο��۸�</td>
  	<td>
  	    <%=Html.TextBox("MPRICE", "0", new { maxlength = 5 })%>Ԫ
  	</td>
  </tr>
  <tr>
  	<td class="label">ͼƬ·����</td>
  	<td>
  	   <img alt="" src="/content/images/cardpush/no.jpg" id="item_img_9you" width="50" height="50" />
  	   <%=Html.Hidden("IMGPATH")%>
  	   <a href="javascript:;" style="color:#333;margin-left:15px;" onclick="selectImg('item_img_9you');return false;">ѡ��ͼƬ</a>
  	</td>
  </tr>
  <tr>
    <td class="label">��������</td>
  </tr>
  <tr>
    <td align="center" colspan="2" >
        
       <%=Html.FckEditor("ITEMDESC","",new FckConfig { Width = "600", Height = "500", Skin = FckSkin.Office2003 })%>
    </td>
  </tr>
</table>

<div class="button-div">
	<input type="submit" id="submit" value=" ȷ�� " class="button" />
	<input type="reset" value=" ���� " class="button" />
</div>
<%} %>
</div>
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