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
            ��Ʒ����(���)
         </li>
      </ul>
   </div>--%>
   <!-- END divShopMain_Right_Title -->
   <div class="divShopMain_Right_BaseInfo">
      <div class="divShopMain_Right_BaseInfo_Tag">
         ��Ʒ������Ϣ��<span id="spanMerchandise_Name"><%=Session["ProductName"]%></span></div>
      <div class="divShopMain_Right_BaseInfo_Content">
         <ul class="ulShopMain_Right_BaseInfo_Content_Left">
            <li class="liShopMain_Right_BaseInfo_Content_Left_Image">
               <a href="javascript:;" id="hlPhoto"><img alt=""  border="0" style="border-width: 0px;" src="/content/images/cardpush/no.jpg" /></a>
            </li>
         </ul>
         <ul class="ulShopMain_Right_BaseInfo_Content_Right">
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               ��Ʒ���룺
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span id="ProductID"><%=Session["ProductID"]  %></span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               ��Ʒ���ƣ�
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span id="ProductName"><%=Session["ProductName"]%></span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               ����/��Ʒ���ͣ�
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span id="lblMerchandise_Type">
                  <img alt="" width="16" height="16" align="absMiddle" src="/content/images/cardpush/m818/Icon_Main.gif" />&nbsp;<img width="16" height="16" align="absMiddle" alt="ֱ������Ʒ" src="/content/images/cardpush/m818/Icon_MerchandiseType_Esale.gif" />&nbsp;<%=Session["ProductName"]%>
               </span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               �м�(��ֵ)��
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               ��<span id="productPrice"><%=Session["PRODUCTPRICE"]%></span>
            </li>
            
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               �û����û��֣�
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span id="userScore"><%=Session["USERSCORE"]%></span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               �һ����֣�</li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span class="spanShopMain_Right_BaseInfo_Content_Right_Text_SalePrice" id="productScore"><%=Session["PRODUCTSCORE"]%></span> / ��
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               <span>*</span>&nbsp;����������</li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <input type="text" autocomplete="off" onkeyup="unit(this.value)" onkeypress="return inputNum(event);" class="txtBuyNum" id="Quantity" value="1" name="txtBuyNum" />
               ��&nbsp;<label id="lableError6"></label>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               �����ܻ��֣�
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span class="spanShopMain_Right_BaseInfo_Content_Right_Text_SalePrice" id="totalScore"></span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               <span>*</span>&nbsp;֧����ʽ��
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <input type="radio" name="PayType" checked="checked" value="1" />ʹ��ƽ̨���ֹ���
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               <span>*</span>���ܷ����ֻ���</li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <input type="text" autocomplete="off" class="txtRemark" onkeyup="return Phone();" id="Mobile" name="txtRemark" />
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_VerifycodeTag">
               ��ע��
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_VerifycodeText">
               ͨ�����ŷ�ʽ���Ϳ��ſ��ܽ��������˻�����п�ȡ0.1Ԫ������               
            </li>
         </ul>
      </div>
      <!-- END divShopMain_Right_BaseInfo_Content -->
      <div class="divShopMain_Right_BaseInfo_Esale" id="divEsaleInfo">
         <div class="divShopMain_Right_BaseInfo_Esale_Tag">
            ��д������Ϣ
            <input type="hidden" id="hidAreaServer" name="hidAreaServer" />
            <input type="hidden" id="hidAreaServerName" name="hidAreaServerName" />
         </div>
         <ul class="ulShopMain_Right_BaseInfo_Esale_Context">
            <li class="liShopMain_Right_BaseInfo_Esale_Context_Tag">
               <span>*</span>���ܷ������䣺</li>
            <li class="liShopMain_Right_BaseInfo_Esale_Context_Text">
               <input type="text" id="Email" name="txtCharge_Account" onblur="return Account();" />
            </li>
            <li class="liShopMain_Right_BaseInfo_Esale_Context_TagEnd">
               <span>*</span>ȷ�Ϸ������䣺
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
         ��Ʒ��ϸ����</div>
      <div class="divShopMain_Right_Details_Content" id="divDescription">
         
      </div>
      <!-- END divShopMain_Right_Details -->
   </div>--%>
  
<input type="hidden" value="<%=Session["M818ACCOUNT"]%>" name="m818User" id="m818User" />
<input type="hidden" value="<%=Session["M818ID"]%>" name="m818ID" id="m818ID" /> 
<div id="hiddenModalContent" style="display:none;"><p id="in_content">�����ύ�У����Ժ�...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" /></p></div>
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
         $("#lableError6").text("�����ܳ����ܻ��֣�");
         $("#Quantity").val(1);
         $("#totalScore").text($("#productScore").text());
      }
   }
   else
      $("#lableError6").text("����������Ϊ0��");
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
   //�ж������Ƿ�Ϊ��
   if ($("#Email").val() != "") {
      //�ж������ʽ
      var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
      var r = reg.test($("#Email").val());
      if (r == true) {
         $("#error_msg").html("&nbsp;");
      }
      else {
         $("#error_msg").text("������Email��ʽ����ȷ��");
         return false;
      }
   }
   else {
      $("#error_msg").text("������Email��");
      return false;
   }

   //��֤�Ƿ�һ��
   if ($("#Email").val() == jQuery("#Email1").val()) {
      $("#error_msg").html("&nbsp;");
      return true;
   }
   else {
      $("#error_msg").text("�����������䲻һ�£�");
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
         $("#error_msg").text("��������ֻ���ʽ����ȷ��");
         return false;
      }
   }
   else {
      $("#error_msg").text("�������ֻ����룡");
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
      $("#error_msg").text("�û��Ļ��ֲ�����");
      return false;
   }
   if ($("#Quantity").val() == 0) {
      $("#error_msg").text("��Ʒ��������ȷ��");
      return false;
   }
   if (userS < totlaS) {
      $("#error_msg").text("���Ļ��ֲ��㣡");
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
         //Account9you: name, //--------------------9you�ʺ�
         //M818User: m818User, //------------------M818�ʺ�
         //M818ID: m818ID, //----------------------M818ID
         productID: productid, //----------------����ID
         productName: productname, //-------------������
         Email: email, //------------------------EMAIL
         Phone: phone, //------------------------��ϵ��ʽ
         DeliverType: PayType, //----------------��������
         ProductNum: quantity //----------------��������
         //ProductTotalScore: totalScore, //--------�һ���Ҫ���ܻ���
         //ProductSingleScore: productScore, //-----������Ʒ����
         //ProductPrice: productPrice, //-----------������ֵ
         //UserScore: userScore //-----------------�û������ڶһ��Ļ���
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
