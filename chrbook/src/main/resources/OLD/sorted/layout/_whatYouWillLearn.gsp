<g:if test="${isPrintVersion}">
    <% def whatYouWillLearn = "What You Will Learn" %>
    \index{${whatYouWillLearn}}\subsection{${whatYouWillLearn}}<br/>
    In this unit you will learn:<br/>
    \begin{itemize}<br/>
    <g:each var="it" in="${objectives}">
        \item ${it}<br/>
    </g:each>
    \end{itemize}\newpage<br/><br/>
</g:if>
<g:else>
    <b>What You Will Learn In This Chapter</b><br/>
    In this unit you will learn:<br/>
    <ul>
        <g:each var="it" in="${objectives}">
            <li>${it}</li>
        </g:each>
    </ul>
</g:else>