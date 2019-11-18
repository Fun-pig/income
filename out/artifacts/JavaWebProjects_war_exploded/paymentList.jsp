<%--
  Created by IntelliJ IDEA.
  User: 89349
  Date: 2019/10/13
  Time: 12:38
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
    <title>支出记录查询页</title>
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
        <h3>支出统计</h3>
    </div>

    <div class="row">
        <div class="col-md-8">
            <h4>
                <span class="text-muted">查询列表</span>
            </h4>

            <form id="checkform">
                <input type="hidden" name="currentPage" id="currentPage"/>
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label>开始日期</label>
                        <input type="text" class="form-control" name="startDate" id="startDate" value=""/>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>结束日期</label>
                        <input type="text" class="form-control" name="endDate" id="endDate" value="" />
                    </div>
                    <div class="col-md-1 pull-center"></div>
                </div>

                <div class="row">
                    <div class="col-md-6 form-group">
                        <label>最小金额</label>
                        <input type="text" class="form-control" name="minAmount" id="minAmount" value="" />
                    </div>
                    <div class="col-md-6 form-group">
                        <label>最大金额</label>
                        <input type="text" class="form-control" name="maxAmount" id="maxAmount" value="" />
                    </div>
                </div>

                <hr/>
                <div class="row">
                    <div class="col-md-12">
                        <a class="btn btn-primary btn-block" type="button" onclick="">查询</a>
                    </div>
                </div>
            </form>

            <hr/>
            <h4>
                <span class="text-muted">数据列表</span>
            </h4>
            <div class="pull-right">
                <p class="text-danger" id="residueHTML">本月剩余￥：XX元</p>
                <div class="pull-right row-margin-bottom">
                    <button type="button" id="update" disabled="disabled" class="btn btn-warning" data-toggle="modal" data-target="#updateModal">修改</button>
                    <button type="button" class="btn btn-danger" onclick="">删除</button>
                </div>
            </div>
            <table class="table table-striped table-bordered bgcolorWhite" id="data-table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>序号</th>
                    <th>用途</th>
                    <th>支出金额</th>
                    <th>支出日期</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input type="checkbox" name="pid" value=""/></td>
                    <td>1</td>
                    <td>吃饭</td>
                    <td>10</td>
                    <td>2018-12-25 9:20:31</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="pid" value=""/></td>
                    <td>2</td>
                    <td>吃饭</td>
                    <td>10</td>
                    <td>2018-12-25 9:20:31</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="pid" value=""/></td>
                    <td>3</td>
                    <td>吃饭</td>
                    <td>10</td>
                    <td>2018-12-25 9:20:31</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="pid" value=""/></td>
                    <td>4</td>
                    <td>吃饭</td>
                    <td>10</td>
                    <td>2018-12-25 9:20:31</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="pid" value=""/></td>
                    <td>5</td>
                    <td>吃饭</td>
                    <td>10</td>
                    <td>2018-12-25 9:20:31</td>
                </tr>
                </tbody>
            </table>

            <ul class="pagination pull-right">
                <li><a onclick="">&laquo;</a></li>
                <li class="active"><a onclick="">1</a></li>
                <li><a onclick="">2</a></li>
                <li><a onclick="">3</a></li>
                <li><a onclick="">4</a></li>
                <li><a onclick="">&raquo;</a></li>

            </ul>

        </div>

        <div class="col-md-4">
            <h4>
                <span class="text-muted">菜单</span>
            </h4>
            <ul class="list-group mb-3">
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h5>收入登记</h5>
                        <ul>
                            <li>
                                <a href="">
                                    <small class="text-muted">新增收入</small>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <small class="text-muted">查询收入</small>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h5>支出登记</h5>
                        <ul>
                            <li>
                                <a href="">
                                    <small class="text-muted">新增支出</small>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <small class="text-muted">查询支出</small>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>

    </div>

    <footer class="text-muted text-center text-small">
        <p>&copy; Designed By 邹雨欣</p>
    </footer>
</div>

<script>NProgress.done()</script>
</body>
</html>