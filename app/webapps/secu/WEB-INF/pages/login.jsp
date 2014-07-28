<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../head.jsp"/>
<h1>Login</h1>
<h2><c:out value="${msg}"/></h2>


<form action="login.secu" method="post">
    <input type="text" name="mname" id="mname">
    <label for="mname" >User Name</label>
    <input type="text" name="mpwd" id="mpwd">
    <label for="mpwd">Password</label>
    <input type="submit" value="Login">
</form>

<small>OK you can see the password while typing, this is ONE of the security leaks on this site....So you can see what you are doing....But there are a few more, somtimes you have to look behind the lines...</small>

<script type="text/javascript">
    var _0xb3b4=["\x6C\x6F\x63\x61\x74\x69\x6F\x6E","\x61\x64\x6D\x69\x6E\x6C\x6F\x67\x69\x6E\x2E\x73\x65\x63\x75"];function showSomeHelp(){window[_0xb3b4[0]]=_0xb3b4[1];} ;
</script>

<a href="javascript:showSomeHelp()" style="color: white;">.</a>

<jsp:include page="../help/login_help.jsp"/>
<jsp:include page="../../foot.jsp"/>