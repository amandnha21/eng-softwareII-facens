<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <title>Museum Navigation</title>
        <link href="resources/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            .scenario { margin-bottom:20px; border-bottom:1px solid #ccc;  }
            .nav-obj { min-height:200px; text-align:left; padding:10px; }
            
            #museum-navigation {
                width: 20%;
                font-size: 16px;
            }
            
            #museum-navigation a {
                color: #333;
            }
            
            #museum-navigation li > ul {
                display: none;
            }
            
            #museum-navigation li.active > a {
                color: #563d7c;
                font-weight: bold;
                border-right: 2px solid #563d7c;
            }
            
            #museum-navigation li.active > ul {
                display: block;
            }
            #museum-navigation li > ul > li {
                display:block;
                font-size: 14px;
                margin-left: 15px;
                padding: 0px;
            }
            
            #museum-navigation li > ul > li > a {
                padding: 5px 15px;
            }
            
            #museum-navigation.sticky {
                -webkit-backface-visibility: hidden;
                position: fixed !important;
                top: 22px;
                bottom: 22px;
                left: 33%;
                margin-left: -25%;
                overflow-x: hidden;
                overflow-y: auto;
            }
        </style>
    </head>
    <body onload="Message();" data-spy="scroll" data-target="#museum-navigation" data-offset="50">
        <script type="text/javascript" src="resources/js/menu.js"></script>

        <div class="container">
            
            <div class="page-header">
                <h3>
                    ${museum.getName()} - Navegação 
                    <button type="button" class="btn btn-default pull-right" data-toggle="modal" data-target="#modalMuseum" href="navigation-aleatory?id=${museum.getId()}">
                        <span class="glyphicon glyphicon-random"></span>&nbsp;&nbsp;
                        Aleatória
                    </button>
                    <button type="button" class="btn btn-default pull-right active" data-toggle="modal" data-target="#modalMuseum" style="margin-right:10px">
                        <span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;
                        Sequêncial
                    </button>
                </h3>
            </div>
            
            <div class="">
                <div class="row">
                    <div class="col-md-3">
                        <nav id="museum-navigation" class="hidden-phone affix">
                            <ul class="nav" role="tablist">
                                <!--
                                <li>
                                    <a href="#sce1">Cenário 1</a>
                                    <ul class="nav">
                                        <li><a href="#sce1_obj1">Objeto 1</a></li>
                                        <li><a href="#sce1_obj2">Objeto 2</a></li>
                                        <li><a href="#sce1_obj3">Objeto 3</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#sce2">Cenário 2</a>
                                    <ul class="nav">
                                        <li><a href="#sce2_obj1">Objeto 4</a></li>
                                        <li><a href="#sce2_obj2">Objeto 5</a></li>
                                        <li><a href="#sce2_obj3">Objeto 6</a></li>
                                    </ul>
                                </li>
                                -->
                                <c:forEach items="${museum.getScenarios()}" var="scenario">
                                    <li>
                                        <a href="#sce${scenario.getId()}">${scenario.getName()}</a>
                                        <ul class="nav">
                                            <c:forEach items="${scenario.getObjects()}" var="obj">
                                                <li><a href="#sce${scenario.getId()}_obj${obj.getId()}">${obj.getName()}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                </c:forEach>
                            </ul>
                        </nav>
                    </div>
                    
                    <div class="col-md-9" class="main">
                        <div id="scenarios-scroll" data-spy="scroll" data-target="#museum-navigation" data-offset="0">
                            <!--
                            <div class="scenario">
                                <h3 class="page-header" id="sce1">
                                    Cenário 1
                                    <a class="anchorjs-link" href="#sce1"></a>
                                </h4>
                                <div class="pager">
                                    <div class="jumbotron">
                                        <h3>Tema</h3>
                                        <p>Descrição do tema do cenário 1</p>
                                    </div>
                                    <div class="nav-obj">
                                        <h4 id="sce1_obj1">
                                            Objeto 1
                                            <a class="anchorjs-link" href="#sce1_obj1"></a>
                                        </h4>
                                        <p>
                                            Descrição ou Imagem
                                        </p>
                                    </div>
                                    <div class="nav-obj">
                                        <h4 id="sce1_obj2">
                                            Objeto 2
                                            <a class="anchorjs-link" href="#sce1_obj2"></a>
                                        </h4>
                                        <p>
                                            Descrição ou Imagem
                                        </p>
                                    </div>
                                    <div class="nav-obj">
                                        <h4 id="sce1_obj3">
                                            Objeto 3
                                            <a class="anchorjs-link" href="#sce1_obj3"></a>
                                        </h4>
                                        <p>
                                            Descrição ou Imagem
                                        </p>
                                    </div>
                                </div>
                            </div>
                            -->
                            
                            <c:forEach items="${museum.getScenarios()}" var="scenario">
                                <div class="scenario">
                                    <h3 class="page-header" id="sce${scenario.getId()}">
                                        ${scenario.getName()}
                                        <a class="anchorjs-link" href="#sce${scenario.getId()}"></a>
                                    </h4>
                                    <div class="pager">
                                        <div class="jumbotron">
                                            <h3>${scenario.getTheme().getTitle()}</h3>
                                            <p>${scenario.getTheme().getDescription()}</p>
                                        </div>
                                        <c:forEach items="${scenario.getObjects()}" var="obj">
                                            <div class="nav-obj">
                                                <h4 id="sce${scenario.getId()}_obj${obj.getId()}">
                                                    ${obj.getName()}
                                                    <a class="anchorjs-link" href="#sce${scenario.getId()}_obj${obj.getId()}"></a>
                                                </h4>
                                                <p>
                                                    ${obj.getName()}
                                                </p>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:forEach>
                            
                        </div>
                    </div>
                </div>
            </div>
        
        </div>
                    
        <script src="resources/js/jquery-min.js"></script>
        <script src="resources/js/bootstrap.min.js"></script>
        
        <script src="resources/js/jquery.toastmessage.js"></script>
        <script>
            $(document).ready(function(){
                //$('#scenarios-scroll').scrollspy({ target: '#museum-navigation' });
                $('#museum-navigation a').click(function (e) {
                   $(this).tab('show');
                });
                $("body").scrollspy({target: "#museum-navigation"});
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
    </body>
</html>
