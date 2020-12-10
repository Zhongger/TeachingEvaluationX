<template>
  <div class="app-container">
    <el-row>
      <el-col :span="24" class="card-box">
        <el-card>
          <div slot="header"><span>教评权重统计</span></div>
          <div class="el-table el-table--enable-row-hover el-table--medium">
            <div ref="commandstats" style="height: 620px"/>
          </div>
        </el-card>
      </el-col>

    </el-row>
    <el-row>
      <el-col :span="24" class="card-box">
        <el-card>
          <div slot="header"><span>各科教评统计</span></div>
          <div class="el-table el-table--enable-row-hover el-table--medium">
            <div ref="commandstats2" style="height: 620px"/>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import {getEvaluationContentResultAnalysis, getEvaluationSummary, getEvaluationSumList} from "@/api/teacher/teacher";
  import echarts from "echarts";

  export default {
    name: "Server",
    data() {
      return {
        // 加载层信息
        loading: [],
        // 统计命令信息
        commandstats: null,
        commandstats2: null,
        // 使用内存
        usedmemory: null,
        // cache信息
        cache: [],
      };
    },
    created() {
      this.getList();
      this.getList2();
      this.openLoading();
    },
    methods: {

      getList() {
        getEvaluationContentResultAnalysis().then((response) => {
          this.cache = response;
          this.loading.close();
          this.commandstats = echarts.init(this.$refs.commandstats, "macarons");
          this.commandstats.setOption({
            title: {
              text: '教评各项权重占比图',
              subtext: '权重数据',
              left: 'center'
            },
            tooltip: {
              trigger: 'item',
              formatter: '{a} <br/>{b} ({d}%)'
            },
            legend: {
              // orient: 'vertical',
              // top: 'middle',
              bottom: 10,
              left: 'center',
              data: response.name
            },
            series: [
              {
                name: "评价项目",
                type: "pie",

                radius: '65%',
                center: ['50%', '50%'],
                data: response,
                emphasis: {
                  itemStyle: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                  }
                },
                animationEasing: "cubicInOut",
                animationDuration: 1000,
              },
            ],
          });
        });
      },

      getList2() {
        let xAxisData = []
        let xAxisValue = []
        let evaluationSumList = []
        let evaluationIds = []
        getEvaluationSumList().then(response => {
          xAxisData = response
          for (let i = 0; i < xAxisData.length; i++) {
            xAxisValue[i] = xAxisData[i].content.split("：")[0];
            evaluationIds[i] = xAxisData[i].evaluationMetaId;
          }
          for (let i = 0; i < xAxisData.length; i++) {
            evaluationSumList[i] = xAxisData[i].grade;
          }


        });
        getEvaluationSummary().then((response) => {
          let res = response
          let resArr = []
          let series = []
          for (let resKey in res) {
            resArr.push(res[resKey])
          }

          let data = []
          for (let i = 0; i < evaluationIds.length; i++) {
            let evaluationId = evaluationIds[i];
            for (let j = 0; j < resArr.length; j++) {
              if (evaluationId == resArr[j].evaluationMetaId) {
                data.push({
                  id: resArr[j].evaluationMetaId,
                  name: resArr[j].courseName,
                  grade: resArr[j].grade
                })
              }
            }
          }
          let map={}
          data.forEach(item=>{
            let key = item.name;
            let gradeArr = [];
            for (let i = 0; i < data.length; i++) {
              if (key===data[i].name){
                gradeArr.push(data[i].grade)
              }
            }
            map[key]=gradeArr
          })
          let legendData = []
          for (let mapKey in map) {
            legendData.push(mapKey)
            series.push({
              name: mapKey,
              type: 'bar',
              data: map[mapKey]
            })
          }




          this.loading.close();
          this.commandstats2 = echarts.init(this.$refs.commandstats2, "macarons2");
          series.push({
            name: '单项总得分',
            type: 'line',
            yAxisIndex: 1,
            data: evaluationSumList
          })
          this.commandstats2.setOption({

            tooltip: {
              trigger: 'axis',
              axisPointer: {
                type: 'cross',
                crossStyle: {
                  color: '#999'
                }
              }
            },
            toolbox: {
              feature: {
                dataView: {show: true, readOnly: false},
                magicType: {show: true, type: ['line', 'bar']},
                restore: {show: true},
                saveAsImage: {show: true}
              }
            },
            legend: {
              data:legendData
            },
            xAxis: [
              {
                type: 'category',
                data: xAxisValue,
                axisPointer: {
                  type: 'shadow'
                }
              }
            ],
            yAxis: [
              {
                type: 'value',
                name: '分数',
                min: 0,

                interval: 20,
                axisLabel: {
                  formatter: '{value} 分'
                }
              },
              {
                type: 'value',
                name: '分数',
                min: 0,

                interval: 20,
                axisLabel: {
                  formatter: '{value} 分'
                }
              }
            ],
            series: series

          })
        })
      },
      // 打开加载层
      openLoading() {
        this.loading = this.$loading({
          lock: true,
          text: "拼命读取中",
          spinner: "el-icon-loading",
          background: "rgba(0, 0, 0, 0.7)",
        });
      },
    },
  };
</script>
