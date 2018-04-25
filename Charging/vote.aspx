<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	游戏投票
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>&nbsp;</h2>
    <%TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];%>
            <span id="power"><%=account.POPEDOMID %></span>
               <span id="ip"><%=ViewData["ClientIp"].ToString()%></span>
                <span style=" display:none" id="account"><%=account.UACCOUNT %></span>
            <div id="divIframe" style="overflow:auto; width:100%; height:100%;">
         
     <table cellpadding="0" cellspacing="0" border="0"           
          style="vertical-align:top; width:100%; border:2px solid #000000; border-collapse: collapse; margin-top:10px">
          <tr style="background-color:#FFFFFF; font-weight:bold">
           <td style="border: 1px solid #000000; height: 21px;text-align:center; vertical-align:middle; color: #000000; font-size: 14px;  text-align: center; font-size:small; width: 212px;">
               游戏名称</td>
           <td style="border: 1px solid #000000;height: 21px;text-align:center;  vertical-align:middle;color: #000000; font-size: 14px;  text-align: center;font-size:small; width: 220px;">
               操作</td>
           <td 
            style="border: 1px inset #000000; height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;   text-align: center;font-size:small; width: 240px;">
               备注</td> 
           </tr>
   <%   
            List<TGProject.Models.TGSVOTESHOW> VOTELIST = (List<TGProject.Models.TGSVOTESHOW>)ViewData["VOTESHOW"];
            if (VOTELIST.Count > 0)
           {
           %>
        <%
            foreach (TGProject.Models.TGSVOTESHOW rows in VOTELIST)
        {
        %>
       <tr>
         <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 212px;  text-align: center;font-size:small;">
         <%=rows.GAMENAME%></td>
         <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 471px;  text-align: center;font-size:small;">
          <input type="button" id="<%=rows.VOTEID%>,<%=rows.TARGETURL%>" value="投票给<%=rows.GAMENAME%>" style="height: 21px;width:200px; text-align: center;" />
          
         </td>
         <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 400px;  text-align: center;font-size:small;">
          <%=rows.REMARK%>
         </td>
          <td visible="false" style="width:0px; height:0px; visibility:hidden; border:0px 0px 0px 0px; display:none" id="test2">
         <%=rows.VOTEID%></td>
         </tr>
         <%} %>
           </table> 
           <%} %>
  </div>
        <script type="text/javascript">
        var selectindex = 0;
        var UKEYGLOBAL;
        var begintime;
        var endtime;
        var power;
        var UACCOUNT;
        var ip;
        var dataArray2;
        $(document).ready(function() {
            ip = $("#ip").html();
            UACCOUNT = $("#account").html();
            $("#UACCOUNT").hide();
            $("#ip").hide();
            power = $("#power").html();
            $("#power").hide();
            $("#divIframe input[type *= 'button']").click(function() {
                //                var voteid = $("#divIframe input[type *= 'button']").attr("id");
                var voteid = $(this).attr("id");
                var dataArray = voteid.split(",");
                var pram = dataArray[0] + "," + 0 + "," + UACCOUNT + "," + ip + ",";
                dataArray2 = dataArray[1];

                $.ajax({
                    url: "VoteAdd/" + encodeURIComponent(pram),
                    type: "POST",
                    dataType: "json",
                    success: VoteAddSuccessed
                });
            });

            function VoteAddSuccessed(result) {
//                alert(result.isSuccess);
                if (result.isSuccess == true) {

                    window.open(dataArray2, "_blank");
                    //                  window.open("http://vote.newgame.17173.com/vote.php?GameId=6663&GameName=勇士OL", "_blank");

                }
                else {
                    alert("投票失败！");
                }
            }
        });
         </script>
</asp:Content>
