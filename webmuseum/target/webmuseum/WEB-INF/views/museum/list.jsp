<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
    
        <link href="resources/css/bootstrap.min.css" rel="stylesheet">
        <!--
        <link href="resources/css/bootstrap-select.min.css" rel="stylesheet">    

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
                    Museum
                    <button type="button" class="btn btn-success pull-right" data-toggle="modal" data-target="#modalMuseum" data-action="museum/add">
                        <span class="glyphicon glyphicon-plus-sign"></span>
                        New
                    </button>
                </h3>
            </div>
            
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th class="col-xs-1"></th>
                        <th class="col-xs-1">Id</th>
                        <th>Name</th>
                        <th>Scenarios</th>
                        <th class="text-center col-xs-1">Edit</th>
                        <th class="text-center col-xs-1">Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="museum">
			<tr data-cod="${museum.getId()}" data-name="${museum.getName()}">
                            <td title="Entrar">
                                <a href="navigation?id=${museum.getId()}">
                                    <span class="glyphicon glyphicon-log-in"></span>
                                </a>
                            </td>
                            <td>${museum.getId()}</td>
                            <td>${museum.getName()}</td>
                            <td>
                                <c:forEach items="${museum.getScenarios()}" var="sce">
                                    ${sce.getId()} - ${sce.getName()}<br />
                                </c:forEach>
                            </td>
                            <td class="text-center">
                                <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modalMuseum" data-action="museum/edit">
                                    <span class="glyphicon glyphicon-edit"></span>
                                </button>
                            </td>
                            <td class="text-center">
                                <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#modalDelete">
                                    <span class="glyphicon glyphicon-remove"></span>
                                </button>
                            </td>
			</tr>
                    </c:forEach>
                </tbody>
            </table>
            
        </div>

        <!--Start Modal -->
        <div id="modalMuseum" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Museum Creation</h4>
                    </div>
            
                    <form id="form-museum" action="museum/add" method="post" onSubmit="">
                        <input type="hidden" id="objectId" name="id" value="0"/>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Name:</label> 
                                <input class="form-control" type="text" name="name" id="name"/>
                            </div>
                        </div>                        
                        <div class="modal-footer">
                            <button class="btn btn-primary" type="submit">Salvar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div> 
        <!--End Modal-->
        
        <!--Start Modal Delete-->
        <div id="modalDelete" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Museum Delete</h4>
                    </div>
            
                    <form action="museum/delete" method="post">
                        <input type="hidden" name="id" value="0"/>
                        <div class="modal-body">
                            <div class="jumbotron">
                                <table width="100%">
                                    <tr>
                                        <td class="text-center">
                                            <h1><span class="glyphicon glyphicon-warning-sign" style="color:#f0ad4e;"></span></h1>
                                        </td>
                                        <td>
                                            <h4>Realmente deseja deletar Museum <b><span class="museum-name"></span></b>?</h4>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>                        
                        <div class="modal-footer">
                            <button class="btn btn-default" type="button" data-dismiss="modal">Não</button>
                            <button class="btn btn-primary" type="submit">Sim</button>
                        </div>
                    </form>
                </div>
            </div>
        </div> 
        <!--End Modal-->
        
        <script src="resources/js/jquery-min.js"></script>
        <script src="resources/js/bootstrap.js"></script>
        <script type="text/javascript" src="resources/js/jquery.dataTables.js"></script>   
        <script type="text/javascript" src="resources/js/jquery_plugin_date.js"></script>   
        <script type="text/javascript" src="resources/js/jquery.dataTables.bootstrap.js"></script>   
        <script src="resources/js/jquery.tablesorter.min.js" type="text/javascript"></script>
        <script src="resources/js/jquery.tablesorter.pager.js" type="text/javascript"></script> 
        
        <script src="resources/js/jquery.toastmessage.js"></script>
        <script>
        $(document).ready(function() {
            oTable = $('#tbobject').dataTable({
                "bPaginate": true,
                "bJQueryUI": true,
                "bLengthChange": false,
                "oLanguage": {
                    "sProcessing": "Processando...",
                    "sLengthMenu": "Mostrar _MENU_ registros",
                    "sZeroRecords": "Não foram encontrados resultados",
                    "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                    "sInfoEmpty": "Mostrando de 0 até 0 de 0 registros",
                    "sInfoFiltered": "",
                    "sInfoPostFix": "",
                    "sSearch": "Buscar:",
                    "sUrl": "",
                    "oPaginate": {
                        "sFirst": "Primeiro",
                        "sPrevious": " ",
                        "sNext": " ",
                        "sLast": "Último"
                    }
                }
            });
            
            $("#form-museum").submit(function(event){
                if ($.trim($("input[type=text]",this).val()) === "") {
                    alert("Name deve ser preencido!");
                    return false;
                }
            });
            
            $('#modalMuseum').on('show.bs.modal',function(event){
                var action = $(event.relatedTarget).data('action');
                var modal = $(this);
                
                modal.find('form').attr('action',action);
                modal.find('form input').val('');
                modal.find('.modal-title').html('Museum Creation');
                
                if (action === "museum/edit") {
                    modal.find('.modal-title').html('Museum Edit');
                    
                    var museum = $(event.relatedTarget).parent().parent();
                    modal.find('form input[name=id]').val(museum.data('cod'));
                    modal.find('form input[name=name]').val(museum.data('name'));
                }
            });
            
            
            $('#modalDelete').on('show.bs.modal',function(event){
                var museum = $(event.relatedTarget).parent().parent();
                var modal = $(this);
                modal.find('form input[name=id]').val(museum.data('cod'));
                modal.find('.museum-name').html(museum.data('name'));
            });
        });
        
        function showMessageToast(message, temp) {
            $().toastmessage('showToast', {
                text: "" + message + "",
                stayTime: temp,
                position: 'middle-center',
                type: 'notice'
            });
        }

        function Message()
        {
            if (${param.Message != null ? true : false})
            {
                var msg = "${param.Message}";

                window.history.pushState({msg: 'Message'}, 'Museum Object', 'museum');
                showMessageToast(msg, 5000);
            }
        }
        </script>
        
    </body>
</html>