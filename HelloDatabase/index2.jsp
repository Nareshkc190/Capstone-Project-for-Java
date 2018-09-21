
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello SQl JSP</title>
</head>
<h1>Hello local database (SQL and RESTful)</h1>
<script>
	function showFields(s)

	{
		var xRequest1;

		if (window.XMLHttpRequest)
		{
			xRequest1 = new XMLHttpRequest();
		}
		else
		{
			xRequest1 = new ActiveXObject("Microsoft.XMLHTTP");
		}

		xRequest1.onreadystatechange = function()

		{
			if ((xRequest1.readyState == 4) && (xRequest1.status == 200))
			{
				document.getElementById("Show_update").innerHTML = xRequest1.responseText;
			}
		}
		
		//Begin code by Xander He
		var values = [], uri = "empdetails.jsp"
		for (var i = 0, ids = ["fname", "emp_id"]; i < ids.length; i++)
			if (window[ids[i]].value.trim() != "") values[ids[i]] = window[ids[i]].value.trim()
		if (Object.keys(values).length) {
			uri += "?"
			Object.keys(values).forEach((key)=>uri+=key+"="+encodeURIComponent(values[key])+"&")
		}
		if(s=="Retrieve"){
			uri+="Retrieve=yes&Save=no&showALL=no";
		}
		else if(s=="Save"){
			uri+="Save=yes&Retrieve=no&showALL=no";
		}
		else if(s=="showALL"){
			uri+="Save=no&Retrieve=no&showALL=yes";
		}
		
		uri = uri.replace(/&$/, '')
		//end code by Xander He
		xRequest1.open("get", uri, "true");
		
		xRequest1.send();
	}
	
	
		   
		
</script>

<body>
	<form action="empdetails.jsp">
		First Name: <input id="fname" value="name" type="text" name="fname">
		<br> Enter ID: <input id="emp_id" type="text" name="emp_id">
		<br>
		<!--  <input type="submit" value="Submit">-->
		<input id="getValue" type="button" value="Retrieve" name="Retrieve"
			onclick='showFields("Retrieve")'> <input id="setValue"
			type="button" value="Save" name="Save" onclick='showFields("Save")'>
		<input type="button" value="showAll" name="showAll"
			onclick='showFields("showALL")'>


	</form>

	<br />

	<div id="Show_update">To Update the designation...</div>
</body>
</html>