<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">
    <link type="text/css" href="/Content/css/m818.css" rel="Stylesheet" />
    <style type="text/css">
   .admin_right
   {
      background: #FFFFFF;
      width: 700px;
   }
   .admin_right .title
   {
      border: #CCC 1px solid;
      background: #EEE;
      padding: 3px;
      margin: 3px 0 3px 0;
      color: #CC3300;
      font-weight: bold;
   }
   .admin_right table
   {
      background: #CCC;
      width: 692px;
   }
   .admin_right table em
   {
      color: #990000;
      text-align: center;
   }
   .admin_right table th
   {
      background: #FEFBF6;
      text-align: center;
      color: #FC8800;
      font-weight: normal;
      height: 2.5em;
   }
   .admin_right table td
   {
      background: #FFFFFF;
      text-align: left;
      padding-left: 3px;
      height: 2.5em;
   }
   .admin_right tr.alt td
   {
      background: #FFF; /*这行将给所有的tr加上背景色*/
   }
   .admin_right tr.over td
   {
      background: #bcd4ec; /*这个将是鼠标高亮行的背景色*/
   }
   .content_all
   {
      border: #CCCCCC 1px solid;
      padding: 3px;
   }
   .content_all .tdtitle
   {
      line-height: 180%;
      font-size: 12px;
      height: 2.5em;
      padding-left: 3px;
      background-color: #eee;
      color: #333;
      width: 15em;
      text-align: right;
   }
   
   #tareaLength, #Span1
   {
      font-weight:bold;
      color:#990048;	
   }
   
</style>

<script type="text/javascript">
    $(document).ready(function() {
       
    });
    jQuery(
                        function() {
                            jQuery("#Form1").validate({
                                rules: {
                            },
                            messages: {
                        },
                        errorPlacement: function(error, element) {
                            element.parent().find(".lableError").empty();
                            error.appendTo(element.parent().find(".lableError"));
                        }
                    });
                }
                    );

    function SumbitOrder() {

        var totlaS = Number($("#totalScore").html());
        var userS = Number($("#userScore").html());
        if (totlaS > userS) {
            alert("您的积分不足！");
            return false;
        }
          var gameServer = $('#area').val();
          tipsWindown("正在兑换中", "id:Loading", "500", "50", "true", "", "true", "id");
        url = "http://"+location.host+"/CardPush.aspx/SendGameItemResult/";
        $.ajax({
            url: url,
            type: "POST",
            dataType: "json",
            data: {
                GameServer:gameServer ,     //--------------------需要兑换的大区
                TotalScore: totlaS,     //--------兑换需要的总积分
                UserScore: userS        //-----------------用户可用于兑换的积分
            },
            success: submitSuccessed
        });
        function submitSuccessed(result) {
            if (result.isSuccess == 1) {
                //tipsWindown("兑换成功！", "兑换成功！", "750", "150", "true", "", "true", "text");
                alert("兑换成功！");
                location.href("http://" + location.host + "/CardPush.aspx/MProductList");
            }
            else {
                //tipsWindown("兑换失败！", "兑换失败！", "750", "150", "true", "", "true", "text");
                alert("兑换失败！");
                location.href("http://" + location.host + "/CardPush.aspx/MProductList");
            }
        }

    }
</script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <ul>
<%
            if (Session["YOU_ACCOUNT_INFO"] != null)
            {
%>
            
<%          }
            else
            {
%>          <li>
            <%= Html.ActionLink("首页", "Index", "CardPush")%> 
            </li>
<%          }
%>
          </ul>
  <div class="right width703">
   <div class="admin_right">
      <div class="content_all">
         <form id="Form1">

         <table cellspacing="1" border="0" class="detailtable">
            <tbody>
               <tr>
                  <td class="tdtitle">游戏名称：</td>
                  <td> <%=((List<TGProject.Models.MModels.M_GameItemList>)Session["SendGameItemInfo"])[0].GAMENAME%></td>
               </tr>
               <tr>
                  <td class="tdtitle">道具名称：</td>
                  <td><%=((List<TGProject.Models.MModels.M_GameItemList>)Session["SendGameItemInfo"])[0].ITEMNAME%></td>
               </tr>
               <tr>
                  <td class="tdtitle">道具描述：</td>
                  <td><%=((List<TGProject.Models.MModels.M_GameItemList>)Session["SendGameItemInfo"])[0].ITEMDESC%></td>
               </tr>
               <tr>
                  <td class="tdtitle">选择游戏大区：</td>
                  <td>               
                       <select name="area" id="area">
                       <%
                            List<MModels.Jw2ServerList> areaList = (List<MModels.Jw2ServerList>)ViewData["AreaList"];
                            foreach (MModels.Jw2ServerList zone in areaList)
                                    { 
                            %>
                                <option value="<%=zone.id%>">
                                <%= zone.ServerName%></option>
                            <%      }
                        %>
                       </select>
               </td>
               </tr>
               <tr>
                    <td class="tdtitle">道具道具所需积分：</td>
                    <td><label id="totalScore"><%=((List<TGProject.Models.MModels.M_GameItemList>)Session["SendGameItemInfo"])[0].POINTS%></label> 
                        （用户可用积分<label id="userScore"><%=Session["USERSCORE"]%></label> ）
                        <label id="lableError6" style="color:Red"></label>
                    </td>
                </tr>
              <tr>
                  	<td class="tdtitle"></td>
                    <td><input class="charge"  src="/Content/css/images/pay2.gif"  type="image" value="确认兑换" id="submitBtn" onclick="SumbitOrder();"/></td>
                  </tr>
            </tbody>
         </table>
         </form>
         <!-- *** admin_right end  *** -->
      </div>
   </div>
</div>
<div class="right width703" id="Loading" style="display:none">
    <table align="center"><tr align="center"><td align="center">正在兑换中…<img width="30px" height="30px" src="../../Content/images/cardpush/Load.gif" /></td></tr></table>
</div>

</asp:Content>


