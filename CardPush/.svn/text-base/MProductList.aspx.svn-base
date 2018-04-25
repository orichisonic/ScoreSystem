<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>


<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link type="text/css" href="/Content/css/m818.css" rel="Stylesheet" />
<!--<script type="text/javascript" src="../../Scripts/jquery-1.3.2-vsdoc.js"></script>-->
<script type ="text/javascript">

    //查询游戏厂商
    $(document).ready(function() {
        $.ajax({
            type: "POST",
            url: "HTTP://" + location.host + "/CardPush.aspx/GetProductCategory/",
            dataType: "json",
            success: function(json) {
                for (var cityObj = 0; cityObj < json.rows.length; cityObj++) {
                    $("#ProductList").append("<a href=\"javascript:void(0)\" onclick=\"GetProductDetail('"
                                                            + json.rows[cityObj].cell[0] + "')\" id=\""
                                                            + json.rows[cityObj].cell[0] + "\"><img src='/Content/images/cardpush/gc/"
                                                            + json.rows[cityObj].cell[2] + "' width='94' height='94' onclick=\"GetProductDetail('"
                                                            + json.rows[cityObj].cell[0] + "')\" border='1' title='"
                                                            + json.rows[cityObj].cell[1] + "'/>"
                                                            + "</a>");
                }
            },
            error: function(XMLHttpRequest, textStatus) {
            }
        });

        //查询游戏列表
        $.ajax({
            type: "POST",
            url: "HTTP://" + location.host + "/CardPush.aspx/GetGameList/",
            dataType: "json",
            success: function(json) {
                for (var cityObj = 0; cityObj < json.rows.length; cityObj++) {
                    $("#GameItemList").append("<a href=\"javascript:void(0)\" onclick=\"GetGameItemDetail('"
                                                            + json.rows[cityObj].cell[0] + "')\" id=\""
                                                            + json.rows[cityObj].cell[0] + "\"><img src='/Content/images/cardpush/"
                                                            + json.rows[cityObj].cell[2] + "' width='94' height='94' onclick=\"GetGameItemDetail('"
                                                            + json.rows[cityObj].cell[0] + "')\" border='1' title='"
                                                            + json.rows[cityObj].cell[1] + "'/>"
                                                            + "</a>");
                }
            },
            error: function(XMLHttpRequest, textStatus) {
            }
        });
    });

    function GetGameItemDetail(gameID) {

        $.ajax({
            type: "POST",
            url: "HTTP://" + location.host + "/CardPush.aspx/GetGameItemDetail/",
            dataType: "json",
            data: {
                GameID: gameID
            },
            success: function(json) {
                $("#GameItemDetail").remove();
                $("#GameItem").append("<div class=\"property p010\" id=\"GameItemDetail\" style=\"display: none;\"><ul>");
                for (var cityObj = 0; cityObj < json.rows.length; cityObj++) {
                    var strHtml = "<li><a href=\"javascript:void(0)\" id='productUrl'onclick=\"Summit('"
                                        + json.rows[cityObj].cell[0] + "','"
                                        + json.rows[cityObj].cell[1] + "','"
                                        + json.rows[cityObj].cell[4] + "')\"></a><br />"
                                        + json.rows[cityObj].cell[1] + "<br /><a href=\"javascript:void(0)\" onclick=\"SummitGameItem('"
                                        + json.rows[cityObj].cell[0] + "','"
                                        + json.rows[cityObj].cell[3] + "')\">"
                                        + "<img src=\"/Content/images/cardpush/lq.gif\" width=\"80\" height=\"25\" border=\"0\" style=\"border: none;\" />"
                                        + "</a></li>";
                    $("#GameItemDetail").append(strHtml);
                }
                $("#GameItemDetail").append("<div class=\"clear\"></div>");
                $("#GameItem").append("</ul></div>");
                document.getElementById("GameItemDetail").style.display = "block";
            },
            error: function(XMLHttpRequest, textStatus) {
            }
        });
    }
    //查询产品
    function GetProductDetail(productCategoryID) {
        $.ajax({
            type: "POST",
            url: "HTTP://" + location.host + "/CardPush.aspx/GetProductDetail/",
            dataType: "json",
            data: {
                ProductCategoryID: productCategoryID
            },
            success: function(json) {
                $("#ProductDetail").remove();
                $("#Product").append("<div class=\"property p010\" id=\"ProductDetail\" style=\"display: none;\"><ul>");
                for (var cityObj = 0; cityObj < json.rows.length; cityObj++) {
//                    var strHtml = "<li><a href=\"javascript:void(0)\" id='productUrl'onclick=\"Summit('"
//                                        + json.rows[cityObj].cell[0] + "','"
//                                        + json.rows[cityObj].cell[1] + "','"
//                                        + json.rows[cityObj].cell[4] + "')\"><img src='/Content/images/cardpush/gc/"
//                                        + json.rows[cityObj].cell[6] + "' width='94' height='94' border='1' title='"
//                                        + json.rows[cityObj].cell[2] + "'/></a><br />"
//                                        + json.rows[cityObj].cell[1] + "<br /><a href=\"javascript:void(0)\" onclick=\"Summit('"
//                                        + json.rows[cityObj].cell[0] + "','"
//                                        + json.rows[cityObj].cell[1] + "','"
//                                        + json.rows[cityObj].cell[4] + "')\">"
//                                        + "<img src=\"/Content/images/cardpush/lq.gif\" width=\"94\" height=\"30\" border=\"0\" style=\"border: none;\" />"
                    //                                        + "</a></li>";
                    var strHtml = "<li><a href=\"javascript:void(0)\" id='productUrl'onclick=\"Summit('"
                                        + json.rows[cityObj].cell[0] + "','"
                                        + json.rows[cityObj].cell[1] + "','"
                                        + json.rows[cityObj].cell[4] + "')\"></a><br />"
                                        + json.rows[cityObj].cell[1] + "<br /><a href=\"javascript:void(0)\" onclick=\"Summit('"
                                        + json.rows[cityObj].cell[0] + "','"
                                        + json.rows[cityObj].cell[1] + "','"
                                        + json.rows[cityObj].cell[4] + "')\">"
                                        + "<img src=\"/Content/images/cardpush/lq.gif\" width=\"80\" height=\"25\" border=\"0\" style=\"border: none;\" />"
                                        + "</a></li>";
                    $("#ProductDetail").append(strHtml);
                }
                $("#ProductDetail").append("<div class=\"clear\"></div>");
                $("#Product").append("</ul></div>");
                document.getElementById("ProductDetail").style.display = "block";
            },
            error: function(XMLHttpRequest, textStatus) {
            }
        });
    }
    //领取奖品
    function Summit(ProductID, ProductName, ProductScore) {
        var name = $("#login_uaccount").text();
        if ($.trim(name) == "") {
            alert("用户没有登陆9you帐号，请先登陆！");
            return false;
        }
        url = "HTTP://" + location.host + "/CardPush.aspx/CheckM818User/";
        $.ajax({
            url: url,
            type: "POST",
            dataType: "json",
            data: {
                ACCOUNT: name,
                PRODUCTID: ProductID,
                PRODUCTNAME: ProductName,
                PRODUCTSCORE: ProductScore
            },
            success: submitSuccessed
        });
    }
    
    function submitSuccessed(result) {
        if (result == 0) {
            tipsWindown("用户未绑定M818帐号！", "url:post?ShowDlg", "750", "150", "true", "", "true", "text");
        }
        else if (result == 1) {
            window.location.href = "HTTP://" + location.host + "/CardPush.aspx/GetBonusProduct";
        }
        else {
            alert("无法兑换商品！");
        }
    }
    function SummitGameItem(strID,strGameID) {
        var name = $("#login_uaccount").text();
        if ($.trim(name) == "") {
            alert("用户没有登陆9you帐号，请先登陆！");
            return false;
        }
        url = "HTTP://" + location.host + "/CardPush.aspx/SendGameItemID/";
        $.ajax({
            url: url,
            type: "POST",
            dataType: "json",
            data: {
                ACCOUNT: name,
                ID: strID,
                GameID:strGameID
            },
            success: submitGameItemSuccessed
        });
    }

    function submitGameItemSuccessed(result) {

            window.location.href = "HTTP://" + location.host + "/CardPush.aspx/SendGameItem";
    }
    
    function CheckM818User(dealerID) {
        $.getJSON('CheckUser/?account=' + dealerID,
                function(msg) {
                    if (msg == "") {
                        alert("您输入的帐号不存在");
                    }
                    else
                        $("#m818ID").val(msg);
                });
    }
        
</script>
<div class="right width703" id ="pro">
   <div class="rt">
   </div>
   <div class="rtc">
      <ul>
      
        <li class="lit2 p38 pb40" id="GameItem">
            <div class="lh25 f2 borderb pt20" id="GameItemAll">游戏物品列表：</div>
            <div class="mt20 lh25 f2 pl40 cardlist"id="GameItemList">
                &nbsp;</div>
            <div class="property p20" id="GameItemDetail" style="display: none;">
            </div>
         </li>
         <li class="lit2 p38 pb40" id="Product">
            <div class="lh25 f2 borderb pt20" id="ProductListALL">商品列表：</div>
            <div class="mt20 lh25 f2 pl40 cardlist"id="ProductList">
                &nbsp;</div>
            <div class="property p20" id="ProductDetail" style="display: none;">
            </div>
         </li>
         

      </ul>
   </div>
   <!-- 最新活动-->
</div>
</asp:Content>
