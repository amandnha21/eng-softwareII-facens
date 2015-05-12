<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <title>Listing Scenarios</title>

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
        -->
        <link href="resources/css/dataTables.bootstrap.css" rel="stylesheet"> 
        <link rel="stylesheet" type="text/css" href="resources/css/jquery.toastmessage.css">
    </head>
    <body onload="Message();">
        <script type="text/javascript" src="resources/js/menu.js"></script>
        <div class="container">
            
            <div class="page-header">
                <h3>
                    Cenário
                    <button type="button" class="btn btn-success pull-right" data-toggle="modal" data-target="#modalScenario" data-action="museum/add">
                        <span class="glyphicon glyphicon-plus-sign"></span>
                        Novo
                    </button>
                </h3>
            </div>
            
            <table class="table tablesorter table-striped sortable table-hover">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Historical Time</th>
                        <th>Objects</th>
                        <th class="text-center col-sm-1">Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="scenario">
                        <tr>
                            <td><a href="scenario/edit?id=${scenario.getId()}">${scenario.getId()}</a></td>
                            <td>${scenario.getName()}</td>
                            <td>${scenario.getHistoricalTime().getTime()}</td>
                            <td>
                                <c:forEach items="${scenario.getObjects()}" var="obj">
                                    ${obj.getId()} - ${obj.getName()}
                                    <br />
                                </c:forEach>
                            </td>
                            <td title="Delete" class="text-center">
                                <button class="btn btn-danger btn-sm" onclick="MessageDelete('${scenario.getId()}');">
                                    <span class="glyphicon glyphicon-remove"></span>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>

    <!--Start Modal-->
    <div id="modalScenario" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">Cenário</h4>
                </div>

                <form action="scenario/adiciona" method="get">
                    <div class="modal-body">
                        <div class="form-group">
                            <label> Name: </label>
                            <input type="text" class="form-control" name="name" />
                        </div>
                        
                        <div class="form-group">
                            <label> Museum: </label>
                            <select class="form-control" id="drp_objects" name="idMuseum">
                                <c:forEach items="${objects}" var="obj">
                                    <option value="${obj.id}">${obj.id}- ${obj.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label> Theme: </label>
                            <select class="form-control" id="drp_objects1" name="idTheme">
                                <c:forEach items="${objects1}" var="objec">
                                    <option value="${objec.id}">${objec.id} - ${objec.title}</option>
                                </c:forEach>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label> Object: </label>
                            <div class="panel panel-default" style="max-height: 150px;overflow-y: scroll;">
                                <div class="panel-body" id="divCheckobject" style="padding:5px 15px;">
                                    <c:forEach items="${objects2}" var="objects2">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" name="tests" value="${objects2.id}"> 
                                                ${objects2.name}
                                            </label>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="modal-footer">
                        <button class="btn btn-primary" type="submit">Salvar</button>
                    </div>
                </form>
            </div>
        </div>
    </div> 

    <script src="resources/js/jquery-min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="resources/js/jquery.dataTables.js"></script>   
    <script type="text/javascript" src="resources/js/jquery_plugin_date.js"></script>   
    <script type="text/javascript" src="resources/js/jquery.dataTables.bootstrap.js"></script>   
    <script src="resources/js/jquery.tablesorter.min.js" type="text/javascript"></script>
    <script src="resources/js/jquery.tablesorter.pager.js" type="text/javascript"></script> 

    <script src="resources/js/jquery.toastmessage.js"></script>
    <script>
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

            function MessageDelete(Id)
            {
                var msg = 'Realmente deseja excluir?<br /> <br /><button id="sim" class="btn btn-small" onclick="Delete(' + Id + ');" >Sim</button>&nbsp;<button class="btn btn-small" onclick="closeMessage();">Não</button>';
                showMessageToast(msg, 15000);
            }
            function Delete(id) {


                window.location.href = "scenario/delete?id=" + id;

            }
            
            function Message()
            {

                if (${param.Message != null ? true : false})
                {
                    var msg = "${param.Message}";

                    window.history.pushState({msg: 'Message'}, 'Museum Object', 'list');
                    showMessageToast(msg, 5000);
                }

            }
        </script>