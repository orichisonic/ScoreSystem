<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">
<style type="text/css">

.STYLE1 {
	color: #FF0000;
	font-weight: bold;
	font-size: 12px;
}

</style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<%
   int isBinded =(int)ViewData["isBindedCard"];
%>
<span  id="isBinded"><% =isBinded%></span>
<div class="right width703">
   <!--#include file='stepmenu.htm' -->
   <!--最新公告 -->
   <div class="notice">
      <ul>
         <li class="lit2">
         </li>
         <li class="lic p38 pb40">
            <div class="lh25 f2 borderb">
               您的帐号还没有绑定久游推广一卡通</div>

            <div class="mt20 lh25 f2 pl40">
               输入卡号：<input type="text" name="cardno" id="cardno" maxlength="8" size="10"onkeyup="pressCaptcha(this)" onblur="pressCaptcha(this)"  />
               <a href="javascript:cardno()" class="f4 c2">点此获取卡号</a><br />
               <span class="STYLE1">* 提示：如果您拿到的是6位卡号或者8位卡号请直接输入；如果您拿到的是16位卡号，输入前6位即可</span><br />
               <input id="btn_cardbind" type="image" style="margin-left: 70px; margin-top: 10px;" src="/content/images/cardpush/bd.gif" width="120" height="30" border="0" onclick="bindcard()" />
                                  <br />
               <label id="wait"style="margin-left: 90px; margin-top: 10px;"  ></label>
            </div>

         </li>


      </ul>
   </div>
   <!-- 最新活动-->
</div>

<script language="javascript" type="text/javascript">
    function cardno() {
        var textarea = document.getElementById("cardno");
        textarea.value = '9898CA';
    }

    $(document).ready(function() {
        $('#isBinded').hide();
        if ($('#isBinded').html() == "1") {
            alert("已经绑定新手卡！");
            location.replace("http://"+ location.host+"/CardPush.aspx/index");
        }
    });

    function bindcard() {
    
    
        var cardno = $('#cardno').val();
        cardno = cardno.toUpperCase();
        if (cardno.length == 6) {
            cardno = cardno + "00";
        }
        else if (cardno.length == 8) {
            cardno = cardno;
        }
        else {
            alert("卡号位数不是6位或者8位的");
            location.replace("http://" + location.host + "/CardPush.aspx/index");
            return;
        }

        var myReg = /[^A-Za-z0-9]/;

        if (myReg.test(cardno)) {
            alert('请不要输入非法字符');
            return;
        }
        else {
            
        }
        $("#btn_cardbind").attr('disabled', 'false'); //不可用
        $("#wait").html("请稍候...");
        
        $.ajax({
            url: "http://" + location.host + "/CardPush.aspx/CardNoBind/",
            type: "POST",
            dataType: "json",
            data: { strCardNo: cardno },
            success: submitSuccessed
        });
    }
    function submitSuccessed(result) {
        $("#btn_cardbind").attr('disabled', false); //可用
        $("#wait").html("");
        
        if (result.isSuccessed == 1) {
            alert("恭喜您已成功开通“久游推广一卡通”！请选择游戏，领取您的新手奖励！");
            location.replace("http://"+location.host+"/CardPush.aspx/StepFour");
        }
        else if (result.isSuccessed == 0) {
        alert("卡号错误，或者您输入的卡号已经兑换完毕！");
        location.replace("http://" + location.host + "/CardPush.aspx/cardbind");
        }
        else if (result.isSuccessed == 5) {
            alert("网络繁忙，请退出稍后再试！");
            location.replace("http://" + location.host + "/CardPush.aspx/logout");
        }
        else{
            alert("开通失败，请联系9you客服！");
            location.replace("http://" + location.host + "/CardPush.aspx/index");
        }
    }

    function pressCaptcha(obj) {
        obj.value = obj.value.toUpperCase();
    }
    //$(document).ready(function() {
    //   $.ajax({
    //      type: "POST",
    //      url: 'GetPointDetails/',
    //      data: { 'account': $.trim(name) },
    //      dataType: "json",
    //      success: function(myJSON) {
    //         var ignoreColumn = [0, 2, 7];
    //         var head = "<thead><tr id='point_details_table_head'><td>用户编号</td><td>游戏名称</td><td>大区</td><td>总积分</td><td>日期</td></tr></thead>";
    //         $("#point_details_div").html("<table id='point_details_table'  cellspacing='0' cellpadding='0'>" + head + ParseJsonObjectToTableBody(myJSON, ignoreColumn, "class='point_details_table_tbody'", "class='point_details_table_tr'", "calss='point_details_table_td'") + "</table>");
    //      },
    //      error: function(XMLHttpRequest, textStatus) {
    //      }
    //   });
    //});

</script>
</asp:Content>
