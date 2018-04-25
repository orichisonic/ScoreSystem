<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<link href="/Content/css/index.css" rel="Stylesheet" type="text/css" />
   <link href="/content/css/jquery-ui-1.7.2.custom.css" rel="stylesheet" type="text/css" />
   <link href="/scripts/themes/steel/grid.css" rel="stylesheet" type="text/css" />
   <link href="/Scripts/menu/jquery.jdMenu.css" rel="stylesheet" type="text/css" />
   <link href="/Scripts/multiSelect/jquery.multiSelect.css" rel="stylesheet" type="text/css" />
   <link href="/Scripts/jqtentry/jquery.timeentry.css" rel="stylesheet" type="text/css" />
   <link href="/Scripts/themes/jqModal.css" rel="stylesheet" type="text/css" />
   <link href="/Content/css/thickbox.css" rel="stylesheet" type="text/css" />
   <link type="text/css" href="/Content/css/m818.css" rel="Stylesheet" />
   <link type="text/css" href="/Content/css/m818_new.css" rel="Stylesheet" />
    <title>ShowDlg</title>
    <script type="text/javascript" >
        function getLetter() {
            if ($('[name="user"][checked=true]:radio').val() == "��M818�û�") {
                var name = $("#login_uaccount").text();
                $("#UserName").val(name);
                document.getElementById("Div4").style.display = "block";
            }
            else {
                alert("���ȷ��ע��M818�ʺţ�");
                window.location.href = "MIndividualRegister";
            }
        }
        //��M818�ʺ�
        function BandUser() {
            var m818user = $("#BankAccount").val();
            var name = $("#login_uaccount").text();
            if (m818user == "") {
                alert("��������Ҫ�󶨵�M818�û�");
                return false;
            }

            url = "HTTP://" + location.host + "/CardPush.aspx/BandM818User/";
            $.ajax({
                url: url,
                type: "POST",
                dataType: "text",
                data: {
                    //account: name,
                    m818user: m818user
                },
                success: submitSuccessed
            });

            function submitSuccessed(msg) {
                if (msg == 1) {
                    alert("�����ʺ��Ѿ��󶨣�������ѡ������Ҫ����Ʒ��");
                    window.location.href = "HTTP://" + location.host + "/CardPush.aspx/M818ShopItemList";
                }
                else if (msg == 2) {
                    alert("��������ʺŲ����ڣ�");
                }
                else {
                    alert("�ʺŰ�ʧ�ܣ�");
                }
            }
        }
    </script>
</head>
<body>
   <div class="right width703" id ="Div1"  >
   <div class="rtc">
      <ul>
         <li class="lit2 p38 pb40" id="Li1">
            <div id="Div2">
                <ul>
                    <li>
                    <input type="hidden" value="<%=Session["Account9you"]%>" name="account" id="account" />
                    <input id="a" type="radio" name="user" value="��M818�û�" onclick="getLetter()" />��M818�û�
                        <input id="b" type="radio" name="user" value="����M818�û�" onclick="getLetter()" />����M818�û�</li>
                </ul>
            </div>
            <div  id="Div4" class="lh25 f2 borderb pt20">
                <ul>
                    <li>���������Ѿ�ע���M818�û������ǽ�Ϊ���󶨾����ʺ�<input type="hidden" name="m818ID" id="m818ID" /></li>
                    <li>�����û���<input class="input_type" maxlength="50" size="20" name="UserName" id="UserName" extend="!digit" jquery1268976092355="17"> 
                        M818�û���<input class="input_type" maxlength="50" size="20" name="BankAccount" id="BankAccount" extend="!digit" jquery1268976092355="17">
                        <input type="image" id="BandM818" value="���ʺ�" onclick="BandUser()"   src="/Content/css/images/pay3.gif" />
                        </li>
                 </ul>
            </div>
         </li>
      </ul>
   </div>
   <!-- ���»-->
</div>

<%--<table width="100%" border="0" cellspacing="0" cellpadding="0" class="reg_main">
  <tr>
    <td width="10"><img src="/Content/css/images/jiao2_1.jpg" width="10" height="10" /></td>
    <td background="/Content/css/images/jiao2_2.jpg"></td>
    <td width="10" height="10"><img src="/Content/css/images/jiao2_3.jpg" width="10" height="10" /></td>
  </tr>
  <tr>
    <td background="/Content/css/images/jiao2_4.jpg">&nbsp;</td>
    <td bgcolor="#F5F5F5"><table width="100%" border="0" cellspacing="0" cellpadding="5">
      <tr>
        <td align="center" bgcolor="#C8D0D5"><strong class="subtitle">�û�δ��M818�ʺ�!</strong></td>
      </tr>
    </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="10">
          <tr>
            <td align="left">
                <input type="hidden" value="<%=Session["Account9you"]%>" name="account" id="account" />
                <input id="a" type="radio" name="user" value="��M818�û�" onclick="getLetter()" />��M818�û�
                <input id="b" type="radio" name="user" value="����M818�û�" onclick="getLetter()" />����M818�û�
            </td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="10">
          <tr>
            <td align="left">���������Ѿ�ע���M818�û��ʺţ����ǽ�Ϊ���󶨾����ʺţ�
            <input type="hidden" name="m818ID" id="m818ID" />
            </td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="10">

          <tr>
            <td width="71%" align="left">�����û��ʺţ�
            <input onblur="selectName()" id="UserName" class="required input_type" maxlength="12" name="UserName" extend="UserChar" jquery1268976092355="3" /> 
            M818�û��ʺţ�
            <input onblur="selectName()" id="BankAccount" class="required input_type" maxlength="12" name="BankAccount" extend="UserChar" jquery1268976092355="3" /></td>
            <td width="29%" align="left"><input type ="image" id="BandM818" onclick ="BandUser()" value="ȷ���ύ" src="/Content/css/images/pay3.gif" align="middle" /></td>
          </tr>
        </table>
        </td>
    <td background="/Content/css/images/jiao2_5.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td><img src="/Content/css/images/jiao2_6.jpg" width="10" height="10" /></td>
    <td background="/Content/css/images/jiao2_7.jpg"></td>
    <td><img src="/Content/css/images/jiao2_8.jpg" width="10" height="10" /></td>
  </tr>
</table>--%>
</body>
</html>
