<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/NetBar.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TGProject.Models.TGS_9YOU_REALITEM>>" %>
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
      - 实物道具列表 </span>
</h1>
<div class="form-div">
<img src="/Content/images/barAdmin/icon_search.gif" width="26" height="22" border="0" alt="SEARCH" />
<% using(Html.BeginForm())
    {%>
   道具名称：
   <%=Html.TextBox("ITEMNAME","")%>
   道具状态：
   <select name="ACTIVATION">
    <option value="-1">
        全部
    </option>
    <option value="1">
        启用
    </option>
    <option value="0">
        禁用
    </option>
   </select>
   
   按照：
   <select name="FileName">
    <option value="STATISTIC">兑换次数</option>
    <option value="GENTIME">输入时间</option>
    <option value="POINTS">积分</option>
   </select>
   <select name="DESC">
    <option value="1">倒序</option>
    <option value="2">正序</option>
   </select>
   排序
   <input type="submit" value="搜索" id="btn_Search" class="button" />
   <%} %> 
</div>

<div class="list-div" id="listDiv">
<%OperateButton[] buttons = { new OperateButton("道具详情", "RealITEMEDIT"),new OperateButton("禁用","DownRealITEM"),new OperateButton("启用","StartRealITEM")}; %>
<%=Html.GridView<TGS_9YOU_REALITEM>(Model, new string[] { "ITEMNAME", "POINTS", "MPRICE", "ITEMNUM", "STATE" }, new GridViewOption(new string[] { "道具名称", "积分", "市场价格", "库存", "状态", "操作" }), buttons)%>
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
                    var path = '<%=Url.Action("ManyRealItemDelete") %>';
                    TurnON(path);
                }
            }
          );

          //启用
          $("#ManyUse").click(
            function() {
          var path = '<%=Url.Action("ManyRealItemUse") %>';
                TurnON(path);
            }
        );

          //禁用
          $("#NoUse").click(
            function() {
          var path = '<%=Url.Action("ManyRealItemNoUse") %>';
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
