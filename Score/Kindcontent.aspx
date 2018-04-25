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
      您的位置：<a href="<%=Url.Action("index") %>">首页</a>
      &gt;&gt; 实物详情</div>
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
            <img alt="商品图片" src="<%=item.IMGPATH %>" width="285" height="285" />
         </div>
         <dl>
            <dt>商 品 名 称：</dt>
            <dd title="<%=item.ITEMNAME%>">
               <%=TGProject.Utilities.Utility.DisplayEllipseIfStringSpanIsShort(item.ITEMNAME, 0, 12)%></dd>
            <dt>浏 览 统 计：</dt>
            <dd>
               <%=item.ITEMVIEWNUM%></dd>
            <dt>商 品 数 量：</dt>
            <dd class="item_amount">
               <%= (item.ITEMNUM == -1 ? "无限" : item.ITEMNUM.ToString())%></dd>
            <dt>市 场 价 格：</dt>
            <dd>
               <%=item.MPRICE%>元</dd>
            <dt>兑换所需积分：</dt>
            <dd class="kindItemPoint">
               <%=item.POINTS%>积分</dd>
         </dl>
         <div class="kindItemBut">
            <a href="javascript:;" onclick="confirmExchange();return false;">
            <img alt="确认兑换" src="/content/images/scoresite/index_11.jpg" width="202" height="65" /></a><br />
            <br />
            <a href="<%=Url.Action("kind") %>">
            <img alt="返回列表" src="/content/images/scoresite/back.jpg" width="202" height="41" /></a>
         </div>
         <div style="height: 0px; margin: 0; _display: inline; clear: both;">
         </div>
         <div class="contentText">
            <h5>商品详情：</h5>
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
         <span class="headBg1"><span class="title" style="font-weight:bold;">请确认您要兑换的道具信息</span><span class="close"><a title="关闭" href="javascript:;" onclick="tb_remove();return false;"><img alt="close" src="/content/images/scoresite/close.gif" width="14" height="14" align="absmiddle" /></a></span></span>
      </h6>
      <div style="height: 0px; margin: 0; _display: inline; clear: both;">
      </div>
   </div>
   <div class="kindTapContent" style="border:0;">
      <div class="kindContentLeft">
         <img alt="商品图片" src="<%=item.IMGPATH %>" width="150" height="150" class="virtualToolsPic" />
      </div>
      <dl>
         <dt>商品名称：</dt>
         <dd>
            <%=item.ITEMNAME %></dd>
         <dt>浏览统计：</dt>
         <dd>
            <%=item.ITEMVIEWNUM%></dd>
         <dt>商品数量：</dt>
         <dd class="item_amount">
            <%=(item.ITEMNUM == -1 ? "无限" : item.ITEMNUM.ToString())%></dd>
         <dt>兑换积分：</dt>
         <dd class="kindItemPoint">
            <%=item.POINTS%>积分</dd>
      </dl>
      <div style="height: 0px; margin: 0; _display: inline; clear: both;">
      </div>
   </div>
   <div class="kindTapArea" style="border:0;">
      <p class="areaTitle">
         请填写您的详细信息，以便物品第一时间送达</p>
<%
   var info = ViewData["infos"] as PersonalExchangeRealItemInfos;
   if (info != null)
   {
%>
      <p id="user_real_info">
         邮寄地址：
         <input name="textfield" type="text" id="txt_addr" size="43" value="<%=info.ADDRESS %>" /><br />
         邮政编码：
         <input name="textfield2" type="text" id="txt_zip" size="10" value="<%=info.ZIPCODE %>" /><br />
         真实姓名：
         <input name="textfield3" type="text" id="txt_name" size="10" value="<%=info.REALNAME %>" />
         联系电话：
         <input name="textfield4" type="text" id="txt_phone" size="16" value="<%=info.PHONE %>" /><br />
         您的留言：（200字以内）<br />
         <textarea cols="42" rows="5" id="memo"></textarea>
         </p>
<%
   }
   else
   {
%>
      <p id="user_real_info">
         邮寄地址：
         <input name="textfield" type="text" id="txt_addr" size="43" /><br />
         邮政编码：
         <input name="textfield2" type="text" id="txt_zip" size="10" /><br />
         真实姓名：
         <input name="textfield3" type="text" id="txt_name" size="10" />
         联系电话：
         <input name="textfield4" type="text" id="txt_phone" size="16" /><br />
         您的留言：（200字以内）<br />
         <textarea cols="42" rows="5" id="memo"></textarea>
         </p>
<%
   }
%>
      <p class="areaBut" id="areaBut_p">
         <a href="javascript:;" onclick="confirmExchangeReal('areaBut_p', 'user_real_info', <%=item.RID %>, <%=item.POINTS%>, '<%=Url.Action("ExchangeRealItem") %>');return false;">
         <img alt="确认兑换" src="/content/images/scoresite/confirm.gif" width="100" height="28" /></a></p>
   </div>
   <%      
      }
   %>
</div>
</asp:Content>
