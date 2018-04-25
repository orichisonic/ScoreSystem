<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/NetBar.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TGProject.Models.TGS_EXCHANGEREALITEM>>" %>
<%@ Import Namespace ="TGProject.Models" %>
<%@ Import Namespace="TGProject.GridView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	一卡通平台后台管理中心
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
    <%string strString=Html.Encode(ViewData["SqlString"]); %>
    <%=ViewData["SqlString"] %>&nbsp;
    <span>
      - 实物兑换定单管理 </span>
</h1>
<div class="form-div">
<img src="/Content/images/barAdmin/icon_search.gif" width="26" height="22" border="0" alt="SEARCH" />
<% using(Html.BeginForm())
    {%>
   道具状态：<select name="STATUS">
                <option value="0">未发放</option>
                <option value="1">已发放</option>
             </select>
   帐号：<%=Html.TextBox("YOU9ID")%>
   <input type="submit" value="搜索" id="btn_Search" class="button" />
   <%} %> 
</div>

<div class="list-div" id="listDiv">
<%OperateButton[] buttons = { new OperateButton("发放", "SendITEM"), new OperateButton("未发放", "NoSendITEM"), new OperateButton("订单详情", "NOTEVIEW") }; %>
<%=Html.GridView<TGS_EXCHANGEREALITEM>(Model, new string[] { "ITEMNAME", "YOU9ID", "REALNAME", "PHONE", "ZIPCODE", "ADDRESS", "STATUSNAME" }, new GridViewOption(new string[] { "道具名称", "账号", "真实姓名", "电话", "邮编", "地址", "状态", "操作" }), buttons)%>
</div>
<div>
<center>

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
                    var path = '<%=Url.Action("ManySendListDelete") %>';
                    TurnON(path);
                }
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
