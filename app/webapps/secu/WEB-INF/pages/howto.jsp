<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../head.jsp"/>
<h1>Help</h1>

<h2>This page is not part of the lesson, it is just the help page....</h2>

<h3>How can I reset the database?</h3>
Every time you start the server (it is embedded) the database (also embedded) will be regenerated<br/>

<h3>How to deploy the changes?</h3>
Just stop the server, compile your sourcecode and start the server....
<h3>How to start / stop the server or compile my sourcecode?</h3>
Just run the main Method in in the TomcatServer class.<br/>
Easiest way is to use the run button in the preconfigured IDE....<br/>
This run Configuration will compile all changes, and start the embedded server....
<h3>How to reset everything including sourcecode....</h3>
In the apps directory, under the home directory, there is a clean and out of the box Project....
<h3>I need help....</h3>
In the footer there is a button with help topics...
<h3>How to start?</h3>
At first us a link on the left side...<br/>
Then try expected and unexpected things...<br/>
Look into html Sourcecode (in browser)<br/>
Use the browserfunctions for get or post requests<br/>
Then make a code review in the server sourcecode....
<h3>I need more help</h3>
Ask google or the trainer :-)
<h3>So many javafiles, which is the right one?</h3>
There are only two imnportant directories
<p><b>src/edu.hm.muse</b><br/>
There are the controller, domains and exception
</p>
<p> <b>webapps/secu/WEB-INF/pages</b>
    There are the jsp files

</p>
Any other file is just for the embedded webserver, or the help system....<br/>
<b>You really need just these two directories....</b>
<p>
    The controller is called by url...<br/>
    <pre>
    @RequestMapping(value = "/login.secu", method = RequestMethod.POST)
    public ModelAndView doSomeLogin(@RequestParam(value = "mname", required = false) String mname, @RequestParam(value = "mpwd", required = false) String mpwd,HttpSession session)
    </pre>    <br/>
    This means the method doSomeLogin is called when the browser targets at localhost:8080/secu/<b>login.secu</b>, but only when requested with POST....
    <br/>
    The form which called this method has two params with the name mname and mpwd   <br/>  <br/>

&lt;form&nbsp;action=&quot;login.secu&quot;&nbsp;method=&quot;post&quot;&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;input&nbsp;type=&quot;text&quot;&nbsp;name=&quot;mname&quot;&nbsp;id=&quot;mname&quot;&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;label&nbsp;for=&quot;mname&quot;&nbsp;&gt;User&nbsp;Name&lt;/label&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;input&nbsp;type=&quot;text&quot;&nbsp;name=&quot;mpwd&quot;&nbsp;id=&quot;mpwd&quot;&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;label&nbsp;for=&quot;mpwd&quot;&gt;Password&lt;/label&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;input&nbsp;type=&quot;submit&quot;&nbsp;value=&quot;Login&quot;&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&lt;/form&gt;<br/>

     <br/><br/>The param with name mname will be injected in the loginmethod as parameter mname....<br/>
The session Methodparameter has the actual session as reference...

</p>
<p>
    The return value is always a ModelAndView Object. new ModelAndView("login") means that the login.jsp is called<br/>
    you can find this jsp in the pages directory<br/><br/>

    In this example the jsp internchange.jsp will be called. In this jsp the userObject can be called with userDomain.id for the id in the userDomain Object....Look at the class User.java
    <pre>
        ModelAndView mv = new ModelAndView("internchange");
        User u = new User();
        mv.addObject("userDomain",u);

        return mv;
    </pre>            <br/>

</p>
<jsp:include page="../help/index_help.jsp"/>
<jsp:include page="../../foot.jsp"/>