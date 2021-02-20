<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <script type="text/javascript" src="/crm/jquery/jquery-1.11.1-min.js"></script>
  <script src="/crm/jquery/echarts.min.js"></script>
  <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
  <div id="main" style="width: 800px;height:600px;margin: 50px auto"></div>
  <script>

      //发送异步请求查询数据
      $.post("/crm/workbench/transaction/echarts",function(data){

          // 基于准备好的dom，初始化echarts实例
          var myChart = echarts.init(document.getElementById('main'));
          option = {
              tooltip: {
                  trigger: 'item'
              },
              legend: {
                  top: '5%',
                  left: 'center',
                  data: data.titles
              },
              series: [
                  {
                      name: '访问来源',
                      type: 'pie',
                      radius: ['40%', '70%'],
                      avoidLabelOverlap: false,
                      label: {
                          show: false,
                          position: 'center'
                      },
                      emphasis: {
                          label: {
                              show: true,
                              fontSize: '40',
                              fontWeight: 'bold'
                          }
                      },
                      labelLine: {
                          show: false
                      },
                      data: data.maps
                  }
              ]
          };

          // 使用刚指定的配置项和数据显示图表。
          myChart.setOption(option);
      },"json");

  </script>
</body>
</html>
