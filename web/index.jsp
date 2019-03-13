<%--
  Created by IntelliJ IDEA.
  User: 蔡程健
  Date: 2019/1/25
  Time: 23:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<%--引入样式--%>
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<head>
    <title>Title</title>
</head>
<body>


<!-- 员工编辑模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabe2">员工编辑</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="0" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="1"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input"  placeholder="email" placeholder="email@atguigu.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label name="empName" class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_update_select">
                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">修改</button>
            </div>
        </div>
    </div>
</div>


<!-- 员工添加模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text"  name="empName" class="form-control" id="empName_add_input"  placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="0" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="1"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input"  placeholder="email" placeholder="email@atguigu.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label name="empName" class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_add_select">
                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<%--<h1>员工列表</h1>--%>
<div class="container">
    <%--大标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all">删除</button>
        </div>
    </div>

    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>


    <div class="row">
        <div class="col-md-6" id="page_info_area">

        </div>

        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>
</div>

<script type="text/javascript">

    var totalRecord,localPage;
    $(function () {
        to_page(1);
    });

    function to_page(pn) {
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                // console.log(result);
                //    1.解析显示员工信息
                build_emps_table(result);
                //    2.解析显示分页页面
                build_page_info(result);
                //    3.解析分页条
                build_page_nav(result);
            }
        });
    }

    function  build_emps_table(result) {
        $("#emps_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps,function (index,item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>")
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var emailTd = $("<td></td>").append(item.email);
            var genderTd = $("<td></td>").append(item.gender=="0"?"男":"女");
            var empDeptNameTd = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil").append("`编辑"));
            editBtn.attr("edit-id",item.empId);
            var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash").append("删除"));
            deleteBtn.attr("delete-id",item.empId);
            var BtnTd = $("<td></td>").append(editBtn).append(" ").append(deleteBtn);
        $("<tr></tr>").append(checkBoxTd)
            .append(empIdTd)
            .append(empNameTd)
            .append(genderTd)
            .append(emailTd)
            .append(empDeptNameTd)
            .append(BtnTd)
            .appendTo("#emps_table tbody");
        });
    }
    //显示分页信息
    function build_page_info(result){
    //page_info_area
        $("#page_info_area").empty();
        $("#page_info_area").append("当前第"+result.extend.pageInfo.pageNum+",总"+result.extend.pageInfo.pages+"页，总"+result.extend.pageInfo.total+"条记录");
        totalRecord = result.extend.pageInfo.pages;
        localPage = result.extend.pageInfo.pageNum;
    }
    //显示分页条
    function build_page_nav(result) {
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"))

        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        var pageInfoLi = $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
            ul.append(numLi);
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            } else {
                numLi.click(function () {
                    to_page(item);
                });
            }
        });
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
        }
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul).appendTo("#page_nav_area");
    }

        function reset_form(ele){
            $(ele)[0].reset();
            $(ele).find("*").removeClass("has-success has-error");
            $(ele).find(".help-block").text("");
        }

        $("#emp_add_modal_btn").click(function () {
            // 清除表单的数据，（表单完整重置（表单的数据，表单的样式））
            // $("#empAddModal form")[0].reset();
            reset_form("#empAddModal form");
            //在添加模块框中显示部门信息
            $("#empAddModal select").empty();
            getDepts("#empAddModal select")
            //模态框显示
           $("#empAddModal").modal({
               backdrop:"static"
            });
        });

        function getDepts(ele){
            //清空之前下拉列表的值
            $(ele).empty();
            $.ajax({
                url:"${APP_PATH}/depts",
                type:"GET",
                success:function(result){
                    //{"code":100,"msg":"处理成功！",
                    //"extend":{"depts":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"测试部"}]}}
                    //console.log(result);
                    //显示部门信息在下拉列表中
                    //$("#empAddModal select").append("")
                    $.each(result.extend.depts,function(){
                        var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                        optionEle.appendTo(ele);
                    });
                }
            });

        }

        $("#emp_save_btn").click(function () {
            //对提交的数据进行校验
            if(!validate_add_from()){
                return false;
            };
            if($(this).attr("ajax-va")=="error"){
                return false;
            }
            //发送ajax请求保存员工
            $.ajax({
                url:"${APP_PATH}/emp",
                type:"POST",
                data:$("#empAddModal form").serialize(),
                success:function(result){
                    //隐藏模块框
                    if (result.code==100){
                        $("#empAddModal").modal('hide');
                        //跳转到最后一页
                        to_page(totalRecord);
                        // alert(result.msg);
                    }else {
                        // alert(result.extend.errorFields.email);
                        // alert(result.extend.errorFields.empName);
                        // console.log(result);
                        if (undefined!=result.extend.errorFields.email){
                            show_validate_msg("#email_add_input","error",result.extend.errorFields.email);
                            // alert(result.extend.errorFields.email);
                        }
                        if (undefined!=result.extend.errorFields.empName){
                            show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName);
                            // alert(result.extend.errorFields.empName);
                        }
                    }
                }
            });
        });


        function validate_add_from() {
            //校验用户名
            var empName = $("#empName_add_input").val();
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
            if(!regName.test(empName)){
                // alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
                show_validate_msg("#empName_add_input", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
                return false;
            }else {
                show_validate_msg("#empName_add_input","success","");
            }
            //校验邮箱
            var email = $("#email_add_input").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                // alert("邮箱格式不正确");
                show_validate_msg("#email_add_input","error","邮箱格式不正确");
                return false;
            }else {
                show_validate_msg("#email_add_input","success","");
            }
            return true;
        }
        
        function show_validate_msg(ele, status, msg) {
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("");
            if("success"==status){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            }else if("error" == status){
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }

    $("#empName_add_input").change(function(){
        //发送ajax请求校验用户名是否可用
        var empName = this.value;
        $.ajax({
            url:"${APP_PATH}/checkuser",
            data:"empName="+empName,
            type:"POST",
            success:function(result){
                if(result.code==100){
                    show_validate_msg("#empName_add_input","success","用户名可用");
                    $("#emp_save_btn").attr("ajax-va","success");
                }else{
                    show_validate_msg("#empName_add_input","error",result.extend.va_msg);
                    $("#emp_save_btn").attr("ajax-va","error");
                }
            }
        });
    });

    $(document).on("click",".delete_btn",function () {
       // alert("delete");
        var empName = $(this).parents("tr").find("td:eq(1)").text();
        // alert(empName);
        var empId = $(this).attr("delete-id");
        // alert(empId);
        if(confirm("是否删除【"+empName+"】")){
            $.ajax({
                url:"${APP_PATH}/emp/"+empId,
                type:"DELETE",
                success:function (result) {
                    to_page(localPage);
                    alert(result.msg);
                }

            })
            }
    });




    $(document).on("click",".edit_btn",function(){
        //alert("edit");
        //1、查出部门信息，并显示部门列表
        getDepts("#empUpdateModal select");
        //2、查出员工信息，显示员工信息
        getEmp($(this).attr("edit-id"));
        // alert($(this).attr("edit-id"));
        //3、把员工的id传递给模态框的更新按钮
        $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));

        $("#empUpdateModal").modal({
            backdrop:"static"
        });
    });

    function getEmp(id){
        $.ajax({
            url:"${APP_PATH}/emp/"+id,
            type:"GET",
            success:function(result){
                // console.log(result);
                var empData = result.extend.emp
                $(".form-control-static").text(empData.empName);
                $("#email_update_input").val(empData.email);
                // alert(empData.email);
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#empUpdateModal select").val([empData.dId]);
            }
        });
    }

    $("#emp_update_btn").click(function () {
        var email = $("#email_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            // alert("邮箱格式不正确");
            show_validate_msg("#email_update_input","error","邮箱格式不正确");
            return false;
        }else {
            show_validate_msg("#email_update_input","success","");
        }
        // alert($("#empUpdateModal form").serialize());
        $.ajax({
            url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
            type:"PUT",
            data:$("#empUpdateModal form").serialize(),
            success:function (result) {
                // alert(data);
                $("#empUpdateModal").modal('hide');
                to_page(localPage);
                console.log(result);
           }
        });
    });

    $(document).on("click","#check_all",function () {
       // alert($("#check_all"));
       //  alert($(this).prop("checked"));
         $(".check_item").prop("checked",$(this).prop("checked"));
    });
    
    $(document).on("click",".check_item",function () {
        var flag = $(".check_item:checked").length==$(".check_item").length
        $("#check_all").prop("checked",flag);

    });

    $("#emp_delete_all").click(function () {
        var empNames = "";
        var empIds = "";
        $.each($(".check_item:checked"),function () {
            // alert($(this).parents("tr").find("td:eq(2)").text());
            empNames += $(this).parents("tr").find("td:eq(2)").text()+","
            empIds += $(this).parents("tr").find("td:eq(1)").text()+"-";
        });
        empNames = empNames.substring(0,empNames.length-1);
        empIds = empIds.substring(0,empNames.length-1)
        if ( confirm("确认删除【"+empNames+"】吗")){
            $.ajax({
               url:"${APP_PATH}/emp/"+empIds,
               type:"DELETE",
               success:function (result) {
                   to_page(localPage);
                   alert(result.msg);
               }
            });
        }
    });


</script>
</body>
</html>
