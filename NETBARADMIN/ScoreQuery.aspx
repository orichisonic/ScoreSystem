<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/NetBar.Master" Inherits="System.Web.Mvc.ViewPage<TGProject.Models.Score>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	一卡通平台
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
积分添加
</h1>
<div class="main-div">
<table width="90%" id="general-table" align="center">
  <tr>
    
	<td class="label" width="100">账号：</td>
	<td>
	    <input type="text" id="YOUID" name="YOUID" />
	    
	    <input type="button" value="搜索" id="btn_Search" class="button" />
  	    <%= Html.ValidationMessage("ITEMNAME", "*")%>
	</td>
  </tr>
  <tr>
   <td class="label" width="100">可用积分：</td>
    <td><label id="POINT"></label></td>
  </tr>
  <tr>
	<td class="label" width="100">增加积分：</td>
	<td>
	    <input type="text" name="ScoreText" id="ScoreText" />
	</td>
  </tr>
  </table>       
<div class="button-div">
	<input type="submit" id="submit" value=" 提交 " class="button" />

</div>


<script src="/Scripts/jscal2.js" type="text/javascript"></script>
<script src="/Scripts/cn.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
    //判断是不是输入的全为数字
    function isDigit(s) {
        var patrn = /^[0-9]{1,20}$/;
        if (!patrn.exec(s)) return false
        return true
    }

    $(
        function() {

            $("#submit").click(
                function() {



                    if ($("#ScoreText").val() == '') {
                        alert('积分不能为空');
                        return false;
                    }
                    if (isDigit($("#ScoreText").val()) == false) {
                        alert("积分请填写数字");
                        return false;
                    }


                    var AddScore = $("#ScoreText").val();
                    var youID = $("#YOUID").val();



                    $.ajax(
                        {
                            url: '<%=Url.Action("ADDScore") %>',
                            type: "POST",
                            data: { YouID: youID, SCORE: AddScore },
                            success: function(r) {
                                if (r == 1) {
                                    alert("操作成功");
                                    $("#ScoreText").val("");
                                    $("#YOUID").val("");
                                    $("#POINT").text("");
                                    $("#submit").hide();

                                }
                                else {
                                    alert("操作失败");
                                    $("#ScoreText").val("");
                                    $("#YOUID").val("");
                                    $("#POINT").text("");
                                    $("#submit").hide();
                                }
                            }
                        }
                    );





                }
            );


            $("#btn_Search").click(
                function() {
                    var youID = $("#YOUID").val();
                    $.ajax(
                        {
                            url: '<%=Url.Action("QueryScore") %>',
                            type: "POST",
                            data: { YouID: youID },
                            success: function(r) {
                                if (r != -1) {
                                    $("#POINT").text(r);
                                    $("#submit").show();
                                }
                                else {
                                    $("#POINT").text("没有查到该用户");
                                    $("#submit").hide();
                                }
                            }
                        }
                    );
                }
            );

        }
    );
   
</script>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
