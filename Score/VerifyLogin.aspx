<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
 <div>
   <form action="https://login.passport.9you.com/checkCookie" name="check" id="check" method="post">
      <input type="hidden" name="id" value="<%=TGProject.Helpers.SSOVerify.TG_9YOU_ID %>" />
      <input type="hidden" name="continue" value="<%=ConfigurationManager.AppSettings["sso_cookie_continue"] %>" />
      <input type="hidden" name="userIp" value="<%= Request.UserHostAddress %>" />
      <input type="hidden" name="s" value="<%=TGProject.Helpers.SSOVerify.GetTuiGuangCookieSS(Request.UserHostAddress)  %>" />
   </form>
 </div>
<script language="javascript" type="text/javascript">
	document.check.submit();
</script>
</body>
</html>
