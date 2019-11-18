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
    <title>支出登记页</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="css/bootstrapValidator0.4.5.min.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">
    <link href="css/self-defined.css" rel="stylesheet">
    <link href="css/jquery.dataTables.min.css" rel="stylesheet">
    <link rel="stylesheet" href="nprogress/nprogress.css">
    <script src="nprogress/nprogress.js"></script>
</head>

<body>
<script>NProgress.start()</script>
<div class="container">
    <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="images/Blogo.png" alt="" width="72" height="72">
        <h3>收入登记</h3>
    </div>

    <div class="row">
        <div class="col-md-12 order-md-1">
            <form class="form-horizontal" id="checkform" action="/incomAdd" method="POST">
                <div class="row form-group">
                    <label>收入金额</label>
                    <input type="text" class="form-control" name="in_amount" id="in_amount" />
                </div>

                <div class="row form-group">
                    <label>用途</label>
                    <input type="text" class="form-control" name="in_content" id="in_content" maxlength="50" />
                </div>

                <hr>
                <button class="btn btn-primary btn-lg btn-block" type="submit">点击提交</button>
            </form>
        </div>
    </div>

    <footer class="text-muted text-center text-small">
        <p>&copy; Designed By 邹雨欣</p>
    </footer>
</div>

<script>NProgress.done()</script>
</body>
</html>
