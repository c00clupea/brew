<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../head.jsp"/>
<h1>Search</h1>

<h2>Search</h2>

<form action="search.secu" method="post">
    <input type="text" name="search">
    <input type="submit" value="Start High Performance and super safe search...">
</form>

<div><c:out value="${searchString}"/></div>
 <!--
<b>You searched for ${searchString}</b>          -->


<jsp:include page="../help/search_help.jsp"/>
<jsp:include page="../../foot.jsp"/>