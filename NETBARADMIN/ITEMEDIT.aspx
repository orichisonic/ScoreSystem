<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/NetBar.Master" Inherits="System.Web.Mvc.ViewPage<TGProject.Models.TGS_9YOUITEM>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	һ��ͨƽ̨
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h1>
�鿴/�༭������Ϣ
</h1>
<div class="main-div">
<%= Html.ValidationSummary("���ã����Ӳ�����û�гɹ������ܳ�������ԭ��.")%>
<form action="<%=Url.Action("ITEMEDIT") %>" enctype="multipart/form-data" method="post">
<table width="90%" id="general-table" align="center">
  <tr>
	<td class="label" width="100">�������ƣ�</td>
	<td>
	    <%=Html.TextBox("ITEMNAME",Model.ITEMNAME, new { maxlength = 50 })%>
	   
  	    <%= Html.ValidationMessage("ITEMNAME","*")%>
  	    <%=Html.Hidden("ID",Model.ID)%>
	</td>
  </tr>
  <tr>
  	<td class="label">����ID��</td>
  	<td>
  	<%=Html.TextBox("ITEMID",Model.ITEMID,new {maxlength=50})%>
  	<%= Html.ValidationMessage("ITEMID","*")%>
  	</td>
  </tr>
  <tr>
  	<td class="label">������Ϸ��</td>
  	<td>
  	 <%SelectList selectlevel = ViewData["GAMESName"] as SelectList; %>
     <%=Html.DropDownList("GAMEID", selectlevel)%>
  	</td>
  </tr>
   <tr>
  	<td class="label">�������ͣ�</td>
  	<td>
  	<select name="DUMMYTYPE" id="DUMMYTYPE">
  	 

  	    <option value="1">
  	        ����
  	    </option>
  	    <option value="2">
  	        ����
  	    </option>
  	    <option value="3">
  	        ����
  	    </option>
  	    <option value="4">
  	        ����
  	    </option>
  	    <option value="5">
  	        Ь��
  	    </option>
  	    <option value="6">
  	        ��װ
  	    </option>
  	    <option value="7">
  	        ����
  	    </option>
  	    <option value="8">
  	        ���
  	    </option>
  	    <option value="9">
  	        ����
  	    </option>
  	    <option value="10">
  	        �ֳ�
  	    </option>
  	    <option value="11">
  	        DJ̨
  	    </option>
  	    <option value="12">
  	        ���
  	    </option>
  	    <option value="13">
  	        ����
  	    </option>
  	    <option value="14">
  	        ����
  	    </option>
  	    <option value="15">
  	        ���ܵ���
  	    </option>
  	    <option value="16">
  	        ���ӵ���
  	    </option>
  	</select>
  	</td>
  </tr>
  <tr>
  	<td class="label">�����Ա�</td>
  	<td>
  	<select name="ITEMGENDER" id="ITEMGENDER">
  	    <option value="1">
  	        ��
  	    </option>
  	    <option value="0">
  	        Ů
  	    </option>
  	    <option value="3">
  	        ����
  	    </option>
  	</select>
  	</td>
  </tr>
   <tr>
  	<td class="label">��Ч������</td>
  	<td>
  	<%=Html.TextBox("VAILDDATE",Model.VAILDDATE, new { maxlength = 5 })%><input type="radio" name="one" id="vaild"   />
  	<%= Html.ValidationMessage("VAILDDATE","*")%>
  	</td>
  </tr>
  <tr>
  	<td class="label">������</td>
  	<td>
  	<%=Html.TextBox("TEMLIMIT", Model.TEMLIMIT, new { maxlength = 2 })%><input type="radio" name="one" id="time" />
  	<%= Html.ValidationMessage("TEMLIMIT", "*")%>
  	</td>
  </tr>
  <tr>
  	<td class="label">���֣�</td>
  	<td>
  	<%=Html.TextBox("POINTS",Model.POINTS, new { maxlength = 10 })%>
  	<%= Html.ValidationMessage("POINTS","*")%>
  	</td>
  </tr>
  <tr>
  	<td class="label">����������</td>
  	<td>
  	<%if (Model.ITEMNUM == -1)
     { %>
         <%=Html.RadioButton("ISBIG", true, true)%> ����
         <%=Html.RadioButton("ISBIG", false, false)%>����
           <%=Html.TextBox("ITEMNUM", 0, new { maxlength = 2 })%>��
  	<%} %>
  	<%else
        { %>
         <%=Html.RadioButton("ISBIG", true, false )%> ����
         <%=Html.RadioButton("ISBIG", false,true)%>����
           <%=Html.TextBox("ITEMNUM",Model.ITEMNUM, new { maxlength = 2 })%>��
  	<%} %>   
  	    <%= Html.ValidationMessage("ITEMNUM", "*")%>
  	</td>
  </tr>
  <tr>
  	<td class="label">ͼƬ·����</td>
  	<td>
  	    
  	   <img alt="" src= '<%=Html.Encode(Model.IMGPATH) %>' id="item_img_9you" width="50" height="50" />
  	   <%=Html.Hidden("IMGPATH")%>
  	   <a href="javascript:;" style="color:#333;margin-left:15px;" onclick="selectImg('item_img_9you');return false;">ѡ��ͼƬ</a>
  	</td>
  </tr>
  <tr>
  	<td class="label">���ţ�</td>
  	<td>
  	   <select name="HOT" id="HOT">
  	     <option value=1>
  	        ������Ʒ
  	     </option>
  	     <option value=0>
  	        ��������Ʒ
  	     </option>
  	   </select>  
  	</td>
  </tr>
  
</table>
        
<div class="button-div">
	<input type="submit" id="submit" value=" ȷ�� " class="button" />
	<input type="reset" value=" ���� " class="button" />
</div>
</form>
</div>


<script src="/Scripts/jscal2.js" type="text/javascript"></script>
<script src="/Scripts/cn.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
    function selectImg(id) {
        $("#browser_img_div").show();
        tb_show("", '<%= Url.Action("ListImages") %>?arg=' + id + '#?KeepThis=true&TB_iframe=true&height=400&width=630&modal=true', "thickbox");

    }
    $(
        function() {
        
             $("#vaild").click(
                function() {
                    $("#TEMLIMIT").val("0");
                    $("#TEMLIMIT").attr("readonly", "readonly");
                    $("#VAILDDATE").removeAttr("readonly");
                }
            );
            
            $("#time").click(
                    function() {
                        $("#VAILDDATE").val("0");
                        $("#VAILDDATE").attr("readonly", "readonly");
                        $("#TEMLIMIT").removeAttr("readonly");
                    }
                );
                
            var TEMLIMIT= $("#TEMLIMIT").val();
            var VAILDDATE= $("#VAILDDATE").val();
            
            if(TEMLIMIT=="0" && VAILDDATE !="0")
            {
                $("#vaild").attr("checked","checked");
                $("#TEMLIMIT").attr("readonly", "readonly");
            }
            else if(TEMLIMIT!="0" && VAILDDATE=="0")
            {
                $("#time").attr("checked","checked");
                $("#VAILDDATE").attr("readonly", "readonly");
            }
            else
            {
                 $("#vaild").attr("checked","checked");
                 $("#TEMLIMIT").attr("readonly", "readonly");
            }
            
            
            $("#submit").click(
            function() {
                var path = $("#item_img_9you").attr("src");
                
                $("#IMGPATH").val(path);
            }
            );
            $("#DUMMYTYPE").val(<%=Model.DUMMYTYPE %>);
            $("#ITEMGENDER").val(<%=Model.ITEMGENDER %>);
            $("#HOT").val(<%=Model.HOT %>);
        }
    );
</script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>