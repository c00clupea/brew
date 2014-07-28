<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../head.jsp"/>
<h1>Picturegallery</h1>

<h2>Picturegallery</h2>


<c:forEach var="locpic" items="${pictures}">
    <a href="picturegallery.secu?pic=img/${locpic}.jpg">
        <img src="img/${locpic}_th.jpg" alt="${locpic}">
    </a>
</c:forEach>
<p>
<c:if test="${not empty picture}">
     <img src="${picture}" alt="${picture}">
</c:if>
</p>
<jsp:include page="../help/pic_help.jsp"/>
<jsp:include page="../../foot.jsp"/>