<g:if test="${isPrintVersion}">
    sb << "%+Bibliography<br/>\\begin{thebibliography}{99}<br/>"

            citationMap.eachWithIndex { item, idx ->
                def value = item.value.replaceAll("&", "\\\\&")
                sb << "\\bibitem{${item.key}} ${value}<br/>"
            }
            sb << "<br/>\\end{thebibliography}<br/>%-Bibliography<br/>"
</g:if>
<g:else>
    <g:each var="item" in="${citationMap}">
        <sup id=\"ref${item.key}\">[${idx + 1}]</sup> ${item.value} <br/>
    </g:each>
</g:else>