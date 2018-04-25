<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/NetBar.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TGProject.Models.News>>" %>
<%@ Import Namespace ="TGProject.Models" %>
<%@ Import Namespace="TGProject.GridView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	һ��ͨƽ̨��̨��������
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
    <span>
      - �����б� 
    </span>
</h1>
<div class="list-div" id="listDiv">
<%OperateButton[] buttons = { new OperateButton("�༭����", "EDITNEWS"), new OperateButton("����", "DownNews"), new OperateButton("����", "StartNews"), new OperateButton("ɾ��", "DeleteNews") }; %>
<%=Html.GridView<News>(Model, new string[] { "ID", "TIME", "TITLE", "TypeName" }, new GridViewOption(new string[] { "ID", "����", "����", "״̬", "����" }), buttons)%>
</div> 
<div>
<center>
<input type="button" value="����" id="ManyUse" />
<input type="button" value="����" id="NoUse" />
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
                    var path = '<%=Url.Action("ManyNEWDelete") %>';
                    TurnON(path);
                }
            }
          );

          //����
          $("#ManyUse").click(
            function() {
          var path = '<%=Url.Action("ManyNEWUse") %>';
                TurnON(path);
            }
        );

          //����
          $("#NoUse").click(
            function() {
          var path = '<%=Url.Action("NewsManyNoUse") %>';
                TurnON(path);
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
