$(function () {
    getPage();
});
var page = 1;
var limit = 10;
var total;
var searchKey;



/**
 * 启用/停用
 * */
function updateStatus(ids) {
    $.ajax({
        type:"POST",
        url:"/financial/updateStatus",
        data:{
            "ids":ids,
            "searchKey":searchKey
        },
        success:function (data) {
            $("#reflush").html(data);
            layer.msg(data.msg);
            if(data && data.success){
                setTimeout(function () {
                    loadData();
                },100);
            }
        }
    });
}

function deleteFinancial(t) {
    var id = $(t).parents(".text-c").find("input[name='id']").val();
    layer.confirm("是否将所选择的删除",{
        btn:['确定','取消'],
        btn1:function (index, layero) {
            layer.close(index);
            updateDelete(id);
        },
        btn2:function (index, layero) {
            layer.close(index);
        }
    });

}

function updateFinancialStatus(t,type) {
    var id = $(t).parents(".text-c").find("input[name='id']").val();
    if("1" == type){
        layer.confirm("是否启用",{
            btn:['确定','取消'],
            btn1:function (index, layero) {
                layer.close(index);
                updateStatus(id);
            },
            btn2:function (index, layero) {
                layer.close(index);
            }
        });
    }else {
        layer.confirm("是否将停用",{
            btn:['确定','取消'],
            btn1:function (index, layero) {
                layer.close(index);
                updateStatus(id);
            },
            btn2:function (index, layero) {
                layer.close(index);
            }
        });
    }


}

/**
 * 删除
 * */
function updateDelete(ids) {
    $.ajax({
        type:"POST",
        url:"/financial/delete",
        data:{
            "ids":ids,
            "type":"2"
        },
        success:function (data) {
            $("#reflush").html(data);
            layer.msg(data.msg);
            if(data && data.success){
                setTimeout(function () {
                    //重新定义 页数
                    //获取当前页数
                    total = data.payload;
                    //判断当 前页面 是否存在
                    if(Math.ceil(total/limit) < page){
                        page = Math.ceil(total/limit);
                    }
                    getPage();
                },100);
            }
        }
    });
}

/**
 * 加载数据
 * */
function loadData() {
    NProgress.start();
    $.ajax({
        type: "POST",
        url: "/financial/getFinancialList",
        data:{
            "pageNum":page,
            "limit":limit,
            "searchKey":searchKey
        },
        success: function (data) {
            $("#list").html(data);
            NProgress.done();
/*            var imgM = imgManger;
            imgM.init();*/
            setTimeout(function () {
/*
                getMenu();
*/
                var total = $("#total").val();
                if(total == 0){
                    $("#laypage").attr("hidden","hidden");
                    $("#dataNull").removeAttr("hidden");
                }else {
                    $("#dataNull").attr("hidden","hidden");
                    $("#laypage").removeAttr("hidden");
                }
            },100);
        }
    });
}
/**
 * 加载分页
 * */
function getPage() {
    loadData();  //加载数据
    setTimeout(function () {
        total=$("#total").val();
        /*    var imgM = imgManger;
            imgM.init();*/
        layui.use('laypage', function(){
            var laypage = layui.laypage;


            //执行一个laypage实例
            laypage.render({
                elem: 'laypage' //注意，这里的 test1 是 ID，不用加 # 号
                ,count: total, //数据总数，从服务端得到
                limit:limit,   //每页条数设置
                curr:page,
                layout: ['count', 'prev', 'page', 'next', 'limit', 'skip'],
                jump: function(obj, first){
                    //obj包含了当前分页的所有参数，比如：
                    //console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                    //console.log(obj.limit); //得到每页显示的条数
                    //首次不执行
                    if(!first){
                        page=obj.curr;  //改变当前页码
                        limit=obj.limit;
                        total = $("#total").val();
                        loadData();  //加载数据
                        //初始化数据
                    }
                    /*                imgM.init();*/
                }
            });
        });
    },1000);


}

/**
 * 批量设置是否启用
 * */
function btn_update(){

    var ids = '';
    $("input[name='checkbox']:checked").each(function(){
        var id = $(this).parent().parent().find("[name='id']").val();
        ids = ids + id + ",";
    });
    if(StringUtils.isEmpty(ids)){
        layer.msg("请选择至少一条记录操作",function () {
        });
    }else{
        //判断最后是否有逗号 有的话去掉
        if(ids.endsWith(",")){
            ids = ids.substring(0,ids.length-1);
        }
        layer.confirm("是否将所选择的记录启用/停用",{
            btn:['确定','取消'],
            btn1:function (index, layero) {
                layer.close(index);
                updateStatus(ids);
            },
            btn2:function (index, layero) {
                layer.close(index);
            }
        });
    }

    //layer.alert("123");
}

function btn_delete(){
    var ids = '';
    $("input[name='checkbox']:checked").each(function(){
        var id = $(this).parent().parent().find("[name='id']").val();
        ids = ids + id + ",";
    });
    if(StringUtils.isEmpty(ids)){
        layer.msg("请选择至少一个用户操作",function () {
        });
    }else{
        //判断最后是否有逗号 有的话去掉
        if(ids.endsWith(",")){
            ids = ids.substring(0,ids.length-1);
        }
        layer.confirm("是否将所选择的用户删除",{
            btn:['确定','取消'],
            btn1:function (index, layero) {
                layer.close(index);
                updateDelete(ids);
            },
            btn2:function (index, layero) {
                layer.close(index);
            }
        });
    }
}

/*用户-添加*/
function financial_add(title,url){
    layer.open({
        type: 2,
        /*shadeClose: true,*/
        fixed: false, //不固定
        maxmin: false, //开启最大化最小化按钮
        area: ['620px', '500px'],
        title: title,
        content: url,
        end: function () {
            //重新定义 页数 到首页
            page = 1;
            getPage();
        }
    });
}

function financial_add_record(t, title,url){
    var id = t == null ? "" : $(t).parents(".text-c").find("input[name='id']").val();
    console.log('id:' + id);
    layer.open({
        type: 2,
        /*shadeClose: true,*/
        fixed: false, //不固定
        maxmin: false, //开启最大化最小化按钮
        area: ['620px', '500px'],
        title: title,
        content: url +"?id="+id,
        end: function () {
            //重新定义 页数 到首页
            page = 1;
            getPage();
        }
    });
}

function chooseAll(){
    var temp = $("#check1").is(':checked');
    $('input[name="checkbox"]').each(function () {
        if(temp){
            $(this).prop("checked","checked");
        }else {
            $(this).removeAttr("checked");
        }

    });
}
function chooseThis(e) {
    var box = $(e).find('input[name="checkbox"]');
    var temp = $(box).is(':checked');
    if(!temp){
        $(box).prop("checked","checked");
    }else {
        $(box).removeAttr("checked");
    }
}

function searchValue() {
    var value = $("#search").val();
    page = 1;
    searchKey = value;
    getPage();
}

