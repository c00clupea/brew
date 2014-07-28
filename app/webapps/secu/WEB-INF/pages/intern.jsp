<%--@elvariable id="userDomain" type="edu.hm.muse.domain.User"--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../head.jsp"/>
<h1>Area 42</h1>

<b>Here you can see your accountdetails</b>

<div id="id">
ID: <c:out value="${userDomain.id}"/>
</div>

<div id="uname">
    Username: <c:out value="${userDomain.uname}"/>
</div>

<div>
    Password secured with md5: <c:out value="${md5pwd}"/>
    <br/>
    <small>What was the original password (it is not the same like in database....this would be too easy :-))<br/>
    try another way.....</small>
</div>
<p></p>


<a href="internchange.secu">Change AccountSettings</a>


<jsp:include page="../help/acc_help.jsp"/>
<jsp:include page="../../foot.jsp"/>