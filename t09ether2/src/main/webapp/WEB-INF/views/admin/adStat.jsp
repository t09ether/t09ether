<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#usermain{
		margin:10px;
		margin-left:250px;
	}

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.3.0/chart.min.js"></script>
<div id="usermain" class="row">
	<section id="main" class="container">
		<header>
			<p></p>
			<h2>통계</h2>
			<p></p>
		</header>
		<div class="row">        
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-area me-1"></i>
                        월별 가입자
                    </div>
                    <div class="card-body"><canvas id="regiChart"></canvas></div>
                </div>
            </div>
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-bar me-1"></i>
                        월별 온라인 공동구매 거래량
                    </div>
                    <div class="card-body"><canvas id="onlineChart"></canvas></div>
                </div>
            </div>
         </div>
            <div class="row">
                <div class="col-xl-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-area me-1"></i>
                            월별 오프라인 공동구매 거래량
                        </div>
                        <div class="card-body"><canvas id="offlineChart"></canvas></div>
                    </div>
                </div>
                <%-- <div class="col-xl-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-bar me-1"></i>
                            온라인 상품별 거래량
                        </div>
                        <div class="card-body"><canvas id="onPopChart"></canvas></div>
                    </div>
                </div> --%>
            </div>

	</section>

</div>

<script>
	function colorize() {
		var r = Math.floor(Math.random()*200);
		var g = Math.floor(Math.random()*200);
		var b = Math.floor(Math.random()*200);
		var color = 'rgba(' + r + ', ' + g + ', ' + b + ', 0.7)';
		return color;
	}		
	
	//통계
	//월별 가입자
	var labelList = new Array();
	var valueList = new Array();
	var colorList = new Array();
	
	var jsonData = ${json}
	var jsonObject = JSON.stringify(jsonData);
	var jData = JSON.parse(jsonObject);	
	
	for(var i = 0; i<jData.length; i++) {
		var d = jData[i];
		labelList.push(d.Month);
		valueList.push(d.Count);
		//colorList.push(colorize());
	}
		
	var data = {
				labels: labelList,
				datasets: [{
						data : valueList,
						/* backgroundColor: colorList, */
						label: '월별 가입자 수',
						fill:false,
						borderColor:'rgb(75, 192, 192)',
						tension:0.1 
						
						
				}],
				options : {
						title : {
						display : true,
						text: '월별 가입자 수'
						}
				}
	};
			
	var ctx1 = document.getElementById('regiChart').getContext('2d');
	new Chart(ctx1, {
		      type: 'line',
			  data: data
	});
	
	
	//월별 온라인 공구 거래량
	var labelList1 = new Array();
	var valueList1 = new Array();
	var colorList1 = new Array();
	
	var jsonData1 = ${onlineJson}
	var jsonObject1 = JSON.stringify(jsonData1);
	var jData1 = JSON.parse(jsonObject1);	
	
	for(var i = 0; i<jData1.length; i++) {
		var e = jData1[i];
		labelList1.push(e.Month);
		valueList1.push(e.Count);
		//colorList.push(colorize());
	}
		
	var data = {
				labels: labelList1,
				datasets: [{
						data : valueList1,
						/* backgroundColor: colorList, */
						label: '월별 온라인 공동구매 거래량',
						fill:false,
						borderColor:'rgb(75, 102, 152)',
						tension:0.1 
						
						
				}],
				options : {
						title : {
						display : true,
						text: '월별 온라인 공동구매 거래량'
						}
				}
	};
			
	var ctx1 = document.getElementById('onlineChart').getContext('2d');
	new Chart(ctx1, {
		      type: 'line',
			  data: data
	});
	
	//월별 오프라인 공구 거래량
	var labelList2 = new Array();
	var valueList2 = new Array();
	var colorList2 = new Array();
	
	var jsonData2 = ${offlineJson}
	var jsonObject2 = JSON.stringify(jsonData2);
	var jData2 = JSON.parse(jsonObject2);	
	
	for(var i = 0; i<jData2.length; i++) {
		var f = jData2[i];
		labelList2.push(f.Month);
		valueList2.push(f.Count);
		//colorList.push(colorize());
	}
		
	var data = {
				labels: labelList2,
				datasets: [{
						data : valueList2,
						/* backgroundColor: colorList, */
						label: '월별 오프라인 공동구매 거래량',
						fill:false,
						borderColor:'rgb(138, 74, 88)',
						tension:0.1 
						
						
				}],
				options : {
						title : {
						display : true,
						text: '월별 오프라인 공동구매 거래량'
						}
				}
	};
			
	var ctx1 = document.getElementById('offlineChart').getContext('2d');
	new Chart(ctx1, {
		      type: 'line',
			  data: data
	});
	
	//온라인 인기 상품
	var labelList3 = new Array();
	var valueList3 = new Array();
	var colorList3 = new Array();
	
	var jsonData3 = ${onPopJson}
	var jsonObject3 = JSON.stringify(jsonData3);
	var jData3 = JSON.parse(jsonObject3);	
	
	for(var i = 0; i<jData3.length; i++) {
		var g = jData3[i];
		labelList3.push(g.Pro_name);
		valueList3.push(g.Count);
		colorList3.push(colorize());
	}
		
	var data = {
				labels: labelList3,
				datasets: [{
						data : valueList3,
						backgroundColor: colorList3/*,
						label: '온라인 상품별 거래량',
						fill:false,
						borderColor:'rgb(138, 74, 88)',
						tension:0.1  */	
				}],
				options : {
						title : {
						display : true,
						text: '온라인 상품별 거래량'
						}
				}
	};
			
	/* var ctx1 = document.getElementById('onPopChart').getContext('2d');
	new Chart(ctx1, {
		      type: 'doughnut',
			  data: data
	}); */
	
</script>


