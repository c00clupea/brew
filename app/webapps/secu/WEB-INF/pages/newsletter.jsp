<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../head.jsp" />

<h1>This is the newsletter system</h1>

<c:forEach var="newsletter" items="${allNewsletters}">
	<a href="?id=${newsletter.id}">${newsletter.id}</a>&nbsp;
</c:forEach>

<ul>
	<c:forEach var="newsletter" items="${newsletters}">
		<li>${newsletter.text}</li>
	</c:forEach>
</ul>

<jsp:include page="../help/newsletter_help.jsp"/>
<jsp:include page="../../foot.jsp" />
