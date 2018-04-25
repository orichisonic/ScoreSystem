<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>一卡通网吧平台后台管理中心 </title>
   <link href="/Content/css/general.css" type="text/css" rel="Stylesheet" />
   <link href="/Content/css/main.css" type="text/css" rel="Stylesheet" />
   <style type="text/css">
      body
      {
         color: white;
      }
   </style>

   <script language="javascript" src="/Scripts/barAdmin/utils.js" type="text/javascript"></script>

   <script type="text/javascript" language="javascript" src="/scripts/jquery-1.3.2.min.js"></script>

</head>
<body style="background: #278296">
<input type="hidden" name="act" value="login" />
<%=Html.ValidationSummary("登录失败") %>
<%using (Html.BeginForm())
  { %>
<table style="margin-top: 100px" cellspacing="0" cellpadding="0" align="center">
   <tbody>
      <tr>
         <td>
            <img height="256" alt="ballot" src="/Content/images/barAdmin/login.jpg" width="178" border="0" />
         </td>
         <td style="padding-left: 50px">
            <table>
               <tbody>
                  <tr>
                     <td>
                        用户名：
                     </td>
                     <td>
                        <%=Html.TextBox("username", "", new { maxlength = 20 })%>
                        
                     </td>
                  </tr>
                  <tr>
                     <td>
                        密码：
                     </td>
                     <td>
                        <%=Html.Password("password", "", new { maxlength = 20 })%>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2">
                        <label>
                           <input type="checkbox" value="1" name="remember" />请保存我这次的登录信息。</label>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        &nbsp;
                     </td>
                     <td>
                        <input class="button" id="sub" type="submit" value="进入管理中心" />
                     </td>
                  </tr>
                  <tr>
                     <td align="right" colspan="2">
                        ** <a style="color: white" href="http://61.152.150.158/aubar/index.php">返回首页</a>
                        ** <a style="color: white" href="#">您忘记了密码吗?</a>
                     </td>
                  </tr>
               </tbody>
            </table>
         </td>
      </tr>
   </tbody>
</table>
<%} %>
<div id="load_div" style="position: absolute; top: 10px; left: 10px; clear: right; padding-right: 10px; display: none; padding-left: 0px; padding-bottom: 0px; color: #ff9900; padding-top: 5px; text-align: right">
   <img style="vertical-align: middle" height="16" alt="正在处理您的请求..." src="/Content/images/barAdmin/top_loader.gif" width="16" />
   正在处理您的请求...
</div>
<div id="tip_msg" style="position: absolute; top: 10px; left: 10px; border: solid 1px silver; background-color: #fbebd3; display: none; padding: 3px; color: #ff9900; width: 160px;">
</div>

<script type="text/javascript" language="javascript">

</script>

</body>
</html>
