<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    入职申请</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="divIframe" title="提交申请" style="text-align: center; height: 90px; width: 370px">
        <span id="displayInfo">
            <img src="/Content/images/ajax-loader.gif" /><br />
        </span><span id="msg"></span>
        <p id="closeDailog" style="text-align: center">
            <button class="fg-button ui-state-default ui-corner-left" type="button" onclick="javascript: $('#divIframe').dialog('close')">
                关闭</button>
        </p>
    </div>
    <p style="text-align: center; color: Orange; font-size: 14px; font-weight: bold;">
        申请日期:<%=DateTime.Now.ToLongDateString() %></p>
    <fieldset>
    
        <legend>编制信息</legend>
        <div style="text-align: center">
            <ul class="horizontal">
                <li>职位
                    <select name="place" id="place">
                        <%List<TGProject.Models.TGSPLACESHOW> placeList = (List<TGProject.Models.TGSPLACESHOW>)ViewData["Place"];
                          foreach (TGProject.Models.TGSPLACESHOW place in placeList)
                          {%>
                        <option value="<%= place.PLACEID + "," + place.WTYPE %>">
                            <%= place.PLACENAME%></option>
                        <%}%>
                    </select>
                </li>
                <li id="areali">所属办事处
                    <select name="area" id="area">
                        <% TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
                           if (account.POPEDOMID <= 2)
                           {
                               List<TGProject.Models.TGSAREASHOW> areaList = (List<TGProject.Models.TGSAREASHOW>)ViewData["area"];
                               foreach (TGProject.Models.TGSAREASHOW area in areaList)
                               {%>
                        <option value="<%=area.AREAID%>">
                            <%= area.AREANAME%></option>
                        <%}
                           }
                           else
                           {%>
                        <option value="<%=account.AREAID%>"><%=account.AREANAME%></option>
                        <%}%>
                    </select>
                </li>
                <li id="wages">基本工资
                    <%=Html.DropDownList("wage", new SelectList(new List<SelectListItem>() { new SelectListItem() { Text = "请选择", Value = "0" } }, "Value", "Text"))%>
                    <input type="text" name="wagetbx" id="wagetbx" style="width: 40px" value="0" />
                </li>
                <li id="postwage">岗位工资
                    <input type="text" name="postwagetbx" id="postwagetbx" style="width: 40px" value="0" />
                </li>
                <li>编制
                    <select name="bz" id="bz">
                        <%List<TGProject.Models.TGSBZTYPESHOW> bzList = (List<TGProject.Models.TGSBZTYPESHOW>)ViewData["BZ"];
                              foreach (TGProject.Models.TGSBZTYPESHOW bz in bzList){%>
                        <option value="<%= bz.BZID%>"><%= bz.BZNAME%></option>
                        <%}%>
                    </select>
                </li>
            </ul>
        </div>
    </fieldset>
    <br />
    <form id="form1">
    <fieldset>
        <legend>个人信息(必填项)</legend>
        <div>
            <br />
            <ul class="verticality">
                <li>员工姓名<br />
                    <input type="text" name="username" id="username" /></li>
                <li>性别
                    <input type="radio" name="sex" checked="checked" value="0" />男
                    <input type="radio" name="sex" value="1" />女</li>
                <li>学历<br />
                    <select name="edu" id="edu">
                        <%List<TGProject.Models.TGSEDUTYPESHOW> eduList = (List<TGProject.Models.TGSEDUTYPESHOW>)ViewData["Edu"];

                          foreach (TGProject.Models.TGSEDUTYPESHOW edu in eduList)
                          {%>
                        <option value="<%= edu.EDUID%>">
                            <%= edu.EDUNAME%></option>
                        <%}%>
                    </select>
                </li>
                <li>身份证号<br />
                    <input type="text" name="idcard" id="idcard" /></li>
                <li>联系电话<br />
                    <input type="text" name="mobile" id="mobile" /></li>
                <li>联系地址<br />
                    <input type="text" name="address" id="address" /></li>
                <li>银行账号<br />
                    <input type="text" name="bankaccount" id="bankaccount" /></li>
                <li>银行类型
                    <input type="radio" name="banktype" checked="checked" value="0" />招商银行
                    <input type="radio" name="banktype" value="1" id="banktype" />工商银行</li>
                <li>开户银行<br />
                    <input type="text" name="bankdeposit" id="bankdeposit" /></li>
                <li>申请备注<br />
                    <input type="text" name="applydesc" id="applydesc" value="N/A" /></li>
            </ul>
        </div>
        

    </fieldset>

    </form>
    <br />
    <fieldset>
        <legend>文件上传</legend>
        <div>
            <ul class="verticality">
                <%--<li>
                    <button id="rarUpload" class="fg-button ui-state-default ui-corner-left">
                        上传RAR</button><span id="rarMsg" style="margin: 10px; color: Black;">文件类型 : [*.rar | 大小1 - 1024k]</span> </li>--%>
                <li>
                    <button id="docUpload" class="fg-button ui-state-default ui-corner-left">
                        上传入职申请登记表</button><span id="docMsg" style="margin: 10px; color: Black;">文件类型 : [*.doc | 大小1 - 500k]</span> </li>
                <li>
                    <button id="imgUpload" class="fg-button ui-state-default ui-corner-left">
                        上传照片</button><span id="imgMsg" style="margin: 10px; color: Black;">文件类型 : [*.jpg、*.png | 大小1 - 50k]</span> </li>
            </ul>
        </div>
    </fieldset>
    <p style="text-align: center">
        <button id="submitBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="submitInfo()">
            提交</button></p>

    <script language="javascript" type="text/javascript">

        var docFileName = "";
        //var rarFileName = "";
        var imgFileName;
        var docObj;
        var imgObj;
        var isSelectedDoc = false;
        var isSelectedImg = false;
        var max = 0;
        var min = 0;
        var postmax = 0;
        var postmin = 0;
        var areaID = 0;
        var areaPos = 0;
        var intExp = /^[1-9]\d*$/;
        $(document).ready(function() {
            $("#place").change(function() { loadWage() });
            $("#area").change(function() { loadArea($("#area").val()) });
           // $("#wage").hide();
            $("#postwage").hide();
            loadWage()
            areaID = $("#area").val();
            loadArea(areaID);

            // 字符过滤
            jQuery.validator.addMethod("filterChar", function(value, element) {
                var flag = true;
                var charArray = new Array('<', '>', '%', '&', '|', '(', ')');
                for (var i = 0; i < charArray.length; i++) {
                    if (value.indexOf(charArray[i]) != -1) { flag = false; break;}
                }
                return this.optional(element) || flag;
            }, "&nbsp;&nbsp;[含有非法字符]");

            jQuery.validator.addMethod("isIdCardNo", function(value, element) {
                return this.optional(element) || /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/.test(value);
            }, "&nbsp;&nbsp;[请正确输入您的身份证号码!]");

            jQuery.validator.addMethod("userName", function(value, element) {
                return this.optional(element) || /^[\u0391-\uFFE5\w]+$/.test(value);
            }, "&nbsp;&nbsp;[用户名只能包括中文字、英文字母、数字和下划线!]");

            docObj = new AjaxUpload("#docUpload",
            {
                action: 'PM.aspx/Apply',
                data: { folder: '/Upload/Doc/' },
                autoSubmit: true,
                responseType: 'json',
                onChange: function(file, extension) {
                    if (extension && /^(doc)$/.test(extension)) {
                        $('#docMsg').text('[文件名： ' + file + ']').css("color", "black");
                        isSelectedDoc = true;
                    } else {
                        $('#docMsg').text('文件扩展名必须为 *.doc ').css("color", "red");
                        isSelectedDoc = false;
                        return false;
                    }
                },
                onComplete: function(file, response) {
                    if (response.isSuccess == true) {
                        docFileName = response.result;
                        $('#docMsg').text('[文件名： ' + file + ']' + '   [HashCode: ' + docFileName.replace(".doc", "") + ']').css("color", "black");
                    }
                    else {
                        isSelectedDoc = false;
                        $("#docMsg").text(response.result).css("color", "red");
                    }
                }
            });

            imgObj = new AjaxUpload("#imgUpload", {
                action: 'PM.aspx/Apply',
                autoSubmit: false,
                responseType: 'json',
                onChange: function(file, extension) {
                    if (extension && /^(jpg|png)$/.test(extension)) {
                        $('#imgMsg').text('[文件名： ' + file + ']').css("color", "black");
                        isSelectedImg = true;
                    }
                    else {
                        $('#imgMsg').text('文件扩展名必须为*.jpg 或 *.png ').css("color", "red");
                        isSelectedImg = false;
                        return false;
                    }
                },

                onComplete: function(file, response) {
                    if (response.isSuccess == true) {
                        isSelectedImg = false;
                        isSelectedDoc = false;
                        $("#docMsg").html("文件类型 : [*.doc | 大小1 - 500k]");
                        $("#imgMsg").html("文件类型 : [*.jpg、*.png | 大小1 - 50k]");
                        $("input[type*='text']").val("");
                        $("#displayInfo").hide();
                        $("#msg").text(response.result);
                        $("#closeDailog").show();

                    }
                    else {
                        isSelectedImg = false;
                        isSelectedDoc = false;
                        $("#imgMsg").text(response.result).css("color", "red");
                        $("#displayInfo").hide();
                        $("#msg").text(response["result"]);
                        $("#closeDailog").show();
                    }
                }
            });
        });

        function loadArea(id) {
            $.ajax({
                url: "PM.aspx/LoadArea/" + id,
                type: "POST",
                dataType: "json",
                success: areaSuccessed
            });
        }

        function areaSuccessed(result) {
            if (result.rows.length > 0) {
                $.each(result, function(i, item) {
                    areaPos = item[0].cell[2];
                });
            }

            loadWage();
        }

        $(function() {
            $("#divIframe").dialog({
                show: 'drop',
                bgiframe: false,
                autoOpen: false,
                draggable: true,
                resizable: true,
                modal: true,
                dialogClass: "removeCloseBtn",
                closeOnEscape: false
            });
        });

        function submitInfo() {
            var applydescnew = $("#applydesc").val();
            if (applydescnew != null) {
                if ((applydescnew.toLowerCase().indexOf("script") >= 0)) {
                    alert("备注含有非法字符!");
                    return;
                }
            }
            //验证信息
            if ($("#form1").valid()) {
                if (!isSelectedDoc) {
                    $("#docMsg").text("请上传简历!").css("color", "red");
                    return false;
                }
                if (!isSelectedImg) {
                    $("#imgMsg").text("请上传照片!").css("color", "red");
                    return false;
                }

                // 所属信息
                areaID = $("#area").val();
                var wage;
                var postwage
                var placeArray = $("#place").val().split(","); // 职位
                var placeID = placeArray[0]; //职位id
                var wtype = placeArray[1]; // 用来判断是输入还是选择
                var bz = $("#bz").val();

                //个人信息
                var username = $("#username").val();
                var sex = $("input[name*='sex']")[0].checked ? 0 : 1;
                var edu = $("#edu").val();
                var idcard = $("#idcard").val();
                var mobile = $("#mobile").val();
                var address = $("#address").val();
                var bankaccount = $("#bankaccount").val();
                var banktype = $("input[name*='banktype']")[0].checked ? 0 : 1;
                var applydesc = $("#applydesc").val();
                var bankdeposit = $("#bankdeposit").val();
                //-----------------------------------------------------------------------------
                //获得薪资
                //alert(applydesc);


                // wtype=0 任意输入，1 最高最低，2 只能选择
                var wagetbxValue = $("#wagetbx").val();

                if (wtype == 0) {
                  
                    if (!intExp.test(wagetbxValue)) {
                        
                        alert("请输入以数字构成的基本工资!");
                        return false;
                    }
                    else {
                        wage = $("#wagetbx").val();
                    }
                } else if (wtype == 1) {
                
                    if (! intExp.test(wagetbxValue)) {
                        alert("请输入以数字构成的基本工资!");
                        return false;
                    } else {
                    wage = $("#wagetbx").val();
                    var a = "0";
                    a.t
                    if ((parseInt(wage) >= parseInt(min) && parseInt(wage) <= parseInt(max)) == false) {
                            alert("超出基本工资范围[" + min + "~" + max + "]");
                            return false;
                        }
                       
                    }
                } else {
               
                wage = $("#wage").val();
                }
            //////////////////////////////////////////////
                var postwagetbxValue = $("#postwagetbx").val();

                if  (Number(postmin)==0 && Number(postmax)==0)
                {
                    postwage=0;
                }
                else
                {
                if (!intExp.test(postwagetbxValue)) {
                    alert("请输入以数字构成的岗位工资!");
                    return false;
                }
                else if (postmin == 0 &&postwage == 0) {
                    alert("该职位无岗位工资!");
                    return false;
                }
                else
                {
                    postwage = $("#postwagetbx").val();
                    if (!(Number(postwage) >= Number(postmin) && Number(postwage) <= Number(postmax))) {
                        alert("超出岗位工资范围[" + postmin + "~" + postmax + "]");
                        return false;
                    }
                }
                }

                //-----------------------------------------------------------------------------

                $("#displayInfo").show();
                $("#msg").text("信息处理中");

                $("#closeDailog").hide();
                $("#divIframe").dialog("open");
                // Init Post Data
                imgObj.setData({
                    'FOLDER': '/Upload/Img/',
                    'IMGFOLDER': '/Upload/Img/',
                    'DOCFOLDER': '/Upload/Doc/',
                    'DOCFILE': docFileName,
                    'PICFILE': "",
                    'AREAID': areaID,
                    'PLACE': placeID,
                    'WAGE': wage,
                    'PostWAGE': postwagetbxValue,
                    'BZ': bz,
                    'USERNAME': username,
                    'SEX': sex,
                    'EDU': edu,
                    'IDCARD': idcard,
                    'MOBILE': mobile,
                    'ADDRESS': address,
                    'BANKACCOUNT': bankaccount,
                    'BANKDEPOSIT': bankdeposit,
                    'BANKTYPE': banktype,
                    'APPLYDESC': applydesc
                });
                imgObj.submit();
            }
        }

        $("#form1").validate({
            rules:
             {
                 username: { required: true, userName: true, filterChar: true },
                 degree: { required: true },
                 idcard: { required: true, isIdCardNo: true, filterChar: true },
                 mobile: { required: true, number: true, filterChar: true },
                 address: { required: true, filterChar: true },
                 bankaccount: { required: true, number: true, filterChar: true },
                 bankdeposit: { required: true, filterChar: true },
                 applydesc: { required: true, filterChar: true }
             },
            messages:
            {
                username: { required: "&nbsp;&nbsp;[姓名不能为空!]" },
                degree: { required: "&nbsp;&nbsp;[学历不能为空!]" },
                idcard: { required: "&nbsp;&nbsp;[身份证号不能为空!]" },
                mobile: { required: "&nbsp;&nbsp;[联系电话不能为空!]", number: "&nbsp;&nbsp;[电话必须是数字!]" },
                address: { required: "&nbsp;&nbsp;[联系地址不能为空!]" },
                bankaccount: { required: "&nbsp;&nbsp;[银行账号不能为空!]", number: "&nbsp;&nbsp;[银行账号必须是数字!]" },
                bankdeposit: { required: "&nbsp;&nbsp;[开户银行不能为空!]" },
                applydesc: { required: "&nbsp;&nbsp;[申请备注不能为空!]" }
            }
        });

        //加载工资
        function loadWage() {

            
            $("#displayInfo").show();
            $("#msg").text("信息处理中");
            $("#divIframe").dialog("open");
            var placeArray = $("#place").val().split(","); // 职位
            var placeID = placeArray[0]; //职位id
            var wtype = placeArray[1]; // 用来判断是输入还是选择
           
            
            if (placeID == 7 ||placeID==9) {
                $("#areali").hide();
                //document.getElementById("areali").style.display = "hidden";  
                
            }
            else {
                $("#areali").show();
                //document.getElementById("areali").style.visibility = "visible";  
              
            }

            if (placeID == 3 || placeID == 4 || placeID == 5 | placeID == 6 || placeID == 7 || placeID == 9)
            {
                $("#postwage").hide();
                //document.getElementById("postwage").style.visibility = "hidden";  
            }
            else {
                $("#postwage").show();
                //document.getElementById("postwage").style.visibility = "visible";   
            }
            if (wtype == "2") {
                document.getElementById("wage").style.width = "60px";
                document.getElementById("wagetbx").style.width = "0px";
                document.getElementById("wagetbx").style.display = "none";
                /*
                //$("#wage").show();
                //                document.getElementById("wage").style.display = "";
                document.getElementById("wage").style.width = "10px";
               
                $("#wagetbx").hide();
                //document.getElementById("wagetbx").style.visibility = "hidden";  
                */

            }
            else {
                document.getElementById("wage").style.width = "0px";
                document.getElementById("wagetbx").style.width = "60px";
                document.getElementById("wagetbx").style.display = "";
                /*
                $("#wagetbx").show();
                //document.getElementById("wagetbx").style.visibility = "visible";
                //$("#wage").hide();
                //document.getElementById("wage").style.display = "none";
                document.getElementById("wage").style.width = "0px";
                document.getElementById("wages").innertext = "";
                */

            }

            $.ajax(
                 {
                     url: "PM.aspx/LoadWage/" + encodeURIComponent(placeID + "," + areaPos),
                     type: "POST",
                     dataType: "json",
                     success: wageSuccessed
                 });
        }

        function wageSuccessed(result) {
            
            $("#wage").empty();
            if (result.rows.length > 0) {
                $.each(result, function(i, items) {
                    $.each(items, function(j, item) {
                        $("<option></option>").val(item.cell[1]).text(item.cell[1]).appendTo($("#wage"));

                        min = item.cell[2];
                        max = item.cell[3];
                        postmin = item.cell[4];
                        postmax = item.cell[5];
//                        if (postmin == 0) {
//                            $("#postwage").hide();
//                        }
//                        else
//                            $("#postwage").show();



                    });
                });
            }
            $("#divIframe").dialog("close");
        }

   
    </script>

</asp:Content>
