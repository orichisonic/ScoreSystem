<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ScoreSystem.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server"></asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="nyMain">
   <div class="myLocation">
      ����λ�ã�<a href="<%=Url.Action("index") %>">��ҳ</a>
      &gt;&gt; ������ȡ&nbsp;Q&#38;A</div>
   <div class="eventCard">
      <div class="newsContent">
         <p>
            <strong>Q:��λ�þ����ƹ㿨��</strong><br />
            A:ֻҪ��ע���Ϊ�����û���������ֿ��󣬵�¼���λ�ƹ�ƽ̨(tg.9you.com)������ȡ��</p>
         <p>
            <strong>Q:�ƹ㿨����ȡ��Щ��Ʒ��</strong><br />
            A:����ȡ��ǰ�Լ��������λ�ƹ�ƽ̨�ϵ��κ�һ���Ʒ��</p>
         <p>
            <strong>Q:�ƹ㿨�ܷ�����ȡͬһ��Ʒ��</strong><br />
            A:���ܶ����ȡͬһ��Ʒ��</p>
         <p>
            <strong>Q:�����ƹ㿨�Ƿ���Գ�ֵ��</strong><br />
            A:�����Գ�ֵ��ֻ����ȡ���ֵ��ߡ�</p>
         <p>
            <strong>Q:�ÿ��Ƿ������Ч�ڣ�</strong><br />
            A:�ޣ�һֱ��Ч��</p>
      </div>
   </div>
</div>
</asp:Content>
