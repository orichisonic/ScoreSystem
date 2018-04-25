<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">

<link href="/Content/css/m818Common.css" rel="stylesheet" type="text/css" />
<link href="/Content/css/m818Common_buz.css" rel="stylesheet" type="text/css" />
<link href="/Content/css/m818SignIn.css" rel="stylesheet" type="text/css" />

<script src="/Scripts/cardpush/m818Common.js" type="text/javascript"></script>
<script src="/Scripts/cardpush/m818MD5.js" type="text/javascript"></script>
<script src="/Scripts/cardpush/m818AreaObj.js" type="text/javascript"></script>
<script src="/Scripts/cardpush/m818AreaBind.js" type="text/javascript"></script>
<script src="/Scripts/cardpush/m818DialogParent.js" type="text/javascript"></script>
<script src="/Scripts/cardpush/m818Common_ajax.js" type="text/javascript"></script>
<script src="/Scripts/cardpush/m818signin.js" type="text/javascript"></script>
<script src="/Scripts/cardpush/m818SignIn_ajax.js" type="text/javascript"></script>
<script src="/Scripts/cardpush/VirtualPath.koc" type="text/javascript" ></script>

<script type="text/javascript">
$(function() {
   AreaSetup();
});

function Register() {

   if (!sub_mit()) {
      tb_remove();
      return;
   }

   var user_name = $("#txtUser_Name").val();
   var password = $("#txtLogin_Password").val();
   var email = $("#txtEmail").val();

   var comp_name = $("#txtCompany").val();
   var province = $("#cboProvince").val();
   var city = $("#cboCity").val();
   var comp_address = $("#txtAddress").val();
   var comp_contc_person_name = $("#txtContactName").val();
   var comp_zipecode = $("#txtZipCode").val();
   var comp_ctcp_idcard = $("#txtIDCard").val();
   var comp_tel = $("#txtPhone").val();
   var comp_email = $("#txtAgentEmail").val();

   var purse_acc = $("#txtBank_No").val();
   var purse_pwd = $("#txtDeal_Password").val();

   var mobile_num = $("#MobilePhone").val();
   
   $.ajax({
      url: '<%= Url.Action("Register") %>',
      type: "POST",
      dataType: "json",
      data: {
         Account9you: "", //9游帐号
         Name: "", //昵称
         MobilePhone: mobile_num, //手机
         QQ: "", //QQ
         PasswordQuestion: "", //登录密码保护问题
         PasswordAnswer: "", //登录密码保护问题答案
         ContactAddress: "", //详细地址 
         PostalCode: "", //邮编号码
         Phone: "", //固定电话
         Fax: "", //传真
         NetworkType: "", //上网速率
         BankName: "", //银行全名
         BankAccount: "",//银行账户 
          DealerNameKey: user_name, //账号名称  
          Password: password, //账号密码  
          Email: email, //EMAIL
          CompanyName: comp_name, // 公司名
          ProvinceID: province, //省份
          CityID: city, //城市
          CompanyAddress:comp_address,// 公司地址
          CompanyContactPersonName:comp_contc_person_name, // 公司联系人名
          CompanyZipCode: comp_zipecode, // 邮编
          CompanyContactPersonIDCard: comp_ctcp_idcard, // 联系人身份证
          CompanyTel: comp_tel,// 公司电话
          CompanyEmail: comp_email,//公司email
          PurseAccount: purse_acc,// 钱包账号
          PayPassword: purse_pwd //钱包密码
      },
      success: submitSuccessed
   });
}

function submitSuccessed(result) {
   tb_remove();
   if (result == 2) {
      alert("此帐号已经存在！");
   }
   else if (result == 3) {
      alert("您输入电子邮箱已经注册");
   }
   else if (result == 4) {
      alert("您输入手机已经注册");
   }
   else if (result == 1) {
      alert("您已注册成功，请牢记您的帐号，点击确定返回商品列表");
      window.location.href = '<%= Url.Action("M818ShopItemList") %>';
   }
   else {
      alert("帐号注册失败！");
   }
}

</script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="right width703">
  <div class="divSignInMain_Left_Link">
      <img width="148" height="37" src="/content/Images/cardpush/m818/Left_Link-SignBt.gif" />
     <%-- <a href="UserLogin.aspx"><img width="112" height="37" src="http://Static.m818.com/Business.User/Image/SignIn/Left_Link-LoginBt.gif"></a>
      <a href="http://Main.m818.com/"><img width="112" height="37" src="http://Static.m818.com/Business.User/Image/SignIn/Left_Link-IndexBt.gif"></a>--%>
   </div>
   <div class="divSignInMain_Left_InfoForm">
      <ul class="ulSignInMain_Left_InfoForm_UserName">
         <li class="liSignInMain_Left_InfoForm_UserName_Tag">
            <input type="hidden" value="2" id="hidUserType" name="hidUserType" /><span class="spanMust">*</span>帐号名称：</li>
         <li class="liSignInMain_Left_InfoForm_UserName_Input">
            <input type="text" autocomplete="off" onblur="Validate_UserNameLogical();" class="txtSignInMain_Left_InfoForm_UserName_Input_Textbox" tabindex="1" id="txtUser_Name" maxlength="30" name="txtUser_Name" /><br />
            <input type="button" value="检查用户名是否被使用" tabindex="2" onclick="Validate_UserNameAll();" class="btnSignInMain_Left_InfoForm_Verifycode_Input_CheckUserName" id="btnCheckUserName" /></li>
         <li class="liSignInMain_Left_InfoForm_UserName_CheckIcon">
            <img width="17" height="17" src="/Content/Images/cardpush/m818/Icon_Check_No.gif" onmouseout="hidelayer('spanHelp_UserName');" onmouseover="showlayer('spanHelp_UserName');" id="imgHelp_UserName" />
            <!--<span class="spanClew_No" id="spanHelp_UserName" style="display: none;"><span>错误：字符数太短，必须在4位或4位以上！</span><br>
               用户名是您在"汇畅网"的唯一通行证。它由<strong>4-30</strong>个字符组成（可包括<strong>除 , " ' | \ 以外的任意字符</strong>），一个汉字算两个字符。一旦注册成功会员名不能修改。
            </span>-->
            <span class="spanClew_No" id="spanHelp_UserName" style="display: none;"><span>错误：请输入6-12位字符，支持字符为a-z，A-Z，0-9 不区分大小写！</span><br />
               请输入6-12位字符，支持字符为a-z，A-Z，0-9 不区分大小写！
            </span>
         </li>
         <li class="liSignInMain_Left_InfoForm_UserName_Explanation">
            <%--4-30字符，M818唯一身份标识。--%>
            6-12位数字或英文字母，不区分大小写。
         </li>
      </ul>
      <ul class="ulSignInMain_Left_InfoForm_Password">
         <li class="liSignInMain_Left_InfoForm_Password_Tag">
            <span class="spanMust">*</span>登录密码：</li>
         <li class="liSignInMain_Left_InfoForm_Password_Input">
            <input type="password" onblur="Validate_Password();" class="txtSignInMain_Left_InfoForm_Password_Input_Textbox" tabindex="3" id="txtLogin_Password" maxlength="20" name="txtLogin_Password" />
         </li>
         <li class="liSignInMain_Left_InfoForm_Password_CheckIcon">
            <img width="17" height="17" src="/content/Images/cardpush/m818/Icon_Check_No.gif" onmouseout="hidelayer('spanHelp_Password');" onmouseover="showlayer('spanHelp_Password');" id="imgHelp_Password" />
            <span class="spanClew_No" id="spanHelp_Password" style="display: none;"><span>错误：字符数太短，必须在6位或6位以上！</span><br>
               密码由<strong>6-20</strong>个字符组成，最好使用<strong>英文字母加数字或符号的组合密码</strong>，尽量避免单独使用英文字母、数字或符号作为您的密码。</span>
         </li>
         <li class="liSignInMain_Left_InfoForm_Password_Explanation">
            6-20字符，登录M818时需要使用些密码。</li>
      </ul>
      <ul class="ulSignInMain_Left_InfoForm_PasswordVerify">
         <li class="liSignInMain_Left_InfoForm_PasswordVerify_Tag">
            <span class="spanMust">*</span>确认密码：</li>
         <li class="liSignInMain_Left_InfoForm_PasswordVerify_Input">
            <input type="password" onblur="Validate_PasswordYN();" class="txtSignInMain_Left_InfoForm_PasswordVerify_Input_Textbox" tabindex="4" id="txtLogin_PasswordYN" maxlength="20" name="txtLogin_PasswordYN" />
         </li>
         <li class="liSignInMain_Left_InfoForm_PasswordVerify_CheckIcon">
            <img width="17" height="17" src="/content/Images/cardpush/m818/Icon_Check_Help.gif" onmouseout="hidelayer('spanHelp_PasswordYN');" onmouseover="showlayer('spanHelp_PasswordYN');" id="imgHelp_PasswordYN" />
            <span class="spanClew_Help" id="spanHelp_PasswordYN" style="display: none;">为了确保您的输入无误，请再输入一遍您上面输入的密码。</span>
         </li>
         <li class="liSignInMain_Left_InfoForm_PasswordVerify_Explanation">
            再次输入密码。</li>
      </ul>
      <ul class="ulSignInMain_Left_InfoForm_Email">
         <li class="liSignInMain_Left_InfoForm_Email_Tag">
            <span class="spanMust">*</span>电子邮箱：</li>
         <li class="liSignInMain_Left_InfoForm_Email_Input">
            <input type="text" onblur="Validate_Email();" class="txtSignInMain_Left_InfoForm_Email_Input_Textbox" tabindex="5" id="txtEmail" maxlength="255" name="txtEmail" />
         </li>
         <li class="liSignInMain_Left_InfoForm_Email_CheckIcon">
            <img width="17" height="17" src="/content/Images/cardpush/m818/Icon_Check_Help.gif" onmouseout="hidelayer('spanHelp_Email');" onmouseover="showlayer('spanHelp_Email');" alt="" id="imgHelp_Email" />
            <span class="spanClew_Help" id="spanHelp_Email" style="display: none;">输入您的电子邮件地址，当您需要找回密码或一些其它服务时会用到它。推荐使用免费的雅虎邮箱和网易邮箱。</span>
         </li>
         <li class="liSignInMain_Left_InfoForm_Email_Explanation">
            在找回密码时需要使用此邮箱。</li>
      </ul>
     <%-- <ul class="ulSignInMain_Left_InfoForm_Verifycode">
         <li class="liSignInMain_Left_InfoForm_Verifycode_Tag">
            <span class="spanMust">*</span>验证码：</li>
         <li class="liSignInMain_Left_InfoForm_Verifycode_Input">
            <input type="text" autocomplete="off" class="txtSignInMain_Left_InfoForm_Verifycode_Input_Textbox" tabindex="6" id="txtVerifycode" maxlength="5" name="txtVerifycode" />
         </li>
         <li class="liSignInMain_Left_InfoForm_Verifycode_Image">
            <a href="javascript:RefreshVerifycode();">
            <img width="80" height="28" alt="验证码" src="http://user.m818.com/VerifycodeService.koc" id="imgVerifycode" /></a></li>
         <li class="liSignInMain_Left_InfoForm_Verifycode_Refresh">
            <a href="javascript:RefreshVerifycode();">
            <img width="28" height="28" src="/content/Images/cardpush/m818/Icon_Refresh.gif" /></a></li>
      </ul>--%>
      <div class="divSignInMain_Left_InfoForm_Agreement">
         <input type="checkbox" tabindex="7" name="cbAgreement" id="cbAgreement" /><label for="cbAgreement">同意并遵守M818用户协议</label>&nbsp;<a class="link_2667D2_b" href="javascript:;">查看协议</a>
      </div>
   </div>
   <!-- END divSignInMain_Left_InfoForm -->
   <div class="divSignInMain_Left_UserType">
      选择注册类型：<span id="rblUserType"><input type="radio" onclick="UserTypeSelected(2);" checked="checked" value="2" name="rblUserType" id="rblUserType_0" /><label for="rblUserType_0">我要注册成商户(渠道/代理/网吧)</label></span>
      <!--<asp:ListItem Value="3" onclick="UserTypeSelected(3);">我要注册成员工</asp:ListItem>-->
   </div>
   <table cellspacing="0" cellpadding="4" class="tabForm" id="tabAgentInfo">
      <tbody>
         <tr class="trForm_Title">
            <td style="background-image: url(&quot;/content/Images/cardpush/m818/Icon_0012.gif&quot;);" colspan="4">
               填写商户信息
            </td>
         </tr>
         <tr>
            <td class="tdForm_Context_Title">
               <span class="spanForm_Context_Title_Must">*</span>公司名称：
            </td>
            <td colspan="2" class="tdForm_Context_Value">
               <input type="text" class="txtForm_Context_ValueHalf_Textbox" tabindex="21" id="txtCompany" name="txtCompany" />
            </td>
            <td class="tdForm_Context_Explain">
               填写公司名称
            </td>
         </tr>
         <tr>
            <td class="tdForm_Context_Title">
               <span class="spanForm_Context_Title_Must">*</span>所在省市：
            </td>
            <td colspan="2" class="tdForm_Context_Value">
               <select tabindex="22" class="cboForm_Context_ValueHalf_Province" onclick="AreaSelected();" id="cboProvince">
                  <option value="-1">省份</option>
                  <option value="110000">北京</option>
                  <option value="500000">重庆</option>
                  <option value="350000">福建</option>
                  <option value="620000">甘肃</option>
                  <option value="440000">广东</option>
                  <option value="450000">广西</option>
                  <option value="520000">贵州</option>
                  <option value="460000">海南</option>
                  <option value="130000">河北</option>
                  <option value="410000">河南</option>
                  <option value="230000">黑龙江</option>
                  <option value="420000">湖北</option>
                  <option value="430000">湖南</option>
                  <option value="220000">吉林</option>
                  <option value="320000">江苏</option>
                  <option value="360000">江西</option>
                  <option value="210000">辽宁</option>
                  <option value="150000">内蒙古</option>
                  <option value="640000">宁夏</option>
                  <option value="630000">青海</option>
                  <option value="370000">山东</option>
                  <option value="140000">山西</option>
                  <option value="610000">陕西</option>
                  <option value="310000">上海</option>
                  <option value="510000">四川</option>
                  <option value="120000">天津</option>
                  <option value="540000">西藏</option>
                  <option value="650000">新疆</option>
                  <option value="530000">云南</option>
                  <option value="330000">浙江</option>
                  <option value="340000">安徽</option>
               </select>
               <select tabindex="23" class="cboForm_Context_ValueHalf_City" onclick="AreaSelected();" id="cboCity">
                  <option value="-1">地级市</option>
               </select>
               <input type="hidden" value="-1" id="hidProvince" name="hidProvince" />
               <input type="hidden" value="-1" id="hidCity" name="hidCity" />
               <input type="hidden" id="hidProvinceName" name="hidProvinceName" />
               <input type="hidden" id="hidCityName" name="hidCityName" />
            </td>
            <td class="tdForm_Context_Explain">
               请选择您所在的省市
            </td>
         </tr>
         <tr>
            <td class="tdForm_Context_Title">
               <span class="spanForm_Context_Title_Must">*</span>公司地址：
            </td>
            <td colspan="2" class="tdForm_Context_Value">
               <input type="text" class="txtForm_Context_ValueHalf_Textbox" tabindex="24" id="txtAddress" name="txtAddress" />
            </td>
            <td class="tdForm_Context_Explain">
               填写详细地址
            </td>
         </tr>
         <tr>
            <td class="tdForm_Context_Title">
               <span class="spanForm_Context_Title_Must">*</span>联系人姓名：
            </td>
            <td class="tdForm_Context_Value">
               <input type="text" class="txtForm_Context_Value_Textbox" tabindex="25" id="txtContactName" name="txtContactName" />
            </td>
            <td class="tdForm_Context_Title">
               <span class="spanForm_Context_Title_Must">*</span>邮政编码：
            </td>
            <td class="tdForm_Context_ValueEnd">
               <input type="text" class="txtForm_Context_Value_Textbox" tabindex="26" id="txtZipCode" name="txtZipCode" />
            </td>
         </tr>
         <tr>
            <td class="tdForm_Context_Title">
               <span class="spanForm_Context_Title_Must">*</span>身份证号码：
            </td>
            <td class="tdForm_Context_Value">
               <input type="text" class="txtForm_Context_Value_Textbox" tabindex="27" id="txtIDCard" name="txtIDCard" />
            </td>
            <td class="tdForm_Context_Title">
               <span class="spanForm_Context_Title_Must">*</span>联系电话：
            </td>
            <td class="tdForm_Context_ValueEnd">
               <input type="text" class="txtForm_Context_Value_Textbox" tabindex="28" id="txtPhone" name="txtPhone" />
            </td>
         </tr>
         <tr>
            <td class="tdForm_Context_Title">
               <span class="spanForm_Context_Title_Must">*</span>Email：
            </td>
            <td class="tdForm_Context_Value">
               <input type="text" class="txtForm_Context_Value_Textbox" tabindex="29" id="txtAgentEmail" name="txtAgentEmail" />
            </td>
            <td class="tdForm_Context_Title">
               <span class="spanForm_Context_Title_Must">*</span>移动电话：
            </td>
            <td class="tdForm_Context_Value">
               <input type="text" class="txtForm_Context_Value_Textbox" tabindex="29" id="MobilePhone" name="MobilePhone" />
            </td>
         </tr>
      </tbody>
   </table>
   <table cellspacing="0" cellpadding="4" class="tabForm" id="tabBankInfo">
      <tbody>
         <tr class="trForm_Title">
            <td style="background-image: url(&quot;/content/Images/cardpush/m818/Icon_0012.gif&quot;);" colspan="4">
               填写商户钱包信息
            </td>
         </tr>
         <tr>
            <td class="tdForm_Context_Title">
               <span class="spanForm_Context_Title_Must">*</span>钱包帐号：
            </td>
            <td class="tdForm_Context_Value">
               <input type="text" class="txtForm_Context_Value_Textbox" tabindex="41" id="txtBank_No" name="txtBank_No" />
               <br />
               <!--<input type="button" value="检查帐号是否已被使用" tabindex="42" onclick="Validate_BankNoAll();" id="btnCheckBankNo" class="btnForm_Context_Value_CheckBankNo" />-->
            </td>
            <td colspan="2" class="tdForm_Context_Explain">
               钱包帐号必须是Email格式，请填写您常用并安全的Email<br>
               当支付密码忘记时，必须要用此Email才能找回密码
            </td>
         </tr>
         <tr>
            <td class="tdForm_Context_Title">
               <span class="spanForm_Context_Title_Must">*</span>钱包交易密码：
            </td>
            <td class="tdForm_Context_Value">
               <input type="password" class="txtForm_Context_Value_Textbox" tabindex="43" id="txtDeal_Password" name="txtDeal_Password" />
            </td>
            <td colspan="2" class="tdForm_Context_Explain">
               在使用钱包支付，转帐，提现等功能时会用到此密码
            </td>
         </tr>
         <tr>
            <td class="tdForm_Context_Title">
               <span class="spanForm_Context_Title_Must">*</span>确认密码：
            </td>
            <td class="tdForm_Context_Value">
               <input type="password" class="txtForm_Context_Value_Textbox" tabindex="44" id="txtDeal_Password_YN" name="txtDeal_Password_YN" />
            </td>
            <td class="tdForm_Context_Title">
            </td>
            <td class="tdForm_Context_ValueEnd">
            </td>
         </tr>
      </tbody>
   </table>
   <div class="divSignInMain_Left_AgentEmployee" style="display: none;" id="divEmployeeInfo">
      <strong>注册员工方法一：</strong>首先在填写以上表单内容点击确定注册按钮，然后联系您所在商户的老板/管理员以商户主账号身份登录通行证，让其在左边“员工管理”里点“绑定一个新员工”，输入上面填写的帐号名称点击查找，并赋予相应权限确定即可。<br>
      <strong>注册员工方法二：</strong>本页不要做任何操作，联系您所在商户的老板/管理员以商户主账号身份登录，让其在左边"员工管理"里点“添加一个新员工”，输入一个新的个人账号密码并赋予相应权限即可用此帐号登录使用。<a class="link_2667D2_b" href="UserLogin.aspx">[用员工帐号登录]</a>
   </div>
   <div class="divSignInMain_Left_Enter">
      <input type="image" style="border-width: 0px;" onclick="Register();" src="/content/Images/cardpush/m818/Left_Enter-Button.gif" tabindex="50" id="ibEnter" name="ibEnter" /></div>
</div>
<div id="hiddenModalContent" style="display:none;"><p id="in_content">注册中，请稍后...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" /></p></div>
   <!-------------------- 弹出提示信息 ----------------------------> 
    <input name="hidDisplay" type="hidden" id="hidDisplay" value="0" /> 
    <input name="hidDescription" type="hidden" id="hidDescription" value="0" /> 
	<script type="text/javascript">
	/*if (document.getElementById("hidDisplay").value == "1") {
	   ScreenConvert();
	   var ShowData = "<iframe marginwidth=\"0\" marginheight=\"0\" frameborder=\"0\" scrolling=\"no\" src=\"http://Utils.m818.com/Alert.aspx?VirtualPath=http%3a%2f%2fUser.m818.com%2f&Message=" + GetE("hidDescription").value + "\" width=\"350\" height=\"202\"></iframe>";
	   DialogShow(ShowData, 350, 202, 350, 202);
	}*/
	</script> 
	<!-------------------------------------------------------------> 
<script type="text/javascript">

	hidelayer('spanHelp_UserName');
	hidelayer('spanHelp_Password');
	hidelayer('spanHelp_PasswordYN');
	hidelayer('spanHelp_Email');
	UserTypeSelected(GetE("hidUserType").value);

</script>

</asp:Content>
