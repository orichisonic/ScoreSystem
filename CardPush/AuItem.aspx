<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server"></asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="right width703">
   <!--#include file='stepmenu.htm' -->
   <!--���¹��� -->
   <%
       string strBackUrl = (string)ViewData["BackUrl"];
   %>
   <span id="BackUrl" visible="false"><%=strBackUrl%></span>
   <div class="notice">
      <ul>
         <li class="lit2"></li>
         <li class="lic p38 pb40">
            <div class="lh25 pt20 borderb">
               <img class="left" style="margin-right: 6px; margin-bottom: 10px;" src="/Content/images/cardpush/logo_25[1].jpg" width="130" height="130" />
               <div class="right m2">
                  <p>
                     <span class="mt10 lh25 "><strong>�ƹ�һ��ͨ�������ţ�˵����</strong><br />
                        <span class="STYLE26">1��12��22����ע��ľ��������û��������̳���ȡ30����ң�һ�����������˺Ž�����ȡһ�Σ���<br />
                       </span><%--<br />    2��09��9��1��ǰע�ᣬ3������δ��½����Ϸ����ʧ�û��������̳���ȡ��ֵ1000MB�ع����ȯ+ħ������1����--%>
                        <strong>ע��δ��������������������ȡ���ʼ���������û���������ȡ��</strong></span></p>
               </div>
               <div class="clear">
                  <strong>�����ƹ�һ��ͨ˵����</strong><br />
                  1��ʹ�þ����ƹ�һ��ͨ��ֻ��Ҫ�״����뿨������ʺŰ󶨣�������ȡ��ƽ̨�ṩ��������Ϸ���ֽ�����<br />
                  2��ÿ������ʺŶ���ͬһ����Ϸ��ֻ��ѡ��һ��������ȡһ�Σ������ظ���ȡ��
               </div>
            </div>
            <div class="mt10 lh25 STYLE26">
               <a href="<%=strBackUrl%>" target="_blank"><strong><font color="#ff0000" size="+1">#--> �콱ͨ��������˴�ȥ�̳���ȡ���ߣ�����</font></strong></a>
            </div>
         </li>
         <li class="lib"></li>
      </ul>
   </div>
   <!-- ���»-->
</div>

<script type="text/javascript">
    $(document).ready(function() {
        var backurl = $('#BackUrl').html();
        $('#BackUrl').hide();
        if (backurl == 'nourl') {
            alert("�������ڱ��λ�û���������ͨ���ʼ����ȡ����������");
            history.go(-1);
        }
        else if (backurl = 'bindcard') {
            location.href('http://' + location.host + '/CardPush.aspx/CardBind/');
        }
    });
</script>
</asp:Content>
