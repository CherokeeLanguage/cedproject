<g:if test="${!request.getParameter("print") || request.getParameter("print") == "false"}">
    <h3><g:translit src="tsalagi gawonihisd digoweli"/><br/>Cherokee Language Book </h3>
    <pre><g:each var="title" in="${tableOfContents}">
        <a href="#${title.replaceAll(" ", "")}">${title}</a></g:each></pre>
</g:if>
<br/>