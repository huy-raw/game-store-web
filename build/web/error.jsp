<%-- 
    Document   : error
    Created on : Mar 15, 2022, 12:42:39 AM
    Author     : HuyRaw
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
    </head>
    <body>
        <h1>${requestScope.ERROR_MESSAGE}</h1>
    </body>
</html>
