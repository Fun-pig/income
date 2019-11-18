<%--
  Created by IntelliJ IDEA.
  User: 89349
  Date: 2019/10/13
  Time: 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>登录页</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="css/bootstrapValidator0.4.5.min.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">
    <link href="css/self-defined.css" rel="stylesheet">
    <link href="css/jquery.dataTables.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/animate.min.css">
    <link rel="stylesheet" href="css/register.css">
    <link rel="stylesheet" href="nprogress/nprogress.css">
    <script src="nprogress/nprogress.js"></script>
</head>

<body class="text-center">
<script>NProgress.start()</script>
<form class="form-signin form-horizontal" id="checkform" action="/login" method="POST">
    <div class="row row-margin-bottom">
        <img class="d-block mx-auto mb-4" src="images/Blogo.png" alt="" width="72" height="72">
    </div>

    <%--    有错误信息是显示--%>
    <div class="alert alert-danger" id="err" style="display:none">
        <strong>错误！${tips} </strong>
    </div>

    <div class="row row-margin-bottom form-group">
        <label>用户名：</label>
        <input type="text" class="form-control" name="username" id="username" placeholder="请输入用户名..." required>
    </div>

    <div class="row row-margin-bottom form-group">
        <label>密码：</label><br/>
        <input type="password" class="form-control" name="password" id="password" placeholder="请输入密码..." required>
    </div>

    <div class="row row-margin-bottom">
        <button class="btn btn-lg btn-primary" type="submit">登录</button>
        <button class="btn btn-lg btn-primary" id="regbtn" data-toggle="modal" data-target="#register" type="button">注册</button>
    </div>
    <p class="mt-5 mb-3 text-muted">&copy; Designed By 邹雨欣</p>
</form>
<!-- Modal -->
<div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form action="/register" method="POST" id="regist">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">注册</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>用户名</label>
                        <input type="text" name="username2" class="form-control" placeholder="请输入用户名...">
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input type="password" name="password2" class="form-control" placeholder="密码长度需在6-18之间">
                    </div>
                    <div class="form-group">
                        <label>确认密码</label>
                        <input type="password" name="repassword" class="form-control">
                    </div>
                    <div class="alert alert-danger" role="alert" id="err_user" style="display:none">账号不能为空</div>
                    <div class="alert alert-danger" role="alert" id="err_pass" style="display:none">密码不能为空</div>
                    <div class="alert alert-danger" role="alert" id="err_repass" style="display:none">两次密码不一致</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" disabled="disabled" id="regist_btn" class="btn btn-primary" >提交</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrapValidator0.4.5.min.js"></script>
<script src="js/login.js"></script>
<script>
    var msg="${tips}";
    if(msg != "") {
        $('#err').css("display","block");
        $('#checkform').addClass(' shake animated');
    } else {
        $('#err').css("display","none");
    }
</script>

<script>NProgress.done()</script>
</body>
</html>