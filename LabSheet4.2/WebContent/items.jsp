<%@page import="com.PAF.item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    <%
 //insert items.........................
if (request.getParameter("itemCode") != null)
 {
 item itemObj = new item();
 String stsMsg = ""; 
 
 //String stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
 //request.getParameter("itemName"),
 //request.getParameter("itemPrice"),
 //request.getParameter("itemDesc"));
 //session.setAttribute("statusMsg", stsMsg);
//Insert--------------------------
if (request.getParameter("hidItemIDSave") == "")
{
stsMsg = itemObj.InsertItem(request.getParameter("itemCode"),
request.getParameter("itemName"),
request.getParameter("itemPrice"),
request.getParameter("itemDesc"));
} 
else//Update----------------------
{
//stsMsg = itemObj.UpdateItem(request.getParameter("hidItemIDSave"),
//request.getParameter("itemCode"),
//request.getParameter("itemName"),
//request.getParameter("itemPrice"),
//request.getParameter("itemDesc"));
System.out.print("update no");
}
session.setAttribute("statusMsg", stsMsg); 

 }
    if (request.getParameter("hidItemIDDelete") != null)
    {
     item itemObj = new item();
     String stsMsg =
     itemObj.DeleteItem(request.getParameter("hidItemIDDelete"));
     session.setAttribute("statusMsg", stsMsg);
    }


%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="item.js"></script>
<script src="jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="container">
<div class="row justify-content-center">
<h1>Items Management 09</h1>
</div>

          <div class="col-bs-6">
            <div class="well bs-component">
          
<form id="formItem" name="formItem" method="post" action="items.jsp">
 Item code:
<input id="itemCode" name="itemCode" type="text"
 class="form-control form-control-sm">
<br> Item name:
<input id="itemName" name="itemName" type="text"
 class="form-control form-control-sm">
<br> Item price:
<input id="itemPrice" name="itemPrice" type="text"
 class="form-control form-control-sm">
<br> Item description:
<input id="itemDesc" name="itemDesc" type="text"
 class="form-control form-control-sm">
<br>
<input id="btnSave" name="btnSave" type="button" value="Save"
 class="btn btn-primary">
<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
</form>

</div>
</div>
</div>
<div class="alert alert-success">
<%
 out.print(session.getAttribute("statusMsg"));
%>
</div>
<br>

<%
 item itemObj = new item();
 out.print(itemObj.readItems());
%>



</body>
</html>