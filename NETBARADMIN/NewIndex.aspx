<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/NetBar.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TGProject.Models.News>>" %>
<%@ Import Namespace ="TGProject.Models" %>
<%@ Import Namespace="TGProject.GridView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	一卡通平台后台管理中心
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
    <span>
      - 新闻列表 
    </span>
</h1>
<div class="list-div" id="listDiv">
<%OperateButton[] buttons = { new OperateButton("编辑新闻", "EDITNEWS"), new OperateButton("禁用", "DownNews"), new OperateButton("激活", "StartNews"), new OperateButton("删除", "DeleteNews") }; %>
<%=Html.GridView<News>(Model, new string[] { "ID", "TIME", "TITLE", "TypeName" }, new GridViewOption(new string[] { "ID", "日期", "标题", "状态", "操作" }), buttons)%>
</div> 
<div>
<center>
<input type="button" value="启用" id="ManyUse" />
<input type="button" value="禁用" id="NoUse" />
<input type="button" value="删除" id="ManyDelete" />
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
            alert("请勾选一条信息");
        }
        else {

            $.ajax(
                        {
                            url: funName,
                            type: "POST",
                            data: { Ids: select },
                            success: function(r) {
                                if (r == 1) {
                                    alert("操作成功");
                                }
                                else {
                                    alert("操作失败");
                                }
                                document.location.reload();
                            }
                        }
                    );
        
        }
//       
      }



      $(function() {

          //删除
          $("#ManyDelete").click(

            function() {

                var aa = confirm("确定要删除所选项吗");
                if (aa == true) {
                    var path = '<%=Url.Action("ManyNEWDelete") %>';
                    TurnON(path);
                }
            }
          );

          //启用
          $("#ManyUse").click(
            function() {
          var path = '<%=Url.Action("ManyNEWUse") %>';
                TurnON(path);
            }
        );

          //禁用
          $("#NoUse").click(
            function() {
          var path = '<%=Url.Action("NewsManyNoUse") %>';
                TurnON(path);
            }
        );

          //全选
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
