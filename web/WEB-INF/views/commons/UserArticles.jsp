<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%> --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="hostUrl">${pageContext.request.requestURL}</c:set>
<c:set var="hostUri">${pageContext.request.requestURI}</c:set>
<c:set var="hostContext" value="${fn:substring(hostUrl, 0, fn:length(hostUrl) - fn:length(hostUri))}${pageContext.request.contextPath}" />
<html>
<head>
    <style type="text/css">
        <%@include file="../../../resources/css/ArticlePage.css" %>
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Your Articles</title>
</head>
<body>
<div class="one"><h1>Welcome to your profile</h1></div>
<a href="${pageContext.request.contextPath}/logout" class="logout">Logout</a>
<a href="${pageContext.request.contextPath}/useredit" class="editprofile">Edit Profile</a>
<br><br>
<a href="${pageContext.request.contextPath}/articleadd" class="createarticle">Create new Article</a>
<br><br>
<select id="idvisibleArticle" onchange="selectVisibleItems('${hostContext}/articlescount?visibleArticle=')">
    <option value="100000"
            <c:if test="${visibleArticle eq '100000'}">
                selected="selected"
            </c:if>
    >all items</option>
    <option value="5"
            <c:if test="${visibleArticle eq '5'}">
                selected="selected"
            </c:if>
    >5 items</option>
    <option value="10"
            <c:if test="${visibleArticle eq '10'}">
                selected="selected"
            </c:if>
    >10 items</option>
    <option value="25"
            <c:if test="${visibleArticle eq '25'}">
                selected="selected"
            </c:if>
    >25 items</option>
</select>
<br><br>
<c:set var="countArticles" value="${usersArticleDto.articles}"/>
<c:if test="${countArticles ne null && countArticles.size() gt 0}">
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Description</th>
            <th>Url</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach var="row" items="${countArticles}">
            <tr>
                <td>${row.getName()}</td>
                <td>${row.getDescription()}</td>
                <td>${row.getUrl()}</td>
                <td><a href="${pageContext.request.contextPath}/articleedit?name=${row.getName()}" class="butt">edit</a></td>
                <td><a href="#" onclick="checkDeleteItem('${hostContext}/articledelete?name=${row.getName()}')" class="butt">delete</a></td>
            </tr>
        </c:forEach>
    </table>

        <br><br>

</c:if>
<ul class="pagination">
    <li><a href="${hostContext}/userarticle?pageNumber=1" class="butt">1</a></li>
    <li><a href="${hostContext}/userarticle?pageNumber=2" class="butt">2</a></li>
    <li><a href="${hostContext}/userarticle?pageNumber=3" class="butt">3</a></li>
    <li><a href="${hostContext}/userarticle?pageNumber=4" class="butt">4</a></li>
    <li><a href="${hostContext}/userarticle?pageNumber=6" class="butt">6</a></li>
    <li><a href="${hostContext}/userarticle?pageNumber=7" class="butt">7</a></li>
    <li><a href="${hostContext}/userarticle?pageNumber=8" class="butt">8</a></li>
    <li><a href="${hostContext}/userarticle?pageNumber=9" class="butt">9</a></li>
    <li><a href="${hostContext}/userarticle?pageNumber=10" class="butt">10</a></li>
</ul>
<script type="text/javascript">
    function checkDeleteItem(url) {
        if (confirm("Are you sure?")) {
            window.location.href = url;
        }
    }
    function selectVisibleItems(url) {
        var visibleArticle = document.getElementById("idvisibleArticle");
        window.location.href = url
            + visibleArticle.options[visibleArticle.selectedIndex].value;
    }
</script>
</body>
</html>