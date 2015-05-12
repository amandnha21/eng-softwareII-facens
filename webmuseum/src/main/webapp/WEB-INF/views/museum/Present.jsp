<%-- 
    Document   : Present
    Created on : 25/04/2015, 23:25:28
    Author     : Dell
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>

        <link href="resources/css/bootstrap.min.css" rel="stylesheet">
        <!--<link href="resources/css/bootstrap-select.min.css" rel="stylesheet">    
        
        <link href="resources/css/bootstrap-responsive.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="resources/css/m-icons.css">

        <link rel="stylesheet" type="text/css" href="resources/css/my_bootstrap.css">
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-timepicker.min.css">
        <link rel="stylesheet" type="text/css" href="resources/css/datepicker.css">
        <link href="resources/css/table-sorter.css" rel="stylesheet"> 
        <link href="resources/css/tablesorter.pager.css" rel="stylesheet"> 
        <link href="resources/css/dataTables.bootstrap.css" rel="stylesheet"> 
        <link rel="stylesheet" type="text/css" href="resources/css/jquery.toastmessage.css">
        -->
        <style>

            .dataTables_paginate, .dataTables_filter{
                text-align: right;
            }
        </style>

    </head>
    <body onLoad="Message();">
        <script type="text/javascript" src="resources/js/menu.js"></script>
        <div class="container">
            <h4 class="horizontal-divider">
                <br>
                Presente / Passado 1   
                <a class="btn btn-mini btn-success required-inserir" href="#modal1" role="button" data-toggle="modal" ><i class="icon-white icon-plus"></i></a>
            </h4>
        </div>
        
        
<!--Modal-->
<div id="modal1" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header" >	
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span aria-hidden="true">&times;</span></button>                
                <h4>Está imagem se assemelha o que na atualidade? </h4>
            </div>            
            <div class="modal-body">               
                <h4>Está cuia se assemelha o que na atualidade? </h4>
                <img width="500" src="resources/images/cuias_04.jpg" class="logo-thumb">

                <div class="form-group" style="margin-left:50px">

                    <div class="">
                        <label class="radio inline" for="radios-0">
                            <input type="radio" name="radios" id="radios-0" value="1">
                            Tupperware 
                        </label>
                        <br>
                        <label class="radio inline" for="radios-1">
                            <input type="radio" name="radios" id="radios-1" value="2">
                            Prato
                        </label>
                        <br>
                        <label class="radio inline" for="radios-2">
                            <input type="radio" name="radios" id="radios-2" value="3">
                            Bandeja alumínio
                        </label>
                        <br>
                        <label class="radio inline" for="radios-3">
                            <input type="radio" name="radios" id="radios-3" value="4">
                            Panela
                        </label>
                    </div>


                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" type="submit" aria-hidden="true" onclick="limparcampos()">Salvar</button>
                <button class="btn" data-dismiss="modal" aria-hidden="true">Fechar</button>
            </div>

        </div>
        
    </div>
</div> 

<!--Modal-->
<div id="modal2" class="modal fade"  style="width: 60%;margin-left: -25%;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
     <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" >	
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span aria-hidden="true">&times;</span></button>                
            <h4>Está imagem se assemelha o que na atualidade? 555555</h4>
        </div>            
        <div class="modal-body">               
            <h4>Está cuia se assemelha o que na atualidade? </h4>
            <img width="500" src="resources/images/cuias_04.jpg" class="logo-thumb">

            <div class="control-group">

                <div class="controls">
                    <label class="radio inline" for="radios-0">
                        <input type="radio" name="radios" id="radios-0" value="1">
                        Tupperware 
                    </label>
                    <br>
                    <label class="radio inline" for="radios-1">
                        <input type="radio" name="radios" id="radios-1" value="2">
                        Prato
                    </label>
                    <br>
                    <label class="radio inline" for="radios-2">
                        <input type="radio" name="radios" id="radios-2" value="3">
                        Bandeja alumínio
                    </label>
                    <br>
                    <label class="radio inline" for="radios-3">
                        <input type="radio" name="radios" id="radios-3" value="4">
                        Panela
                    </label>
                </div>


            </div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" type="submit" aria-hidden="true" onclick="limparcampos()">Salvar</button>
            <button class="btn" data-dismiss="modal" aria-hidden="true">Fechar</button>
        </div>
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
            function limparcampos() {
                if (document.getElementById('radios-0').checked === true) {
                    var msg = 'Parabéns você acertou!';
                    showMessageToast(msg, 15000);
                    

                } else {
                    var msg = 'Tente outra vez!';
                    showMessageToast(msg,15000 );
                }

            }
            ;

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

                    window.history.pushState({msg: 'Message'}, 'Museum Object', 'list');
                    showMessageToast(msg, 5000);
                }

            }

</script>

    </body>
</html>

