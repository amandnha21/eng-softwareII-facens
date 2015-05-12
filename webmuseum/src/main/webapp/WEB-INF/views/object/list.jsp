<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
        <title>Listing Objects</title>

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
        <style>

            .dataTables_paginate, .dataTables_filter{
                text-align: right;
            }
        </style>
        
        <style>

            @media (max-width: 700px) {
                .table {
                    border: 0;
                    border-bottom-style: solid;
                    border-bottom-width: 0.0625em;
                    padding-bottom: 1.4375em;
                    padding-bottom: 0;
                    display: block;
                    width: 100%;
                }
                .table thead {
                    display: none;
                    visibility: hidden;
                }
                .table tbody, table tr, table td {
                    border: 0;
                    display: block;
                    padding: 0;
                    text-align: left;
                    white-space: normal;
                }
                .table tr {
                    margin-bottom: 1.5em;
                    position:relative
                }
                .table td[data-title]:before {
                    content: attr(data-title) ":\00A0";
                    font-weight: bold;
                }		  
                .table td:empty {display: none}

                /* Configurações Adicionais */
                .table td[title="Id"] { text-align:left }
                .table td[title="Id"]:before { content: "Id\00A0"; font-weight:bold } 

                /* Configurações Adicionais */
                .table td[title="Name"] { text-align:left }
                .table td[title="Name"]:before { content: "Name\00A0"; font-weight:bold } 

                /* Configurações Adicionais */
                .table td[title="Date"] { text-align:left }
                .table td[title="Date"]:before { content: "Date\00A0"; font-weight:bold } 

                


               
                .table .tr {position:relative}
                .table tr {border:#fff thin solid; border-bottom:1px solid #8dc63f; opacity:0.8}
                .table tr:hover {border: #8dc63f thin solid;opacity:1}
                .table td[title="Delete"] {position:absolute; top:0; right:0}

            }
        </style>

</head>
<body onload="Message();">
    <script type="text/javascript" src="resources/js/menu.js"></script>
    
    <div class="container">
        

        <div class="page-header">
            <h3>
                Objeto Museu
                <button type="button" class="btn btn-success pull-right" data-toggle="modal" data-target="#modalObjectMuseum" data-action="museum/add">
                    <span class="glyphicon glyphicon-plus-sign"></span>
                    Novo
                </button>
            </h3>
        </div>
        
        <!--
        <h4 class="horizontal-divider">
                    <br>
                    Objeto Museu  
                    <a href="#modalObjectMuseum" role="button" class="btn btn-mini btn-success required-inserir" data-toggle="modal"><i class="icon-white icon-plus"></i></a></h4>
        -->
        
        <table id="tbobject" class="table tablesorter table-striped sortable table-hover"> 
            <thead>
		<tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Date</th>
                    <th class="text-center col-sm-1">Edit</th>
                    <th class="text-center col-sm-1">Delete</th>
		</tr>
            </thead>
            <tbody>
		<c:forEach items="${list}" var="object">
                    <fmt:formatDate value="${object.getDate().getTime()}" pattern="yyyy-MM-dd" var="dataFormatada" />
                    <fmt:formatDate value="${object.getDate().getTime()}" pattern="dd/MM/yyyy" var="dataFormatada2" />
                    <tr>
                        <td title="Id">${object.getId()}</td>
                        <td title="Name">${object.getName()}</td>
                        <td title="Date">${dataFormatada2}</td>
                        <td title="Alterar" class="text-center">
                            <button class="btn btn-primary btn-sm" onclick="alterar('${object.getId()}', '${object.getName()}', '${dataFormatada}');">
                                <span class="glyphicon glyphicon-edit"></span>
                            </button>
                        </td>
                        <td title="Delete" class="text-center">
                            <button class="btn btn-danger btn-sm" onclick="MessageDelete('${object.getId()}');">
                                <span class="glyphicon glyphicon-remove"></span>
                            </button>
                        </td>
                    </tr>
		</c:forEach>
            </tbody>
	</table>
    </div>


    <!--Start Modal-->
    <div id="modalObjectMuseum" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="model-title">Museu Objeto</h4>
                </div>
            
                <form action="object/add" method="post">
                    <input type="hidden" id="objectId" name="objectId" value="0"/>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Name:</label> 
                            <input type="text" class="form-control" name="name" id="name"/>
                        </div>
                        <div class="form-group">
                            <label>Date: </label>
                            <input type="date" class="form-control date-picker" name="date" id="date" />
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

       <script src="resources/js/jquery-min.js"></script>
        <script src="resources/js/bootstrap.min.js"></script>
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
        });
        
        $(function () {
            $('.required-excluir').tooltip({
                placement: 'right',
                title: 'Excluir'
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


                window.location.href = "object/delete?id=" + id;

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
            
            function alterar(id, name, date) {
            $('#objectId').val(id);
            $('#name').val(name);
            $('#date').val(date);
            console.log(date);
            $('#modalObjectMuseum').modal('show');
        }
        ;
        </script>
        
</body>
</html>