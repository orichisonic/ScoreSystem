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
            ���߹���(���)
         </li>
      </ul>
   </div>--%>
   <!-- END divShopMain_Right_Title -->
   <div class="divShopMain_Right_BaseInfo">
      <div class="divShopMain_Right_BaseInfo_Tag">
         ���߻�����Ϣ��<span id="spanMerchandise_Name"><%=((List<TGProject.Models.MModels.M_GameItemList>)Session["SendGameItemInfo"])[0].ITEMNAME%></span>
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
               ���߱�ţ�
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span id="ProductID"  style="visibility:hidden;"><%=((List<TGProject.Models.MModels.M_GameItemList>)Session["SendGameItemInfo"])[0].ITEMID%></span>
               <span id="gid" style="visibility:hidden;"><%=((List<TGProject.Models.MModels.M_GameItemList>)Session["SendGameItemInfo"])[0].ID%></span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               �������ƣ�
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span id="ProductName"><%=((List<TGProject.Models.MModels.M_GameItemList>)Session["SendGameItemInfo"])[0].ITEMNAME%></span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               ����/�������ͣ�
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span id="lblMerchandise_Type">
                  <img alt="" width="16" height="16" align="absMiddle" src="/content/images/cardpush/m818/Icon_Main.gif" />&nbsp;<img width="16" height="16" align="absMiddle" alt="ֱ������Ʒ" src="/content/images/cardpush/m818/Icon_MerchandiseType_Esale.gif" />&nbsp;<%=((List<TGProject.Models.MModels.M_GameItemList>)Session["SendGameItemInfo"])[0].ITEMNAME%>
               </span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               ����������
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span id="productPrice"><%=((List<TGProject.Models.MModels.M_GameItemList>)Session["SendGameItemInfo"])[0].ITEMDESC%></span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               �û����û��֣�
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span id="userScore"><%=Session["USERSCORES"]%></span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               �һ����֣�</li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span class="spanShopMain_Right_BaseInfo_Content_Right_Text_SalePrice" id="productScore"><%=((List<TGProject.Models.MModels.M_GameItemList>)Session["SendGameItemInfo"])[0].POINTS%></span> / ��
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               �һ�������
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               1
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               �����ܻ��֣�
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               <span class="spanShopMain_Right_BaseInfo_Content_Right_Text_SalePrice" id="totalScore"><%=((List<TGProject.Models.MModels.M_GameItemList>)Session["SendGameItemInfo"])[0].POINTS%></span>
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               ֧����ʽ��
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Text">
               ����
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_Tag">
               ѡ����Ϸ������
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
               ��ע��
            </li>
            <li class="liShopMain_Right_BaseInfo_Content_Right_VerifycodeText">
               
            </li>
         </ul>
      </div>
      <!-- END divShopMain_Right_BaseInfo_Content -->
      <div class="divShopMain_Right_BaseInfo_Esale" id="divEsaleInfo">
         <%--<div class="divShopMain_Right_BaseInfo_Esale_Tag">
            ��д������Ϣ
            <input type="hidden" id="hidAreaServer" name="hidAreaServer" />
            <input type="hidden" id="hidAreaServerName" name="hidAreaServerName" />
         </div>
         <ul class="ulShopMain_Right_BaseInfo_Esale_Context">
            <li class="liShopMain_Right_BaseInfo_Esale_Context_Tag">
               ���ܷ������䣺</li>
            <li class="liShopMain_Right_BaseInfo_Esale_Context_Text">
            </li>
            <li class="liShopMain_Right_BaseInfo_Esale_Context_TagEnd">
               ȷ�Ϸ������䣺
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
         ��Ʒ��ϸ����</div>
      <div class="divShopMain_Right_Details_Content" id="divDescription">
         
      </div>
      <!-- END divShopMain_Right_Details -->
   </div>--%>
   <input type="hidden" value="<%=Session["M818ACCOUNT"]%>" name="m818User" id="m818User" />
   <input type="hidden" value="<%=Session["M818ID"]%>" name="m818ID" id="m818ID" />
   <div id="hiddenModalContent" style="display: none;">
      <p id="in_content">
         �����ύ�У����Ժ�...<br />
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
      $("#error_msg").text("���Ļ��ֲ��㣡");
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
         GameServer: gameServer,     //--------------------��Ҫ�һ��Ĵ���
         ProductID: productID,       //��ƷID
         ID: GID
         //TotalScore: totlaS,     //--------�һ���Ҫ���ܻ���
         //UserScore: userS        //-----------------�û������ڶһ��Ļ���
      },
      success: submitSuccessed
   });

   function submitSuccessed(result) {
      parent.tb_remove();
      if (result.isSuccess == 1) {
         alert("�һ��ɹ���");
      }
      else if (result.isSuccess == 6) {
         alert("�һ��ɹ���");
     }
     else if (result.isSuccess == 2) {
        alert("��û�м���ô��������ܶһ���");
    }
    else if (result.isSuccess == 3) {
        alert("��û�м���ô��������ܶһ���");
    }
    else if (result.isSuccess == 4) {
        alert("�û������ڣ����ܶһ���");
    }
    else if (result.isSuccess == 661) {
        alert("���ǵ�" + result.DNH_ORDER + "λ�����ʿ���������ң����ļ�����Ϊ��"+result.DNH_ACTIVECD+"�����μǣ�");
    }
    else if (result.isSuccess == 660) {
        alert("�һ�ʧ�ܣ�Ŀǰ�������Ѿ����꣬������ʹ�û��ֶһ��������ߣ�");
    }
    else {
        alert("�һ�ʧ�ܣ�");
    }
      location.href("http://" + location.host + "/CardPush.aspx/m818shopitemlist");
   }
}
    
</script>

</asp:Content>
