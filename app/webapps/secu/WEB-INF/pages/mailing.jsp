<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../head.jsp"/>
<h1>This is the mailinglist</h1>
members of this mailinglist by Username:
<ul>
<%--@elvariable id="users" type="java.util.List"--%>
<c:forEach var="user" items="${users}">
                <li>${user.uname}</li>
</c:forEach>
</ul>
I am so sorry the mailinglist is empty....

<jsp:include page="../help/mailing_help.jsp"/>
<jsp:include page="../../foot.jsp"/>

