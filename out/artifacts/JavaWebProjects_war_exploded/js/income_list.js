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

// $.getJSON("IncomeListServlet", {page : 2}, function (res) {
//     /*请求得到响应过后自动执行*/
//     // console.log(res);
//     // console.log(res.length);
//     // console.log(res[0]);
//     // console.log(res[0]["in_content"]);
//
//     var incomeLength = res.length;
//     var html = null;
//     for (var i = 0; i < incomeLength; i++) {
//         var d = formatDate(res[i]["in_time"]);
//         html += '<tr><td><input type="checkbox" name="pid" value=""/></td>'+'<td>'+(i+1)+'</td>'+'<td>'+res[i]["in_content"]+'</td>'+'<td>'+res[i]["in_amount"]+'</td>'+'<td>'+d+'</td></tr>'
//     }
//     $('tbody').html(html);
//
//     // $('tbody').html('<tr><td><input type="checkbox" name="pid" value=""/></td>'+'<td>'+1+'</td>'+'<td>'+res[0]["in_content"]+'</td>'+'<td>'+res[0]["in_amount"]+'</td>'+'<td>'+res[0]["in_time"]+'</td>'+'</tr>');
//     // var html = $('#comments_tmpl').render({comments:res});
//     // $('tbody').html(html);
//
// });







function loadPageData (page) {
    $('tbody').fadeOut();
    $.getJSON("IncomeListServlet", {page : page}, function (res) {
        $('#pagination').twbsPagination({
            first: '&laquo',
            last: '&raquo',
            prev: '&lt',
            next: '&gt',
            totalPages: Math.ceil(res[1][0]["count(1)"] / 4),
            visiablePages: 4,
            initiateStartPageClick :false,
            onPageClick: function (e, page) {
                // 第一次初始化时会触发一次
                loadPageData(page);
            }
        });
        console.log(res);
        console.log(res[0]);
        console.log(res[1]);
        console.log(res[1][0]["count(1)"]);
        console.log(res[1][0]["count(1)"] / 4);
        console.log(Math.ceil(res[1][0]["count(1)"] / 4));
        var incomeLength = res[0].length;
        var html = null;
        for (var i = 0; i < incomeLength; i++) {
            var d = formatDate(res[0][i]["in_time"]);
            html += '<tr><td><input type="checkbox" name="pid" value=""/></td>'+'<td>'+(i+1)+'</td>'+'<td>'+res[0][i]["in_content"]+'</td>'+'<td>'+res[0][i]["in_amount"]+'</td>'+'<td>'+d+'</td></tr>'
        }
        $('tbody').html(html).fadeIn();
    });
}
loadPageData(1);



/**
 * 分页功能
 */
// $('#pagination').twbsPagination({
//     first: '&laquo;',
//     last: '&raquo;',
//     prev: '&lt',
//     next: '&gt',
//     totalPages: 100,
//     visiablePages: 5,
//     onPageClick: function (e, page) {
//         // 第一次初始化时会触发一次
//         loadPageData(page);
//     }
// });