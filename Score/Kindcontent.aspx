<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ScoreSystem.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
<link href="/Content/css/scoresite/thickbox.css" rel="stylesheet" type="text/css" />
<style type="text/css">
   #TB_title{display:none;}
</style>
<script src="/Scripts/scoresite/thickbox-compressed.js" type="text/javascript"></script>
<script src="/Scripts/scoresite/score_kindcontent.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="nyMain">
   <div class="myLocation">
      ����λ�ã�<a href="<%=Url.Action("index") %>">��ҳ</a>
      &gt;&gt; ʵ������</div>
   <div class="kindTools">
      <%
         var item = ViewData["ritem"] as MModels.NineYouRealItem;

         if (item != null)
         {
      %>
      <div class="kindItemContent">
         <h4>
            <%=item.ITEMNAME %></h4>
         <div class="itemPic">
            <img alt="��ƷͼƬ" src="<%=item.IMGPATH %>" width="285" height="285" />
         </div>
         <dl>
            <dt>�� Ʒ �� �ƣ�</dt>
            <dd title="<%=item.ITEMNAME%>">
               <%=TGProject.Utilities.Utility.DisplayEllipseIfStringSpanIsShort(item.ITEMNAME, 0, 12)%></dd>
            <dt>� �� ͳ �ƣ�</dt>
            <dd>
               <%=item.ITEMVIEWNUM%></dd>
            <dt>�� Ʒ �� ����</dt>
            <dd class="item_amount">
               <%= (item.ITEMNUM == -1 ? "����" : item.ITEMNUM.ToString())%></dd>
            <dt>�� �� �� ��</dt>
            <dd>
               <%=item.MPRICE%>Ԫ</dd>
            <dt>�һ�������֣�</dt>
            <dd class="kindItemPoint">
               <%=item.POINTS%>����</dd>
         </dl>
         <div class="kindItemBut">
            <a href="javascript:;" onclick="confirmExchange();return false;">
            <img alt="ȷ�϶һ�" src="/content/images/scoresite/index_11.jpg" width="202" height="65" /></a><br />
            <br />
            <a href="<%=Url.Action("kind") %>">
            <img alt="�����б�" src="/content/images/scoresite/back.jpg" width="202" height="41" /></a>
         </div>
         <div style="height: 0px; margin: 0; _display: inline; clear: both;">
         </div>
         <div class="contentText">
            <h5>��Ʒ���飺</h5>
            <%=item.ITEMDESC%>
         </div>
      </div>
      <%      
         }
      %>
   </div>
</div>
<div class="kandTap" id="kandTap_div" style="border:0;display:none;">
   <%
      if (item != null)
      {
   %>
   <div class="" style="border:0;">
      <h6>
         <span class="headBg1"><span class="title" style="font-weight:bold;">��ȷ����Ҫ�һ��ĵ�����Ϣ</span><span class="close"><a title="�ر�" href="javascript:;" onclick="tb_remove();return false;"><img alt="close" src="/content/images/scoresite/close.gif" width="14" height="14" align="absmiddle" /></a></span></span>
      </h6>
      <div style="height: 0px; margin: 0; _display: inline; clear: both;">
      </div>
   </div>
   <div class="kindTapContent" style="border:0;">
      <div class="kindContentLeft">
         <img alt="��ƷͼƬ" src="<%=item.IMGPATH %>" width="150" height="150" class="virtualToolsPic" />
      </div>
      <dl>
         <dt>��Ʒ���ƣ�</dt>
         <dd>
            <%=item.ITEMNAME %></dd>
         <dt>���ͳ�ƣ�</dt>
         <dd>
            <%=item.ITEMVIEWNUM%></dd>
         <dt>��Ʒ������</dt>
         <dd class="item_amount">
            <%=(item.ITEMNUM == -1 ? "����" : item.ITEMNUM.ToString())%></dd>
         <dt>�һ����֣�</dt>
         <dd class="kindItemPoint">
            <%=item.POINTS%>����</dd>
      </dl>
      <div style="height: 0px; margin: 0; _display: inline; clear: both;">
      </div>
   </div>
   <div class="kindTapArea" style="border:0;">
      <p class="areaTitle">
         ����д������ϸ��Ϣ���Ա���Ʒ��һʱ���ʹ�</p>
<%
   var info = ViewData["infos"] as PersonalExchangeRealItemInfos;
   if (info != null)
   {
%>
      <p id="user_real_info">
         �ʼĵ�ַ��
         <input name="textfield" type="text" id="txt_addr" size="43" value="<%=info.ADDRESS %>" /><br />
         �������룺
         <input name="textfield2" type="text" id="txt_zip" size="10" value="<%=info.ZIPCODE %>" /><br />
         ��ʵ������
         <input name="textfield3" type="text" id="txt_name" size="10" value="<%=info.REALNAME %>" />
         ��ϵ�绰��
         <input name="textfield4" type="text" id="txt_phone" size="16" value="<%=info.PHONE %>" /><br />
         �������ԣ���200�����ڣ�<br />
         <textarea cols="42" rows="5" id="memo"></textarea>
         </p>
<%
   }
   else
   {
%>
      <p id="user_real_info">
         �ʼĵ�ַ��
         <input name="textfield" type="text" id="txt_addr" size="43" /><br />
         �������룺
         <input name="textfield2" type="text" id="txt_zip" size="10" /><br />
         ��ʵ������
         <input name="textfield3" type="text" id="txt_name" size="10" />
         ��ϵ�绰��
         <input name="textfield4" type="text" id="txt_phone" size="16" /><br />
         �������ԣ���200�����ڣ�<br />
         <textarea cols="42" rows="5" id="memo"></textarea>
         </p>
<%
   }
%>
      <p class="areaBut" id="areaBut_p">
         <a href="javascript:;" onclick="confirmExchangeReal('areaBut_p', 'user_real_info', <%=item.RID %>, <%=item.POINTS%>, '<%=Url.Action("ExchangeRealItem") %>');return false;">
         <img alt="ȷ�϶һ�" src="/content/images/scoresite/confirm.gif" width="100" height="28" /></a></p>
   </div>
   <%      
      }
   %>
</div>
</asp:Content>
