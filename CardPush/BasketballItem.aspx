<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server"></asp:Content>
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
            <%= Html.ActionLink("��ҳ", "Index", "CardPush")%> 
            </li>
<%          }
%>
          </ul>
<div class="right width703">
   <?php include_once('step_menu.php');?>
   <!--���¹��� -->
   <div class="notice">
      <ul>
         <li class="lit2"></li>
         <li class="lic p38 pb40">
            <div class="lh25 pt20 borderb">
               <img class="left" style="margin-right: 6px; margin-bottom: 10px;" src="/Content/images/cardpush/logo_69[1].jpg" width="130" height="130" />
               <div class="right m2">
                  <p>
                     <strong>��ӭʹ�þ����ƹ�һ��ͨ��������ȡ�ġ������������ֽ���Ϊ��
                        <br />
                        ˫����������10����˫����������10����С����10����3000�㾭�顢����ȯ3�ţ�ÿ��100�㣬2����Ч����</strong><br />
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
            
               &nbsp; &nbsp; ��Ʒ���ƣ�&nbsp; �������� <br>
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
               &nbsp; ������֤�룺
               <label>
                  <input name="validate" id="validate" size="6"  maxlength="6" />
               </label>
               <label>
               </label>
               <img alt="�����壿���������һ����֤�롣" border="0"  align="absmiddle"  style="cursor: pointer;"  id="validimg" src="<%=Url.Action("CreateImage","ValidationCode") %>" onclick="reloadcode()" />
               <br />
               <input id="subBtn" type="image" src="/Content/images/cardpush/lq.gif" width="120" height="30" border="0" style="margin-left: 90px; margin-top: 10px;" onclick="send()"/>
               <br />
               <label id="wait"style="margin-left: 90px; margin-top: 10px;"  ></label>

               <script type="text/javascript" language="javascript">
	 				 <!--
		 			function changeSeccode(){
								var img = document.getElementById("seccode2");
								img.src = "seccode2.php?" + Math.random();
		 					}
		  			function pressCaptcha(obj){
    							obj.value = obj.value.toUpperCase();
  							}
	 				//-->
               </script>

            </div>
         </li>
         <li class="lib"></li>
      </ul>
   </div>
   <!-- ���»-->
</div>
<script language="JavaScript" type="text/javascript">
     function send() {
 
         var gameServer = $('#area').val();
         var authcode = $('#validate').val();
         $("#subBtn").attr('disabled', 'false'); //������
         $("#wait").html("���Ժ�...");
         $.ajax({
         url: "http://" + location.host + "/CardPush.aspx/SendBasketballItem/",
             type: "POST",
             dataType: "json",
             data: { UserID: '', You9ID:'',GameServer: gameServer ,AuthCode:authcode},
             success: submitSuccessed
         });
     }


     function submitSuccessed(result) {
         alert(result.msg);
         $("#subBtn").attr('disabled', false); //����
         $("#wait").html("");
         if (result.isSuccessed == 1) {
             location.href("http://" + location.host + "/CardPush.aspx/BasketballItem/");
         }
         else if (result.isSuccessed == 0) {
            reloadcode();
        }
        else if (result.isSuccessed == 6) {
            location.href('http://' + location.host + '/CardPush.aspx/CardBind/');
        }
         else if (result.isSuccessed == 5) {
             location.href("http://" + location.host + "/CardPush.aspx/BasketballItem/");
         }
     }
     function reloadcode() {


         var verify = document.getElementById('validimg');
//         verify.setAttribute('src', '<%=Url.Content("~/ValidationCode/CreateImage?")%>' + Math.random());
         verify.setAttribute('src', '<%=Url.Content("' + 'http://' + location.host + '/ValidationCode.aspx/CreateImage?")%>' + Math.random());
         //�����������������Ȼ��ַ��ͬ�ҷ����¼���
     }

 </script>
</asp:Content>
