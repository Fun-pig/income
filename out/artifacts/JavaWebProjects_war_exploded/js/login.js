// $(function(){
//     var that = $(this);
//
//     $("input[name='username2']").blur(function(){
//         // console.log($(this).val());
//         if($(this).val() != ""){
//             $("#err_user").css('display','none');
//             $("#regist_btn").removeAttr("disabled");
//         } else {
//             $("#err_user").css('display','block');
//             $("#regist_btn").attr("disabled", "disabled");
//         }
//     });
//
//     var flag = null;
//     $("input[name='password2']").blur(function(){
//         // console.log($(this).val());
//         flag = $(this).val();
//         if($(this).val() != ""){
//             $("#err_pass").css('display','none');
//             $("#regist_btn").removeAttr("disabled");
//         } else {
//             $("#err_pass").css('display','block');
//             $("#regist_btn").attr("disabled", "disabled");
//         }
//     });
//
//     $("input[name='repassword']").blur(function(){
//         // console.log($(this).val());
//         if(flag != $(this).val()){
//             $("#err_repass").css('display','block');
//             $("#regist_btn").attr("disabled", "disabled");
//             // $("#regist").attr("action","err");
//         } else {
//             $("#err_repass").css('display','none');
//             $("#regist_btn").removeAttr("disabled");
//         }
//     });
//
//     // var err_user = $("#err_user").css("display");
//     // var err_pass = $("#err_pass").css("display");
//     // var err_repass = $("#err_repass").css("display");
//     //
//     // if (err_user == 'none') {
//     //     console.log(111);
//     //     // $("#regist_btn").attr("disabled", "disabled");
//     // } else {
//     //     // $("#regist_btn").removeAttr("disabled");
//     //     console.log(222);
//     // }
//
//
//
// });
$(function () {
    $('#regist').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            username2: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    },
                    stringLength: {
                        min: 4,
                        max: 30,
                        message: '用户名必须是4-30字之间'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: '用户名只能是数字，字母或下划线'
                    }
                }
            },
            password2: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: '密码必须是6-30字之间'
                    },
                    different: {//不能和用户名相同
                        field: 'username2',
                        message: '不能和用户名相同'
                    }
                }
            },
            repassword: {
                validators: {
                    notEmpty: {
                        message: '确认密码不能为空'
                    },
                    identical: {//相同
                        field: 'password2',
                        message: '两次密码不一致'
                    },
                    different: {//不能和用户名相同
                        field: 'username2',
                        message: '不能和用户名相同'
                    }
                }
            }
        }
    });
});