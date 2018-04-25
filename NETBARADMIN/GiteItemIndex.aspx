<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/NetBar.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TGProject.Models.TGS_9YOUITEM>>" %>
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
      - 虚拟道具列表 </span>
</h1>
<div class="form-div">
<img src="/Content/images/barAdmin/icon_search.gif" width="26" height="22" border="0" alt="SEARCH" />
<% using(Html.BeginForm())
    {%>
   道具名称：<%=Html.TextBox("ITEMNAME", "")%>
   道具ID：<%=Html.TextBox("ITEMID")%>
   所属游戏：
   <%SelectList selectlevel = ViewData["GAMESName"] as SelectList; %>
   <%=Html.DropDownList("GAMEID", selectlevel)%>
   道具类型：
   	<select name="DUMMYTYPE" id="DUMMYTYPE">
   	    <option value="">
   	        全部
   	    </option>
  	    <option value="1">
  	        坐骑
  	    </option>
  	    <option value="2">
  	        发型
  	    </option>
  	    <option value="3">
  	        上衣
  	    </option>
  	    <option value="4">
  	        下衣
  	    </option>
  	    <option value="5">
  	        鞋子
  	    </option>
  	    <option value="6">
  	        套装
  	    </option>
  	    <option value="7">
  	        脸型
  	    </option>
  	    <option value="8">
  	        伙伴
  	    </option>
  	    <option value="9">
  	        动作
  	    </option>
  	    <option value="10">
  	        手持
  	    </option>
  	    <option value="11">
  	        DJ台
  	    </option>
  	    <option value="12">
  	        翅膀
  	    </option>
  	    <option value="13">
  	        乐器
  	    </option>
  	    <option value="14">
  	        其他
  	    </option>
  	    <option value="15">
  	        功能道具
  	    </option>
  	    <option value="16">
  	        附加道具
  	    </option>
  	</select>
  	道具状态：
  	<select name="ISUSE">
  	<option value="-1">
  	    所有状态
  	</option>
  	<option value="0">
  	    禁用
  	</option>
  	<option value="1">
  	    启用
  	</option>
  	</select>
  	按照：
   <select name="FileName">
    <option value="STATISTIC">兑换次数</option>
    <option value="ID">输入时间</option>
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
<%OperateButton[] buttons = { new OperateButton("道具详情", "ITEMEDIT"),new OperateButton("禁用","DownITEM"),new OperateButton("启用","StartITEM")}; %>
<%=Html.GridView<TGS_9YOUITEM>(Model, new string[] { "ITEMNAME", "GAMENAME", "ITEMID", "ITEMGENDERNAME", "POINTS", "ITEMNUMNAME", "STATISTIC", "STATE" }, new GridViewOption(new string[] { "道具名称", "游戏名称", "道具编号", "性别", "积分", "库存", "兑换次数", "状态", "操作" }), buttons)%>
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
                    var path = '<%=Url.Action("ManyItemDelete") %>';
                    TurnON(path);
                }
            }
          );

          //启用
          $("#ManyUse").click(
            function() {
                var path = '<%=Url.Action("ManyItemUse") %>';
                TurnON(path);
            }
        );

          //禁用
          $("#NoUse").click(
            function() {
                var path = '<%=Url.Action("ALLONUSERITEM") %>';
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
