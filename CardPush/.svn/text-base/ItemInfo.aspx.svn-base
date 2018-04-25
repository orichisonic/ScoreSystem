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
            商品购买(提出)
         </li>
      </ul>
   </div>--%>
   <!-- END divShopMain_Right_Title -->
   <div class="divShopMain_Right_BaseInfo">
      <div class="divShopMain_Right_BaseInfo_Tag">
         商品基本信息：<span id="spanMerchandise_Name"><%=Session["ProductName"]%></span></div>
      <div class="divShopMain_Right_BaseInfo_Content">
         <ul class="ulShopMain_Right_BaseInfo_Content_Left">
            <li class="liShopMain_Right_BaseInfo_Content_Left_Image">
               <a href="javascript:;" id="hlPhoto"><img alt=""  border="0" style="border-width: 0px;" src="/content/images/cardpush/no.jpg" /></a>
            </li>
         </ul>
         <ul class="ulShopMain_Right_BaseInfo_Content_Right">
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               商品编码：
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span id="ProductID"><%=Session["ProductID"]  %></span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               商品名称：
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span id="ProductName"><%=Session["ProductName"]%></span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               供货/商品类型：
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span id="lblMerchandise_Type">
                  <img alt="" width="16" height="16" align="absMiddle" src="/content/images/cardpush/m818/Icon_Main.gif" />&nbsp;<img width="16" height="16" align="absMiddle" alt="直充类商品" src="/content/images/cardpush/m818/Icon_MerchandiseType_Esale.gif" />&nbsp;<%=Session["ProductName"]%>
               </span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               市价(面值)：
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               ￥<span id="productPrice"><%=Session["PRODUCTPRICE"]%></span>
            </li>
            
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               用户可用积分：
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span id="userScore"><%=Session["USERSCORE"]%></span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               兑换积分：</li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span class="spanShopMain_Right_BaseInfo_Content_Right_Text_SalePrice" id="productScore"><%=Session["PRODUCTSCORE"]%></span> / 件
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               <span>*</span>&nbsp;购买数量：</li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <input type="text" autocomplete="off" onkeyup="unit(this.value)" onkeypress="return inputNum(event);" class="txtBuyNum" id="Quantity" value="1" name="txtBuyNum" />
               件&nbsp;<label id="lableError6"></label>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               所需总积分：
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span class="spanShopMain_Right_BaseInfo_Content_Right_Text_SalePrice" id="totalScore"></span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               <span>*</span>&nbsp;支付方式：
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <input type="radio" name="PayType" checked="checked" value="1" />使用平台积分购买
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               <span>*</span>卡密发送手机：</li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <input type="text" autocomplete="off" class="txtRemark" onkeyup="return Phone();" id="Mobile" name="txtRemark" />
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_VerifycodeTag">
               备注：
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_VerifycodeText">
               通过短信方式发送卡号卡密将从您的账户余额中扣取0.1元手续费               
            </li>
         </ul>
      </div>
      <!-- END divShopMain_Right_BaseInfo_Content -->
      <div class="divShopMain_Right_BaseInfo_Esale" id="divEsaleInfo">
         <div class="divShopMain_Right_BaseInfo_Esale_Tag">
            填写邮箱信息
            <input type="hidden" id="hidAreaServer" name="hidAreaServer" />
            <input type="hidden" id="hidAreaServerName" name="hidAreaServerName" />
         </div>
         <ul class="ulShopMain_Right_BaseInfo_Esale_Context">
            <li class="liShopMain_Right_BaseInfo_Esale_Context_Tag">
               <span>*</span>卡密发送邮箱：</li>
            <li class="liShopMain_Right_BaseInfo_Esale_Context_Text">
               <input type="text" id="Email" name="txtCharge_Account" onblur="return Account();" />
            </li>
            <li class="liShopMain_Right_BaseInfo_Esale_Context_TagEnd">
               <span>*</span>确认发送邮箱：
            </li>
            <li class="liShopMain_Right_BaseInfo_Esale_Context_Text">
               <input type="text" id="Email1" name="txtCharge_AccountYN" onblur="return Account();" />
            </li>
         </ul>
         <ul>
            <li style="padding-left:10px;"><span id="error_msg" style="color:Red;">&nbsp;</span></li>
         </ul>
      </div>
      <!-- END divShopMain_Right_BaseInfo_Esale -->
      <!-- END divShopMain_Right_BaseInfo_Substance -->
      <div class="divShopMain_Right_BaseInfo_Button">
         <input type="image" style="height: 33px; width: 127px; border-width: 0px;" onclick="return SumbitOrder();" src="/content/images/cardpush/m818/Right_BaseInfo_Button-Enter.gif" id="ibEnter" name="ibEnter" />
         &nbsp;&nbsp;&nbsp;&nbsp;<a href='<%=Url.Action("m818shopitemlist") %>'><img border="0" width="127" height="33" src="/content/images/cardpush/m818/Right_BaseInfo_Button-Cancel.gif" /></a>
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
<div id="hiddenModalContent" style="display:none;"><p id="in_content">订单提交中，请稍后...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" /></p></div>
</div>
<script type="text/javascript" language="javascript">

unit(1);

function unit(num) {
   if (num > 0) {
      $("#lableError6").text("");
      var totalScore = num * $("#productScore").text();
      var userScore = $("#userScore").text();
      $("#totalScore").text(totalScore);
      if (totalScore > userScore) {
         $("#lableError6").text("（不能超过总积分）");
         $("#Quantity").val(1);
         $("#totalScore").text($("#productScore").text());
      }
   }
   else
      $("#lableError6").text("（数量不能为0）");
}

function inputNum(e) {
   if (event.keyCode < 48 || event.keyCode > 57) {
      if (event && event.stopPropagation)
         event.stopPropagation();
      else
         event.cancelBubble = true;
      return false;
   }
}

function Account() {
   //判断邮箱是否为空
   if ($("#Email").val() != "") {
      //判断邮箱格式
      var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
      var r = reg.test($("#Email").val());
      if (r == true) {
         $("#error_msg").html("&nbsp;");
      }
      else {
         $("#error_msg").text("您输入Email格式不正确！");
         return false;
      }
   }
   else {
      $("#error_msg").text("请输入Email！");
      return false;
   }

   //验证是否一致
   if ($("#Email").val() == jQuery("#Email1").val()) {
      $("#error_msg").html("&nbsp;");
      return true;
   }
   else {
      $("#error_msg").text("两次输入邮箱不一致！");
      return false;
   }
}

function Phone() {
   var MobilePhone = $("#Mobile").val()
   if (MobilePhone != "") {
      var reg = /^1[0-9]{10}|01[0-9]{10}$/;
      var r = reg.test(MobilePhone);
      if (r == true) {
         $("#error_msg").html("&nbsp;");
         return true;
      }
      else {
         $("#error_msg").text("您输入的手机格式不正确！");
         return false;
      }
   }
   else {
      $("#error_msg").text("请输入手机号码！");
      return false;
   }
}

function SumbitOrder() {
   if (!Phone() || !Account()) {
      return false;
   }
   var totlaS = Number($("#totalScore").val());
   var userS = Number($("#userScore").val());
   if (totlaS > userS) {
      $("#error_msg").text("用户的积分不够！");
      return false;
   }
   if ($("#Quantity").val() == 0) {
      $("#error_msg").text("商品数量不正确！");
      return false;
   }
   if (userS < totlaS) {
      $("#error_msg").text("您的积分不足！");
      return false;
   }

   $("#error_msg").html("&nbsp;");

   var name = $("#login_uaccount").text();
   var m818User = $("#m818User").val();
   var m818ID = $("#m818ID").val();
   var productPrice = $("#productPrice").text();
   var productid = $("#ProductID").text();
   var productname = $("#ProductName").text();
   var quantity = $("#Quantity").val();
   var userScore = $("#userScore").text();
   var totalScore = $("#totalScore").text();
   var productScore = $("#productScore").text();
   var email = $("#Email").val();
   var phone = $("#Mobile").val();
   var PayType = $('[name="PayType"][checked=true]:radio').val();

   tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");

   url = '<%=Url.Action("Order") %>';
   $.ajax({
      url: url,
      type: "POST",
      dataType: "json",
      data: {
         //Account9you: name, //--------------------9you帐号
         //M818User: m818User, //------------------M818帐号
         //M818ID: m818ID, //----------------------M818ID
         productID: productid, //----------------道具ID
         productName: productname, //-------------道具名
         Email: email, //------------------------EMAIL
         Phone: phone, //------------------------联系方式
         DeliverType: PayType, //----------------配送类型
         ProductNum: quantity //----------------道具数量
         //ProductTotalScore: totalScore, //--------兑换需要的总积分
         //ProductSingleScore: productScore, //-----单个商品积分
         //ProductPrice: productPrice, //-----------道具面值
         //UserScore: userScore //-----------------用户可用于兑换的积分
      },
      error: function(XMLHttpRequest, textStatus) {
                  tb_remove();
             },
      success: submitSuccessed
   });
   
   function submitSuccessed(result) {
      window.location.href = '<%=Url.Action("OrderResult") %>';
   }

}

</script>
</asp:Content>
