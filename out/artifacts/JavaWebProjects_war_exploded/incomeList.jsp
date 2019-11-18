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
    <title>收入记录查询页</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="css/bootstrapValidator0.4.5.min.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">
    <link href="css/self-defined.css" rel="stylesheet">
    <link href="css/jquery.dataTables.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/loading.css">
    <link rel="stylesheet" href="nprogress/nprogress.css">
    <script src="nprogress/nprogress.js"></script>
</head>

<body>
<script>NProgress.start()</script>
<div class="container">
    <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="images/Blogo.png" alt="" width="72" height="72">
        <h3>收入统计</h3>
    </div>

    <div class="row">
        <div class="col-md-8">
            <h4>
                <span class="text-muted">查询列表</span>
            </h4>

            <form id="checkform">
                <input type="hidden" name="currentPage" id="currentPage"/>
                <div class="row">
                    <div class="col-md-6 form-group input-append date form_datetime">
                        <label>开始日期</label>
                        <input class="form-control" size="16" type="text" name="startDate" id="startDate" value="" >
                        <span class="add-on"><i class="icon-remove"></i></span>
                        <span class="add-on"><i class="icon-calendar"></i></span>
                    </div>
                    <div class="col-md-6 form-group input-append date form_datetime">
                        <label>结束日期</label>
                        <input class="form-control" size="16" type="text" name="endDate" id="endDate" value="" >
                        <span class="add-on"><i class="icon-remove"></i></span>
                        <span class="add-on"><i class="icon-calendar"></i></span>
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
                        <a class="btn btn-primary btn-block" type="button" onclick="" id="search">查询</a>
                    </div>
                </div>
            </form>

            <hr/>
            <h4>
                <span class="text-muted">数据列表</span>
            </h4>
            <div class="pull-right">
                <p class="text-danger" id="residueHTML">本月剩余￥：<span id="rest">50</span>元</p>
                <div class="pull-right row-margin-bottom">
<%--                    <button type="button" id="update" disabled="disabled" class="btn btn-warning" data-toggle="modal" data-target="#updateModal">修改</button>--%>
                    <button type="button" id="update" class="btn btn-warning" disabled="disabled" data-toggle="modal" data-target="#incomeUpdata">
                        修改
                    </button>
                    <button type="button" class="btn btn-danger" id="delete_one" onclick="">删除</button>
                    <button id="btn_delete" class="btn btn-danger" href="#" style="display: none">批量删除</button>
                </div>
            </div>
            <table class="table table-striped table-bordered bgcolorWhite" id="data-table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>序号</th>
                    <th>收入来源</th>
                    <th>收入金额</th>
                    <th>收入日期</th>
                </tr>
                </thead>
                <tbody></tbody>
            </table>

<%--            <ul class="pagination pull-right">--%>

<%--            </ul>--%>
            <ul id="pagination" class="pagination pull-right">
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
                                <a href="/incomAddPage">
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

<%--修改弹出框--%>
<div class="modal fade" id="incomeUpdata" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">修改收入</h4>
            </div>
            <form action="/UpdataIcome" method="get">
                <div class="modal-body">
                    <div class="form-group" style="display: none">
                        <label for="incomeId">ID</label>
                        <input type="text" class="form-control" id="incomeId" name="incomeId">
                    </div>
                    <div class="form-group">
                        <label for="incomeSource">收入来源</label>
                        <input type="text" class="form-control" id="incomeSource" name="incomeSource">
                    </div>
                    <div class="form-group">
                        <label for="incomeCount">收入金额</label>
                        <input type="number" class="form-control" id="incomeCount" name="incomeCount">
                    </div>
                    <div class="form-group">
                        <label for="incomeTime">收入日期</label>
                        <input type="text" class="form-control" id="incomeTime" name="incomeTime" readonly="readonly">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="close" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button id="save" class="btn btn-primary" type="submit">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-datetimepicker.min.js"></script>
<script src="js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="twbs-pagination/jquery.twbsPagination.js"></script>

<div id="loading" style="display: none;">
    <div class="lds-ripple"><div></div><div></div></div>
</div>

<script>
    // nprogress
    $(document)
        .ajaxStart(function () {
            NProgress.start()
            $('#loading').fadeIn()
        })
        .ajaxStop(function () {
            NProgress.done()
            $('#loading').fadeOut()
        });

    var currentPage = 1;

    function formatTen(num) {
        return num > 9 ? (num + "") : ("0" + num);
    }
    function formatDate(date) {
        var date = new Date(date)
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var day = date.getDate();
        var hour = date.getHours();
        var minute = date.getMinutes();
        var second = date.getSeconds();
        return year + "-" + formatTen(month) + "-" + formatTen(day)+ " " +formatTen(hour)+ ":" +formatTen(minute)+ ":" +formatTen(second);
    }


    // 查询时间插件
    $("#startDate,#endDate").datetimepicker({
        minView: "month",
        language: 'zh-CN',
        format: "yyyy-mm-dd",
        autoclose: true,
        todayBtn: true
    });

    function loadPageDataByParams (page) {
        $('tbody').fadeOut();
        $.ajax({
            url: 'searchIncome',
            method: 'GET',
            data: {startDate : $('#startDate').val(), endDate : $('#endDate').val(), minAmount : $('#minAmount').val(), maxAmount : $('#maxAmount').val(), page : page},
            success: function (res) {
                var total_page = Math.ceil(res[1][0]["count"] / 4);
                if (page > total_page) {
                    loadPageDataByParams(total_page);
                    return;
                }
                if (page < 1) {
                    $('tbody').html();
                    return;
                }
                $('#pagination').twbsPagination('destroy');
                $('#pagination').twbsPagination({
                    first: '&laquo',
                    last: '&raquo',
                    prev: '&lt',
                    next: '&gt',
                    startPage: page,
                    totalPages: total_page,
                    visiablePages: 4,
                    initiateStartPageClick :false,
                    onPageClick: function (e, page) {
                        // 第一次初始化时会触发一次
                        loadPageDataByParams(page);
                    }
                });
                var incomeLengthParams = res[0].length;
                var html = null;
                for (var i = 0; i < incomeLengthParams; i++) {
                    var d = formatDate(res[0][i]["in_time"]);
                    var data = res[0][i]["in_id"];
                    html += '<tr data-id="'+data+'"><td><input type="checkbox" id="pid" name="pid" value=""/></td>'+'<td>'+(i+1)+'</td>'+'<td>'+res[0][i]["in_content"]+'</td>'+'<td>'+res[0][i]["in_amount"]+'</td>'+'<td>'+d+'</td></tr>';
                }
                $('tbody').html(html).fadeIn();
                currentPage = page;
            },
            error: function () {
                console.log("规规矩矩，按照老师的要求来");
            }
        });
    }

    $('#search').on('click', function () {
        var startDate = $('#startDate').val();
        var endDate = $('#endDate').val();
        var minAmount = $('#minAmount').val();
        var maxAmount = $('#maxAmount').val();
        console.log(startDate);
        console.log(endDate);
        console.log(minAmount);
        console.log(maxAmount);
        loadPageDataByParams(1);

    });

    /*分页*/
    function loadPageData (page) {
        $('tbody').fadeOut();
        $.ajax({
            url: "IncomeListServlet",
            method: "GET",
            dataType: 'json',
            data: {page : page},
            success: function (res) {
                $('#rest').html(res[2][0]["money"]);
                var total_page = Math.ceil(res[1][0]["count"] / 4);
                if (page > total_page) {
                    loadPageData(total_page);
                    return
                }
                $('#pagination').twbsPagination('destroy');
                $('#pagination').twbsPagination({
                    first: '&laquo',
                    last: '&raquo',
                    prev: '&lt',
                    next: '&gt',
                    startPage: page,
                    totalPages: total_page,
                    visiablePages: 4,
                    initiateStartPageClick :false,
                    onPageClick: function (e, page) {
                        // 第一次初始化时会触发一次
                        loadPageData(page);
                    }
                });

                var incomeLength = res[0].length;
                var html = null;
                for (var i = 0; i < incomeLength; i++) {
                    var d = formatDate(res[0][i]["in_time"]);
                    var data = res[0][i]["in_id"];
                    html += '<tr data-id="'+data+'"><td><input type="checkbox" id="pid" name="pid" value=""/></td>'+'<td>'+(i+1)+'</td>'+'<td>'+res[0][i]["in_content"]+'</td>'+'<td>'+res[0][i]["in_amount"]+'</td>'+'<td>'+d+'</td></tr>';
                }
                $('tbody').html(html).fadeIn();
                currentPage = page;
            },
            error: function () {
                console.log("规规矩矩，按照老师的要求来");
            }
        });
    }
    // 必须先初始化一次，否则没办法执行  $('#pagination').twbsPagination('destroy');
    $('#pagination').twbsPagination({
        first: '&laquo',
        last: '&raquo',
        prev: '&lt',
        next: '&gt',
        totalPages: 100,
        visiablePages: 4,
        onPageClick: function (e, page) {
            // 第一次初始化时会触发一次
            loadPageData(page);
        }
    });
    loadPageData(1);

    // 修改功能
    var arr = [];
    $('tbody').on('change', '#pid', function () {
        var tr = $(this).parent().parent();
        var id = tr.data('id');
        if ($(this).prop('checked')) {
            arr.push(id);
        } else {
            arr.splice(id,1);
        }
        if (arr.length == 1) {
            $('#update').removeAttr('disabled');
        } else {
            $('#update').attr('disabled','disabled');
        }
        $('#update').on('click', function () {
            $.get('incomeOrign', {id : arr[0]}, function (res) {
                // console.log(res);
                // console.log(res[0]["in_time"]);
                console.log(arr[0]);
                $('#incomeId').val(res[0]["in_id"]);
                $('#incomeSource').val(res[0]["in_content"]);
                $('#incomeCount').val(res[0]["in_amount"]);
                $('#incomeTime').val(formatDate(res[0]["in_time"]));
            });
        });
    });
    $('#close').on('click', function () {
        loadPageData(currentPage);
        arr.splice(0,arr.length);
        $('#update').attr('disabled','disabled');
    });

    // 删除功能
    $('tbody').on('change', '#pid', function () {
        var tr = $(this).parent().parent();
        var id = tr.data('id');
        if ($(this).prop('checked')){
            $('#delete_one').on('click', function () {
                $.get('IncomeDelete', {id: id}, function (res) {
                    if (res == 1) {
                        loadPageData(currentPage);
                        arr.splice(0,arr.length);
                        $('#update').attr('disabled','disabled');
                    }
                });
            })
        } else {
            console.log("没有选中");
        }
    });

</script>
<script>NProgress.done()</script>
</body>
</html>