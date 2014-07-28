<%--@elvariable id="userDomain" type="edu.hm.muse.domain.User"--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../head.jsp"/>
<h1>Area 42</h1>

<b>Here you can change your settings</b>

<form method="post" action="change.secu">
    <input type="hidden" name="uid" value="${userDomain.id}" >
    <input type="text" name="uname" value="${userDomain.uname}" id="uname">
    <label for="uname">Name</label>
    <input type="password" name="upwd" value="${userDomain.upwd}" id="upwd">
    <label for="upwd">Password</label>
    <input type="submit" value="Change">
</form>
<jsp:include page="../help/intern_help.jsp"/>
<jsp:include page="../../foot.jsp"/>