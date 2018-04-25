<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>浏览图片</title>

    <script src="/Scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
    <style type="text/css">
         #listimage_close_div
         {width:595;text-align:right;margin-bottom:8px;}
         #listimage_close_div a
         {text-decoration:none;font-size:12px;color:Gray;}
         #listimage_close_div a:hover
         {text-decoration:underline;}
         .img_item
         {display:inline;border:solid 2px #eee;width:60px;height:60px;float:left;margin:3px;}
         #img_add
         {background-color:#eee;}
    </style>
    <script type="text/javascript" language="javascript">

    $(function() {
       $(".img_item").each(function(i, tag) {
          $(tag).bind("click", function() {
             var path = $(tag).children().eq(0).text();
             var input = self.parent.document.getElementById('<%= ViewData["arg"] %>');
             $(input).attr("src", path);
             self.parent.tb_remove();
          });
       });

       $(".img_item").each(function(i, tag) {
          $(tag).hover(function() { $(this).css("border-color", "red"); $("#img_add").text($(this).children().eq(0).text()); }, function() { $(this).css("border-color", "#eee"); });
       });

    });
    </script>
</head>
<body>
    <div id="listimage_close_div"><a href="javascript:;" onclick="self.parent.tb_remove();return false;">关闭</a></div>
    <div style="color:#555;font-size:12px;padding-left:10px;padding-bottom:5px;">单击图片进行选择，或者复制这里的图片地址：<span id="img_add"></span></div>
    <div style="width:585px;padding:10px;">
    
    <% 
       if (ViewData["imgs"] != null)
       {
          var names = ((string[])ViewData["imgs"]);

          foreach (string name in names)
          {
             if (name.Trim().Length > 0)
             {
    %>
               <div class="img_item"><span style="display:none;">/upload/m818/<%=name %></span><img style="margin:5px;" title="单击图片进行选择" alt="<%=name %>" src="/upload/m818/<%=name %>" width="50" height="50" /></div>
    <%
             }
          }
       }   
    %>
    
    </div>
</body>
</html>
