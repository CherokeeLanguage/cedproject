<g:if test="${isPrintVersion}">
    \cite{${title}}
</g:if>
<g:else>
    <a name="#cite${title}"></a><sup><a id="#cite${title}" href="#ref${title}">${citationIndex}</a></sup>
</g:else>