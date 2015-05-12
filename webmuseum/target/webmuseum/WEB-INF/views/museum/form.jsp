<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<h4 class="horizontal-divider">
                    <br>
                    Museum  
                    <a href="#modalMuseum" role="button" class="btn btn-mini btn-success required-inserir" data-toggle="modal"><i class="icon-white icon-plus"></i></a></h4>

       <table id="tbobject" class="table tablesorter table-striped sortable table-hover"> 
		<tr>
			<td class="header">Id</td>
			<td class="header">Name</td>			
			<td style="width:100px" class="header">Delete</td>
                        <td style="width:100px" class="header">Alterar</td>
		</tr>
		<c:forEach items="${list}" var="object">
			<tr>
                            
				<td title="Id">${object.getId()}</td>
				<td title="Name">${object.getName()}</td>				
				<td title="Delete" style="width:100px"><a class="btn btn-mini btn-danger required-excluir" href="javascript:func()" onclick="MessageDelete('${object.getId()}')" ><i class="icon-white icon-trash"></i></a></td>
                                <td title="Alterar"><a class="btn btn-mini btn-primary required-alterar" href="#" onclick="alterar('${object.getId()}', '${object.getName()}', '${object.getDate().getTime()}');"> <i class="icon-white icon-pencil"></i></a></td>
			</tr>
		</c:forEach>
	</table>
</head>
<body>

</body>
</html>