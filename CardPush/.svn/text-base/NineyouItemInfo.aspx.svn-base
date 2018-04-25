<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">
    <link href="/Content/css/m818Common_shop.css" rel="stylesheet" type="text/css" />
<link href="/Content/css/m818Common_buz_shop.css" rel="stylesheet" type="text/css" />
<link href="/Content/css/m818ProductManage_MerchandiseInfo.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="right width703" style="">
   <div class="divShopMain_Right_Work">
      <!--#include file='m818topshotcut.htm' -->
   </div>
   <%--<div class="divShopMain_Right_Title">
      <ul class="ulShopMain_Right_Title_Tag">
         <li class="liShopMain_Right_Title_Tag_Text">
            道具购买(提出)
         </li>
      </ul>
   </div>--%>
   <!-- END divShopMain_Right_Title -->
   <div class="divShopMain_Right_BaseInfo">
      <div class="divShopMain_Right_BaseInfo_Tag">
         道具基本信息：<span id="spanMerchandise_Name"><%=((List<TGProject.Models.MModels.M_GameItemList>)Session["SendGameItemInfo"])[0].ITEMNAME%></span>
      </div>
      <div class="divShopMain_Right_BaseInfo_Content">
         <ul class="ulShopMain_Right_BaseInfo_Content_Left">
            <li class="liShopMain_Right_BaseInfo_Content_Left_Image">
               <a href="javascript:;" id="hlPhoto">
               <img alt="" style="border-width: 0px;" src="<%=((List<TGProject.Models.MModels.M_GameItemList>)Session["SendGameItemInfo"])[0].IMGPATH%>" /></a>
            </li>
         </ul>
         <ul class="ulShopMain_Right_BaseInfo_Content_Right">
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               道具编号：
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span id="ProductID"  style="visibility:hidden;"><%=((List<TGProject.Models.MModels.M_GameItemList>)Session["SendGameItemInfo"])[0].ITEMID%></span>
               <span id="gid" style="visibility:hidden;"><%=((List<TGProject.Models.MModels.M_GameItemList>)Session["SendGameItemInfo"])[0].ID%></span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               道具名称：
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span id="ProductName"><%=((List<TGProject.Models.MModels.M_GameItemList>)Session["SendGameItemInfo"])[0].ITEMNAME%></span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               供货/道具类型：
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span id="lblMerchandise_Type">
                  <img alt="" width="16" height="16" align="absMiddle" src="/content/images/cardpush/m818/Icon_Main.gif" />&nbsp;<img width="16" height="16" align="absMiddle" alt="直充类商品" src="/content/images/cardpush/m818/Icon_MerchandiseType_Esale.gif" />&nbsp;<%=((List<TGProject.Models.MModels.M_GameItemList>)Session["SendGameItemInfo"])[0].ITEMNAME%>
               </span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               道具描述：
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span id="productPrice"><%=((List<TGProject.Models.MModels.M_GameItemList>)Session["SendGameItemInfo"])[0].ITEMDESC%></span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               用户可用积分：
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span id="userScore"><%=Session["USERSCORES"]%></span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               兑换积分：</li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span class="spanShopMain_Right_BaseInfo_Content_Right_Text_SalePrice" id="productScore"><%=((List<TGProject.Models.MModels.M_GameItemList>)Session["SendGameItemInfo"])[0].POINTS%></span> / 件
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               兑换数量：
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               1
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               所需总积分：
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span class="spanShopMain_Right_BaseInfo_Content_Right_Text_SalePrice" id="totalScore"><%=((List<TGProject.Models.MModels.M_GameItemList>)Session["SendGameItemInfo"])[0].POINTS%></span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               支付方式：
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               积分
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               选择游戏大区：
            </li>

            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <select name="area" id="area">
                       <%
                            List<MModels.Jw2ServerList> areaList = (List<MModels.Jw2ServerList>)ViewData["AreaList"];
                            foreach (MModels.Jw2ServerList zone in areaList)
                            { 
                            %>
                                <option value="<%=zone.id%>"><%= zone.ServerName%></option>
                            <%      
                            }
                        %>
               </select>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_VerifycodeTag">
               备注：
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_VerifycodeText">
               
            </li>
         </ul>
      </div>
      <!-- END divShopMain_Right_BaseInfo_Content -->
      <div class="divShopMain_Right_BaseInfo_Esale" id="divEsaleInfo">
         <%--<div class="divShopMain_Right_BaseInfo_Esale_Tag">
            填写邮箱信息
            <input type="hidden" id="hidAreaServer" name="hidAreaServer" />
            <input type="hidden" id="hidAreaServerName" name="hidAreaServerName" />
         </div>
         <ul class="ulShopMain_Right_BaseInfo_Esale_Context">
            <li class="liShopMain_Right_BaseInfo_Esale_Context_Tag">
               卡密发送邮箱：</li>
            <li class="liShopMain_Right_BaseInfo_Esale_Context_Text">
            </li>
            <li class="liShopMain_Right_BaseInfo_Esale_Context_TagEnd">
               确认发送邮箱：
            </li>
            <li class="liShopMain_Right_BaseInfo_Esale_Context_Text">
            </li>
         </ul>--%>
         <ul>
            <li style="padding-left: 10px;padding-top:10px;">
               <span id="error_msg" style="color: Red;">&nbsp;</span>
            </li>
         </ul>
      </div>
      <!-- END divShopMain_Right_BaseInfo_Esale -->
      <!-- END divShopMain_Right_BaseInfo_Substance -->
      <div class="divShopMain_Right_BaseInfo_Button">
         <input type="image" style="height: 33px; width: 127px; border-width: 0px;" onclick="return SumbitOrder();" src="/content/images/cardpush/m818/Right_BaseInfo_Button-Enter.gif" id="ibEnter" name="ibEnter" />
         &nbsp;&nbsp;&nbsp;&nbsp;<a href='<%=Url.Action("m818shopitemlist") %>'><img alt="" width="127" height="33" src="/content/images/cardpush/m818/Right_BaseInfo_Button-Cancel.gif" /></a>
      </div>
   </div>
   <!-- END divShopMain_Right_BaseInfo -->
   <%--<div class="divShopMain_Right_Details">
      <div class="divShopMain_Right_Details_Tag">
         商品详细介绍</div>
      <div class="divShopMain_Right_Details_Content" id="divDescription">
         
      </div>
      <!-- END divShopMain_Right_Details -->
   </div>--%>
   <input type="hidden" value="<%=Session["M818ACCOUNT"]%>" name="m818User" id="m818User" />
   <input type="hidden" value="<%=Session["M818ID"]%>" name="m818ID" id="m818ID" />
   <div id="hiddenModalContent" style="display: none;">
      <p id="in_content">
         订单提交中，请稍后...<br />
         <img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" /></p>
   </div>
</div>

<script type="text/javascript" language="javascript">
    $(document).ready(function() {
        $("#gid").hide();
    });
function SumbitOrder() {

   var totlaS = Number($("#totalScore").html());
   var userS = Number($("#userScore").html());
   if (totlaS > userS) {
      $("#error_msg").text("您的积分不足！");
      return false;
   }

   $("#error_msg").html("&nbsp;");
   
   var gameServer = $('#area').val();
   var productID = $('#ProductID').html();
   var productName = $('#ProductName').html();
   var GID = $("#gid").html();
   tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");

   url = '<%=Url.Action("SendGameItemResult") %>';
   $.ajax({
      url: url,
      type: "POST",
      dataType: "json",
      data: {
         GameServer: gameServer,     //--------------------需要兑换的大区
         ProductID: productID,       //物品ID
         ID: GID
         //TotalScore: totlaS,     //--------兑换需要的总积分
         //UserScore: userS        //-----------------用户可用于兑换的积分
      },
      success: submitSuccessed
   });

   function submitSuccessed(result) {
      parent.tb_remove();
      if (result.isSuccess == 1) {
         alert("兑换成功！");
      }
      else if (result.isSuccess == 6) {
         alert("兑换成功！");
     }
     else if (result.isSuccess == 2) {
        alert("您没有激活该大区，不能兑换！");
    }
    else if (result.isSuccess == 3) {
        alert("您没有激活该大区，不能兑换！");
    }
    else if (result.isSuccess == 4) {
        alert("用户不存在，不能兑换！");
    }
    else if (result.isSuccess == 661) {
        alert("您是第" + result.DNH_ORDER + "位获得勇士激活码的玩家，您的激活码为【"+result.DNH_ACTIVECD+"】请牢记！");
    }
    else if (result.isSuccess == 660) {
        alert("兑换失败，目前激活码已经发完，您可以使用积分兑换其他道具！");
    }
    else {
        alert("兑换失败！");
    }
      location.href("http://" + location.host + "/CardPush.aspx/m818shopitemlist");
   }
}
    
</script>

</asp:Content>
