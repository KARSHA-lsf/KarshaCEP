<%@page import="com.lsf.entity.StockDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.lsf.cep.graph_predata"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>KarshaCEP</title>
<link rel="icon" href="../../favicon.ico">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/navbar.css" rel="stylesheet">
<link href="css/c3.css" rel="stylesheet">
</head>

<% graph_predata grp = new graph_predata();
   List<StockDetails> stk_data = grp.stock_details();
%>
<body>
	<div class="container">
		<!-- Static navbar -->
		<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Karsha-CEP</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="index.jsp">Home</a></li>
					<li><a href="PRC_analysis.jsp">PRC</a></li>
					<li><a href="#">About</a></li>
				</ul>
			</div>
		</div>
		</nav>
		<div class="container">
			<h2>Price Analysis</h2>
			<p>
				NAICS 52 : <b>Finance and Industry</b> , stock prices changes of
				major 10 equities [Market Capitalization].
			</p>
			<ul class="nav nav-tabs">
			<% for(int i=0;i<stk_data.size();i++){ 
				String id = "\"m"+(i+1)+"\"";
				String permno  = "\"#"+stk_data.get(i).getTsymbol()+stk_data.get(i).getPermno()+"\"";
			%>			
				<li id=<%=id %>><a href=<%=permno %>><b><%=stk_data.get(i).getTsymbol()%></b>:<%=stk_data.get(i).getPermno()%></a></li>
			<%}; %>
			</ul>
			<div class="tab-content">
			<%for(int i=0;i<stk_data.size();i++){ %>
				<div id="<%=stk_data.get(i).getTsymbol()%><%=stk_data.get(i).getPermno()%>" class="tab-pane fade">
					<div style="border-style: groove;">
						<h4><center>PERMNO : <%=stk_data.get(i).getPermno()%> - <%=stk_data.get(i).getComnam()%> : <%=stk_data.get(i).getTsymbol()%></center></h4>
						<div id="<%=stk_data.get(i).getTsymbol() %>"></div>
					</div>
				</div>
			<%}; %>
			
			
			</div>
					<script src="js/jquery.min.js"></script>
					<script>
						window.jQuery
								|| document
										.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')
					</script>
					<script src="js/bootstrap.min.js"></script>
					<script src="js/d3.min.js"></script>
   					<script src="js/c3.js"></script>
					<script type="text/javascript" src="js/graph/stockPrice_grp.js"></script>
					<script type="text/javascript">
						<%for(int i=1;i<stk_data.size();i++){%>
							$("#m<%=(i+1)%>").click(function(){
								StockPRC_graph(<%=stk_data.get(i).getPermno()%>, '#<%=stk_data.get(i).getTsymbol()%>');
							});
					 	<%};%>
					</script>
					<script>
						$(document).ready(function() {
							$(".nav-tabs a").click(function() {
								$(this).tab('show');
							});
							$( "#m1" ).last().addClass( "active" );
							$( "#<%=stk_data.get(0).getTsymbol()%><%=stk_data.get(0).getPermno()%>" ).last().addClass( "tab-pane fade in active" );
							StockPRC_graph(<%=stk_data.get(0).getPermno()%>, '#<%=stk_data.get(0).getTsymbol()%>');
						});
					</script>
</body>
</html>