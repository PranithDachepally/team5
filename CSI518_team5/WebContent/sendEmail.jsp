<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Send an e-mail</title>
<jsp:include page='footer.jsp'></jsp:include>
<link rel="stylesheet" href="css/local.css">
<script src="js/validate.js"></script>
</head>
<body>
    <form name="myform" method="post" onsubmit="return validateForm('EmailServlet','false')">
        <table class="orgtable" border="0" width="35%">
            <caption><h2>Send New E-mail</h2></caption>
            <tr>
                <th width="50%">Recipient</td>
                <td><input type="text" name="recipient" size="50" value="<%= request.getParameter("email")%>" readonly/></td>
            </tr>
            <tr>
                <th>Subject </td>
                <td><input type="text" name="subject" size="50"/></td>
            </tr>
            <tr>
                <th>Content </td>
                <td><textarea rows="30" cols="100" name="content"></textarea> </td>
            </tr>
            <tr>
                <td colspan="2" align="left">
                <input type="submit" value="Send"/>
                		<span style="display: inline;" class="errormsg" id="errormsg"></span>
						<span style="display: inline;" class="successmsg" id="successmsg"></span>
                </td>
            </tr>
        </table>
         
    </form>
    
</body>
</html>