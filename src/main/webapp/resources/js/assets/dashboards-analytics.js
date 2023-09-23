/**
 * Dashboard Analytics
 */

'use strict';

(function () {
  let cardColor, headingColor, axisColor, shadeColor, borderColor;

  cardColor = config.colors.white;
  headingColor = config.colors.headingColor;
  axisColor = config.colors.axisColor;
  borderColor = config.colors.borderColor;

  // Total Revenue Report Chart - Bar Chart
  // --------------------------------------------------------------------
  var current = [0,0,0,0,0,0,0,0,0,0,0,0];
  var pre = [0,0,0,0,0,0,0,0,0,0,0,0];

  $.ajax({
    		type: "GET",
    		url: "join_count",
    		contentType: 'application/json',
    		dataType: 'json',
    		async: false,
    		success: function(data, status){
    			console.log("success-----joincount");
    			console.log(data);

    			// console.log(data.cntW);
         
          for(var i in data){
        	  console.log(data[i]);
            var count=data[i].count;
            var month = data[i].months;
            console.log(month);

    
            switch(month){
              case "2023-01": current[3] = count; break;
              case "2023-02": current[4] = count; break;
              case "2023-03": current[5] = count; break;
              case "2023-04": current[6] = count; break;
              case "2023-05": current[7] = count; break;
              case "2023-06": current[8] = count; break;
              case "2023-07": current[9] = count; break;
              case "2023-08": current[10] = count; break;
              case "2023-09": current[11] = count; break;
              case "2022-10": pre[0] = count; break;
              case "2022-11": pre[1] = count; break;
              case "2022-12": pre[2] = count; break;


            }
            

          }
        

    		}
    	}); 



  const totalRevenueChartEl = document.querySelector('#totalRevenueChart'),
    totalRevenueChartOptions = {
      series: [
        {
          name: '2023',
          data: current
        },
        {
          name: '2022',
          data: pre
        }
      ],
      chart: {
        height: 300,
        stacked: true,
        type: 'bar',
        toolbar: { show: false }
      },
      plotOptions: {
        bar: {
          horizontal: false,
          columnWidth: '33%',
          borderRadius: 12,
          startingShape: 'rounded',
          endingShape: 'rounded'
        }
      },
      colors: [config.colors.primary, config.colors.info],
      dataLabels: {
        enabled: false
      },
      stroke: {
        curve: 'smooth',
        width: 6,
        lineCap: 'round',
        colors: [cardColor]
      },
      legend: {
        show: true,
        horizontalAlign: 'left',
        position: 'top',
        markers: {
          height: 8,
          width: 8,
          radius: 12,
          offsetX: -3
        },
        labels: {
          colors: axisColor
        },
        itemMargin: {
          horizontal: 10
        }
      },
      grid: {
        borderColor: borderColor,
        padding: {
          top: 0,
          bottom: -8,
          left: 20,
          right: 20
        }
      },
      xaxis: {
        categories: ['Oct','Nov','Dec','Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'],
        labels: {
          style: {
            fontSize: '13px',
            colors: axisColor
          }
        },
        axisTicks: {
          show: false
        },
        axisBorder: {
          show: false
        }
      },
      yaxis: {
        labels: {
          style: {
            fontSize: '13px',
            colors: axisColor
          }
        }
      },
      responsive: [
        {
          breakpoint: 1700,
          options: {
            plotOptions: {
              bar: {
                borderRadius: 10,
                columnWidth: '32%'
              }
            }
          }
        },
        {
          breakpoint: 1580,
          options: {
            plotOptions: {
              bar: {
                borderRadius: 10,
                columnWidth: '35%'
              }
            }
          }
        },
        {
          breakpoint: 1440,
          options: {
            plotOptions: {
              bar: {
                borderRadius: 10,
                columnWidth: '42%'
              }
            }
          }
        },
        {
          breakpoint: 1300,
          options: {
            plotOptions: {
              bar: {
                borderRadius: 10,
                columnWidth: '48%'
              }
            }
          }
        },
        {
          breakpoint: 1200,
          options: {
            plotOptions: {
              bar: {
                borderRadius: 10,
                columnWidth: '40%'
              }
            }
          }
        },
        {
          breakpoint: 1040,
          options: {
            plotOptions: {
              bar: {
                borderRadius: 11,
                columnWidth: '48%'
              }
            }
          }
        },
        {
          breakpoint: 991,
          options: {
            plotOptions: {
              bar: {
                borderRadius: 10,
                columnWidth: '30%'
              }
            }
          }
        },
        {
          breakpoint: 840,
          options: {
            plotOptions: {
              bar: {
                borderRadius: 10,
                columnWidth: '35%'
              }
            }
          }
        },
        {
          breakpoint: 768,
          options: {
            plotOptions: {
              bar: {
                borderRadius: 10,
                columnWidth: '28%'
              }
            }
          }
        },
        {
          breakpoint: 640,
          options: {
            plotOptions: {
              bar: {
                borderRadius: 10,
                columnWidth: '32%'
              }
            }
          }
        },
        {
          breakpoint: 576,
          options: {
            plotOptions: {
              bar: {
                borderRadius: 10,
                columnWidth: '37%'
              }
            }
          }
        },
        {
          breakpoint: 480,
          options: {
            plotOptions: {
              bar: {
                borderRadius: 10,
                columnWidth: '45%'
              }
            }
          }
        },
        {
          breakpoint: 420,
          options: {
            plotOptions: {
              bar: {
                borderRadius: 10,
                columnWidth: '52%'
              }
            }
          }
        },
        {
          breakpoint: 380,
          options: {
            plotOptions: {
              bar: {
                borderRadius: 10,
                columnWidth: '60%'
              }
            }
          }
        }
      ],
      states: {
        hover: {
          filter: {
            type: 'none'
          }
        },
        active: {
          filter: {
            type: 'none'
          }
        }
      }
    };
  if (typeof totalRevenueChartEl !== undefined && totalRevenueChartEl !== null) {
    const totalRevenueChart = new ApexCharts(totalRevenueChartEl, totalRevenueChartOptions);
    totalRevenueChart.render();
  }



  // Order Statistics Chart
  // --------------------------------------------------------------------
  var cntBoard=[0,0,0,0];
  var cntReply=[0,0,0,0];
  $.ajax({
    		type: "GET",
    		url: "week_count",
    		contentType: 'application/json',
    		dataType: 'json',
    		async: false,
    		success: function(data, status){
    			//console.log("success");
    			console.log(data);
         
          for(var ii in data.cntW){
        	  //console.log(data.cntW[ii].cat_name);
            var count=data.cntW[ii].cntWeek;
            switch(data.cntW[ii].cat_name){
              case "커뮤니티": cntBoard[0] = count; $('.comCnt').html(count); break;
              case "QnA": cntBoard[1] = count; $('.qnaCnt').html(count); break;
              case "모임": cntBoard[2] = count; $('.meetCnt').html(count); break;
              case "프리랜서": cntBoard[3] = count; $('.freeCnt').html(count); break;
              case "합계": $('.cntBoard').html(count); break;
              return cntBoard;
            }
          }
          //console.log("cntBoard : "+cntBoard);
          for (var i in data.cntR) {
            //console.log(data.cntR[i].cat_name);
            var countR = data.cntR[i].replyWeek;
            //console.log("-----------------");
            //console.log(countR);
            switch (data.cntR[i].cat_name) {
              case "커뮤니티": cntReply[0] = countR; $('.comCntR').html(countR); break;
              case "QnA": cntReply[1] = countR; $('.qnaCntR').html(countR); break;
              case "모임": cntReply[2] = countR; $('.meetCntR').html(countR); break;
              case "프리랜서": cntReply[3] = countR; $('.freeCntR').html(countR); break;
              case "합계": $('.cntReply').html(countR); break;
              return cntReply;
            }
          }
          //console.log("cntReply");
          //console.log(cntReply);    

    		}
    	}); 
  const chartOrderStatistics = document.querySelector('#cntWeekBoard'),
    orderChartConfig = {
      chart: {
        height: 165,
        width: 130,
        type: 'donut'
      },
      labels: ['커뮤니티', 'QnA', '마켓', '모임', '프리랜서'],
      series: cntBoard,
      colors: [config.colors.primary, config.colors.success, axisColor, config.colors.info,  config.colors.secondary],
      stroke: {
        width: 5,
        colors: cardColor
      },
      dataLabels: {
        enabled: false,
        formatter: function (val, opt) {
          return parseInt(val) + '%';
        }
      },
      legend: {
        show: false
      },
      grid: {
        padding: {
          top: 0,
          bottom: 0,
          right: 15
        }
      },
      plotOptions: {
        pie: {
          donut: {
            size: '75%',
            labels: {
              show: true,
              value: {
                fontSize: '1.5rem',
                fontFamily: 'Public Sans',
                color: headingColor,
                offsetY: -15,
                formatter: function (val) {
                  return parseInt(val) + '%';
                }
              },
              name: {
                offsetY: 20,
                fontFamily: 'Public Sans'
              },
              total: {
                show: true,
                fontSize: '0.8125rem',
                color: axisColor,
                label: 'Monthly',
                formatter: function (w) {
                  return '28%';
                }
              }
            }
          }
        }
      }
    };
  if (typeof chartOrderStatistics !== undefined && chartOrderStatistics !== null) {
    const statisticsChart = new ApexCharts(chartOrderStatistics, orderChartConfig);
    statisticsChart.render();
  }

  //--------------------
  const chartOrderStatistics2 = document.querySelector('#cntWeekReply'),
    orderChartConfig2 = {
      chart: {
        height: 165,
        width: 130,
        type: 'donut'
      },
      labels: ['커뮤니티', 'QnA','마켓', '모임', '프리랜서'],
      series: cntReply,
      colors: [config.colors.primary, config.colors.success, axisColor, config.colors.info,  config.colors.secondary],
      stroke: {
        width: 5,
        colors: cardColor
      },
      dataLabels: {
        enabled: false,
        formatter: function (val, opt) {
          return parseInt(val) + '%';
        }
      },
      legend: {
        show: false
      },
      grid: {
        padding: {
          top: 0,
          bottom: 0,
          right: 15
        }
      },
      plotOptions: {
        pie: {
          donut: {
            size: '75%',
            labels: {
              show: true,
              value: {
                fontSize: '1.5rem',
                fontFamily: 'Public Sans',
                color: headingColor,
                offsetY: -15,
                formatter: function (val) {
                  return parseInt(val) + '%';
                }
              },
              name: {
                offsetY: 20,
                fontFamily: 'Public Sans'
              },
              total: {
                show: true,
                fontSize: '0.8125rem',
                color: axisColor,
                label: 'Monthly',
                formatter: function (w) {
                  return '31%';
                }
              }
            }
          }
        }
      }
    };
  if (typeof chartOrderStatistics2 !== undefined && chartOrderStatistics2 !== null) {
    const statisticsChart2 = new ApexCharts(chartOrderStatistics2, orderChartConfig2);
    statisticsChart2.render();
  }

})();
