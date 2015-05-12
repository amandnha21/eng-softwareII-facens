<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
        
        <link href="resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="resources/css/bootstrap-select.min.css" rel="stylesheet">    
        <!--
        <link href="resources/css/bootstrap-responsive.css" rel="stylesheet">
        <link href="resources/css/struct.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="resources/css/m-icons.css">

        <link rel="stylesheet" type="text/css" href="resources/css/my_bootstrap.css">
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-timepicker.min.css">
        <link rel="stylesheet" type="text/css" href="resources/css/datepicker.css">
        <link href="resources/css/table-sorter.css" rel="stylesheet"> 
        <link href="resources/css/tablesorter.pager.css" rel="stylesheet"> 
        <link href="resources/css/dataTables.bootstrap.css" rel="stylesheet"> 
        <link rel="stylesheet" type="text/css" href="resources/css/jquery.toastmessage.css">
        -->
    </head>
    <body onload="Message();">
        <script type="text/javascript" src="resources/js/menu.js"></script>
        <h1>Theme</h1>
        
        <form action="scenario/theme1" method="post">
            <div class="modal-body">
            <label>Title:</label> <input class="span5" type="text" name="title" /><br>
		<label>Description: </label><textarea  class="span8" name="description" cols="80" rows="5" maxlength="500"></textarea><br>
                <input class="btn btn-primary" type="submit" value="Salvar">
            </div>		
	</form>
    </body>
    
    <script src="resources/js/jquery-min.js"></script>
        <script src="resources/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="resources/js/jquery.dataTables.js"></script>   
        <script type="text/javascript" src="resources/js/jquery_plugin_date.js"></script>   
        <script type="text/javascript" src="resources/js/jquery.dataTables.bootstrap.js"></script>   
        <script src="resources/js/jquery.tablesorter.min.js" type="text/javascript"></script>
        <script src="resources/js/jquery.tablesorter.pager.js" type="text/javascript"></script> 
        <script src="resources/js/bootstrap-session-timeout.js" type="text/javascript"></script>
        <script src="resources/js/jquery.toastmessage.js"></script>
        <script>
        
        function Message()
            {

                if (${param.Message != null ? true : false})
                {
                    var msg = "${param.Message}";

                    window.history.pushState({msg: 'Message'}, 'Museum Object', 'list');
                    showMessageToast(msg, 5000);
                }

            }
            
            function showMessageToast(message, temp) {
                $().toastmessage('showToast', {
                    text: "" + message + "",
                    stayTime: temp,
                    position: 'middle-center',
                    type: 'notice'
                });
            }
            function closeMessage()
            {
                $("#divMessage").remove();
            }
        </script>
