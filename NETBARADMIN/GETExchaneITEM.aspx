<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/NetBar.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TGProject.Models.TGS_EXCHANGEREALITEM>>" %>
<%@ Import Namespace ="TGProject.Models" %>
<%@ Import Namespace="TGProject.GridView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	һ��ͨƽ̨��̨��������
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
    <%string strString=Html.Encode(ViewData["SqlString"]); %>
    <%=ViewData["SqlString"] %>&nbsp;
    <span>
      - ʵ��һ��������� </span>
</h1>
<div class="form-div">
<img src="/Content/images/barAdmin/icon_search.gif" width="26" height="22" border="0" alt="SEARCH" />
<% using(Html.BeginForm())
    {%>
   ����״̬��<select name="STATUS">
                <option value="0">δ����</option>
                <option value="1">�ѷ���</option>
             </select>
   �ʺţ�<%=Html.TextBox("YOU9ID")%>
   <input type="submit" value="����" id="btn_Search" class="button" />
   <%} %> 
</div>

<div class="list-div" id="listDiv">
<%OperateButton[] buttons = { new OperateButton("����", "SendITEM"), new OperateButton("δ����", "NoSendITEM"), new OperateButton("��������", "NOTEVIEW") }; %>
<%=Html.GridView<TGS_EXCHANGEREALITEM>(Model, new string[] { "ITEMNAME", "YOU9ID", "REALNAME", "PHONE", "ZIPCODE", "ADDRESS", "STATUSNAME" }, new GridViewOption(new string[] { "��������", "�˺�", "��ʵ����", "�绰", "�ʱ�", "��ַ", "״̬", "����" }), buttons)%>
</div>
<div>
<center>

<input type="button" value="ɾ��" id="ManyDelete" />
</center>
</div>


<script language="javascript" type="text/javascript">

    function TurnON(funName) {

       
        
        var select = new Array();
        var i = 0;

        var cc = $("input[type=checkbox]:checked").each(function(i, tag) {

            select[i] = $(tag).val();
            i++;
        });

        if (select == '') {
            alert("�빴ѡһ����Ϣ");
        }
        else {

            $.ajax(
                        {
                            url: funName,
                            type: "POST",
                            data: { Ids: select },
                            success: function(r) {
                                if (r == 1) {
                                    alert("�����ɹ�");
                                }
                                else {
                                    alert("����ʧ��");
                                }
                                document.location.reload();
                            }
                        }
                    );
        
        }
//       
      }



      $(function() {

          //ɾ��
          $("#ManyDelete").click(

            function() {

                var aa = confirm("ȷ��Ҫɾ����ѡ����");
                if (aa == true) {
                    var path = '<%=Url.Action("ManySendListDelete") %>';
                    TurnON(path);
                }
            }
          );

          //ȫѡ
          $("#AllCheckBox").click(
            function() {
                var cc = $("input[type=checkbox]").each(function(i, tag) {
                    var cl = $("#AllCheckBox").attr("checked")
               
                    $(tag).attr("checked",cl);
                }
                )
            }
          );
      }
    );
</script> 
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
