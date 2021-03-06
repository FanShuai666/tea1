<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>茶叶管理系统</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">茶叶品级管理系统</a>
            <ul class="nav navbar-nav">
                <li><a href="index.jsp">添加</a></li>
                <li><a href="statistics.jsp">统计</a></li>
                <li class="active"><a href="vote.jsp">投票</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <div class="row">
            <div class="col-md-7">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">群众最喜欢的茶叶</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row" id="famousTeaTabel">
                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title" id="currentTime"></h3>
                    </div>
                    <div class="panel-body">

                        <!-- 图表要绘制到这里，设定宽度和高度 -->
                        <div id="chart1" style="height: 370px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
        aria-labelledby="loginModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="loginModalLabel">登录</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <input id="phoneNum" type="text" class="form-control" placeholder="请输入手机号">
                        <span id="result"></span>
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="login()">登录</button>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.cookie.js"></script>
      
    <!-- 图表 js 库 -->
    <script src="js/echarts.min.js"></script>

    <script type="text/javascript">
        // 设置图表为全局变量
        var chart1 = null;

        $(document).ready(function () {
            
            $("#phoneNum").focus(function clear() {
                $("#phoneNum").val("");
                $("#result").html("");
            });

              loadFamousTea();
            // 基于准备好的 dom，初始化echarts实例，并设置全局变量 chart1
            chart1 = echarts.init(document.getElementById('chart1'));

            // 加载完毕页面就加载排行榜
            loadRank();
          

            // 然后每两秒更新一次排行榜，自己修改为 30 s
            setInterval('loadRank()', 30000);
        })
        
        
           
        
        
        function add_zero(temp){
                         if(temp<10) return "0"+temp;
                         else return temp;
                        }
        
        function getTime() {
            var d = new Date();
              var years = d.getFullYear();
              var month = add_zero(d.getMonth()+1);
              var days = add_zero(d.getDate());
              var hours = add_zero(d.getHours());
              var minutes = add_zero(d.getMinutes());
              var seconds=add_zero(d.getSeconds());
              var ndate ="排行榜   "+years+"年"+month+"月"+days+"日 "+hours+":"+minutes+":"+seconds;
              $("#currentTime").html(ndate);
        }
        
        function loadFamousTea(){

            $.ajax({
                type : 'GET',

                url : 'http://localhost:8081/Tea/listFamousTea',

                async : true,

                success : function(data) {
                    
                    $("#famousTeaTabel").html("");
                     $.each(data.data, function(index, obj){
                            
                            $("#famousTeaTabel").append("<div class='col-md-3'><div style='background-color:burlywood; padding:10px;margin-top:5px'><img src='img/"+obj.imageUrl+"' class='img-thumbnail'><button class='btn btn-default' type='button' onclick='loadVote("+obj.id+")' style='width:100%; margin-top:10px;'>投票("+obj.poll+")</button></div></div>");
                        });
                },
                
                error : function(msg) {

                    alert(JSON.stringify(msg));
                }
            });

        }

        // 投票
        function loadVote(id) {
            var username = $.cookie('username');
            if(username == null){
                 $('#loginModal').modal({});
            }else{
                $.ajax({
                    type : 'GET',

                    url : 'http://localhost:8081/Tea/updateFamousTea/'+id,

                    async : true,
                    
                    success : function(data) {
                        loadFamousTea();
                        
                    },
                    error : function(msg) {

                        alert(JSON.stringify(msg));
                    }
                });
            }
           
        }
        
        function login() {
            var reg = /^1[3|4|5|7|8][0-9]{9}$/;
            var phoneNum = $("#phoneNum").val();
            var flag = reg.test(phoneNum);
            if(flag){
                $.cookie('username',phoneNum);
                $('#loginModal').modal('hide');
            }else {
                
                $("#result").html("请输入正确的手机号");
                $("#result").css("color","red");
            }
        }
        

        // 获取排行榜
        function loadRank() {

            $.ajax({
                type : 'GET',

                url : 'http://localhost:8081/Tea/topEightFamousTea',

                async : true,

                success : function(data) {
                    getTime();
                    
                    
                       // 指定图表的配置项和数据
                    var option = {
                        title: {
                            text: '得票数'
                        },
                        tooltip: {// 鼠标放上展示的提示信息格式
                            trigger: 'item',
                            formatter: "{b}<br/>得票数 : {c}" // 设置茶叶名称
                        },
                        grid:{

                            　　x:80,

                            　　x2:10,

                            　　y2:20

                            },
                        
                        xAxis: {
                            type: 'value',
                        },
                        yAxis: {
                            type: 'category',
                            data: [data.data[7].name, data.data[6].name, data.data[5].name, data.data[4].name, data.data[3].name, data.data[2].name, data.data[1].name, data.data[0].name]
                        },
                        series: [{
                            type: 'bar',//==============使用得票数填充 data
                            data: [data.data[7].poll, data.data[6].poll, data.data[5].poll, data.data[4].poll, data.data[3].poll, data.data[2].poll, data.data[1].poll, data.data[0].poll],
                            itemStyle: {
                                normal: {
                                    color: function (param) {
                                        var colorList = [
                                            '#C1232B', '#B5C334', '#FCCE10', '#E87C25', '#27727B',
                                            '#FE8463', '#9BCA63'
                                        ];
                                        return colorList[param.dataIndex]
                                    }
                                }
                            }
                        
                        }]
                    };

                    // 使用指定的配置项和数据显示图表。
                    chart1.setOption(option);
                },
                
                error : function(msg) {

                    alert(JSON.stringify(msg));
                }
            });
                
            
         
        }
    </script>
</body>

</html>