<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server"></asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="right width703">
   <!--#include file='stepmenu.htm' -->
   <!--���¹��� -->
   <div class="notice">
      <ul>
         <li class="lit2"></li>
         <li class="lic p38 pb40">
            <div class="lh25 pt20 borderb">
               <img class="left" style="margin-right: 6px; margin-bottom: 10px;" src="/Content/images/cardpush/logo_78[1].jpg" width="130" height="130" />
               <div class="right m2">
                  <p>
                     <strong>��ӭʹ�þ����ƹ�һ��ͨ������ѡ����ȡ�ġ�GT������2������Ϊ��<br />
                        a��������װһ�ף�7�죩 �� b������һ����С����������7�죩<br />
                        ����������װ�����г����з����������ˣ��У�����ͷ�貽 ���п㡢������ ����Ь��EBACEʮ�� ���ף�<br />
                        Ů��������װ��ʢ���ɶӶ̷������� ���¡�����ţ�� �̿㡢�� ɫ���� ��Ь��ţ������ ���۾���</strong><br />
                  </p>
               </div>
               <div class="clear">
               </div>
            </div>
            <div class="mt10 lh25 ">
               <strong>һ��ͨ˵����</strong><br />
               1��ʹ�þ����ƹ�һ��ͨ��ֻ��Ҫ�״����뿨������ʺŰ󶨣���������ȡ��ƽ̨�����е���Ϸ���ߡ�<br />
               2��ÿ������ʺŶ���ͬһ����Ϸ��ֻ��ѡ��һ��������ȡһ�Σ������ظ���ȡ��
            </div>
            <div class="mt10 lh25 ">
           
               &nbsp; &nbsp; ��Ʒ���ƣ�GT������2<br>
               ѡ����Ϸ������
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
               <br />
        <div id="frm1" style="text-align: left">
               ѡ��������ͣ�
               <input type="radio"value="1" id="ps1" name="ps" checked="checked" />
               ������װһ��
               <input type="radio"value="2" id="ps2" name="ps" />���С����������
               </div>
               <br />
               &nbsp; ������֤�룺
               <label>
                  <input name="validate" id="validate" size="6"  maxlength="6" />
               </label>
               <label>
               </label>
                              <img alt="�����壿���������һ����֤�롣" border="0"  align="absmiddle"  style="cursor: pointer;"  id="validimg" src="<%=Url.Action("CreateImage","ValidationCode") %>" onclick="reloadcode()" />
               <br />
               <input id="subBtn" type="image" src="/Content/images/cardpush/lq.gif" width="120" height="30" border="0" style="margin-left: 90px; margin-top: 10px;" id="btnSubmit" onclick="send()"/>
               <label id="wait"style="margin-left: 90px; margin-top: 10px;"  ></label>
            </div>
         </li>
         <li class="lib"></li>
      </ul>
   </div>
   <!-- ���»-->
</div>
<script type="text/javascript">

    function send() {

        var gameServer = $('#area').val();
        var authcode = $('#validate').val();
        var itemtype = "";
        if ($("#frm1 input[type *= 'radio'][checked]").val() == 1) {
            itemtype = '1';
        }
        else if ($("#frm1 input[type *= 'radio'][checked]").val() == 2) {
            itemtype = '2';
        }

        $("#subBtn").attr('disabled', 'false'); //������
        $("#wait").html("���Ժ�...");
        $.ajax({
            url: "http://" + location.host + "/CardPush.aspx/SendJw2Item/",
            type: "POST",
            dataType: "json",
            data: { Jw2Itemtype: itemtype, GameServer: gameServer, AuthCode: authcode },
            success: submitSuccessed
        });
    }
        function reloadcode() {


            var verify = document.getElementById('validimg');
//            verify.setAttribute('src', '<%=Url.Content("~/ValidationCode/CreateImage?")%>' + Math.random());
            verify.setAttribute('src', '<%=Url.Content("' + 'http://' + location.host + '/ValidationCode.aspx/CreateImage?")%>' + Math.random());
            //�����������������Ȼ��ַ��ͬ�ҷ����¼���
        }
        function submitSuccessed(result) {
            alert(result.msg);

            $("#subBtn").attr('disabled', false); //����
            $("#wait").html("");
            if (result.isSuccessed == 1) {
                location.href("http://" + location.host + "/CardPush.aspx/Jw2Item/");
            }
            else if (result.isSuccessed == 6) {
                location.href('http://' + location.host + '/CardPush.aspx/CardBind/');
            }
            else if (result.isSuccessed == 0) {
                reloadcode();
            }
            else if (result.isSuccessed == 5) {
            location.href("http://" + location.host + "/CardPush.aspx/Jw2Item/");
            }
        }
     
 
</script>
</asp:Content>
