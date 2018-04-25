<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style type="text/css">
   #point_details_table
   {
      width: 620px;
      color: #555;
      margin-top: 5px;
      font-size: 13px;
      border:solid 1px #eee;
   }
   #point_details_table_head
   {
      text-align: center;
      height: 23px;
      background-color: #eee;
      margin: 5px;
      font-weight: bold;
   }
   .point_details_table_tr
   {
      text-align: center;
      height: 25px;
   }
</style>

<script type="text/javascript" language="javascript">

    $(document).ready(function() {
        var name = $("#login_uaccount").text();
        if ($.trim(name) == "") {
            return;
        }
        url = "HTTP://" + location.host + "/CardPush.aspx/GetOrderInfo/";

        $.ajax({
            type: "POST",
            url: url,
            dataType: "json",
            success: function(json) {
                var strHtml = "<table id='point_details_table'  cellspacing='1' cellpadding='1'>";
                strHtml += "<thead><tr class='point_details_table_tr'id='point_details_table_head'>"
                        + "<td calss='point_details_table_td'>订单编号</td>"
                        + " <td calss='point_details_table_td'>卡号</td>"
                        + " <td calss='point_details_table_td'>密码</td>"
                        + " <td calss='point_details_table_td'>复制订单信息</td>"
                        + " </tr></thead><tbody class='point_details_table_tbody'>";

                if (json.rows.length > 1) {
                    for (var cityObj = 0; cityObj < json.rows.length - 1; cityObj++) {
                        strHtml += "<tr class='point_details_table_tr'>"
                                + "<td calss='point_details_table_td'>" + json.rows[cityObj].cell[0] + "</td>"
                                + "<td calss='point_details_table_td'>" + json.rows[cityObj].cell[1] + "</td>"
                                + "<td calss='point_details_table_td'>" + json.rows[cityObj].cell[2] + "</td>"
                                + "<td calss='point_details_table_td'><input type='button' onclick=\"copyToClipboard('" + json.rows[cityObj].cell[0] + "','" + json.rows[cityObj].cell[1] + "','" + json.rows[cityObj].cell[2] + "')\" value=\"复制订单\" /></td>"
                                + "</tr>";
                    }
                    strHtml += "</tbody></table >";
                    document.getElementById("point_details_div").innerHTML = strHtml;
                    document.getElementById("point_details_div").style.display = "block";

                }
                else {
                    alert(json.rows[0].cell[3]);
                    window.location.href = "HTTP://" + location.host + "/CardPush.aspx/M818ShopItemList";
                }
            },
            error: function(XMLHttpRequest, textStatus) {
            }
        });
    });

function parseNewsJson(data) { 
   
}

function copyToClipboard(orderID, cardID, cardPwd) {
        if (window.clipboardData) {
            window.clipboardData.clearData();
            window.clipboardData.setData("Text", "订单号："+orderID+" 卡号："+cardID+" 密码："+cardPwd);
            alert("您的订单信息已经复制到剪贴板中！");
        }
        else if (navigator.userAgent.indexOf("Opera") != -1) {
            window.location = txt;
        }
        else if (window.netscape) {
            try {
                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            }
            catch (e) {
                alert("您的firefox安全限制限制您进行剪贴板操作，请在地址栏中输入“about:config”将“signed.applets.codebase_principal_support”设置为“true”之后重试");
                return false;
            }
            var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
            if (!clip)
                return;
            var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
            if (!trans)
                return;
            trans.addDataFlavor('text/unicode');
            var str = new Object();
            var len = new Object();
            var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
            var copytext = txt;
            str.data = copytext;
            trans.setTransferData("text/unicode", str, copytext.length * 2);
            var clipid = Components.interfaces.nsIClipboard;
            if (!clip)
                return false;
            clip.setData(trans, null, clipid.kGlobalClipboard);

        }
    } 
</script>

<div class="right width703">
   <div class="rt">
   </div>
   <div class="rtc">
      <ul>
         <li class="lit2 p38 pb40">
            <div class="lh25 f2 borderb pt20">
               订单信息：
            </div>
            <div id="point_details_div" style="display: none;">
            </div>
         </li>
         <li class="lib">
         </li>
      </ul>
   </div>
</div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
