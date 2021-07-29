<!DOCTYPE html>
<html>
<head>
	<title></title>
	<style>
		body{
			font-family: Calibri;
		}
		#insideselect{
			display: flex;
			align-items: center;
			justify-content: center;
		}
		.patienticon{
			height: 110px;
			width: 100px;
			margin-left:50px;
			margin-top: 10px;
			margin-bottom: 20px;
		}
		.adminicon{
			height: 120px;
			width: 120px;
			margin:10px;
		}
		#selectbox{
			text-align: center;
			height: 400px;
			width: 350px;
			background: rgba(255,255,255,0.7);
			position: absolute;
			top: 60%;
			left: 80%;
			transform: translate(-50%,-50%);
		}

	</style>
</head>
<body>


<div id="selectbox">
		<br>
		 <h1>Welcome to CovidCare.</h1> <h2> Select who you are below: </h2> <br>
	<div id="insideselect">
		<div class="avatar">
      <a href="http://localhost/dbms%20project/adminlogin.php">
         <img class="adminicon" src="https://www.flaticon.com/svg/static/icons/svg/2206/2206368.svg">
      </a>
         </div>
         <div class="avatar">
      <a href="http://localhost/dbms%20project/login.php">
         <img class="patienticon" src="https://cdn2.iconfinder.com/data/icons/covid-19-1/64/21-Measure_the_fever-512.png">
      </a> 
      	  </div>
      </div>
      <h3> Admin &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Patient </h3>
      </div>

</body>
</html>