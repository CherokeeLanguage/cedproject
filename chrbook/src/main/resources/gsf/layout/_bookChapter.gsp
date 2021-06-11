<g:if test="${isPrintVersion}">
    \index{${title}}\subsection{${title}
    <g:if test="${phonetic}">
        &nbsp;- <g:transl src="${phonetic}"/>
    </g:if>
    }<br/>
    ${body()}
</g:if>
<g:else>
    <h4>${title}
        <g:if test="${phonetic}">
        &nbsp;- <g:transl src="${phonetic}"/>
        </g:if>
    </h4>
    ${body()}
</g:else>
