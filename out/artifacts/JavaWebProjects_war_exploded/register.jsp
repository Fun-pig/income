<%--
  Created by IntelliJ IDEA.
  User: Ethel_oo
  Date: 2019/9/5
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h2>注册</h2>
    <form action="/register" method="get">
      id号：<input type="text" name="id"/>
      用户名：<input type="text" name="username"/>
      密码：<input type="password" name="password">
      <button type="submit">提交</button>
    </form>
  </body>
</html>
