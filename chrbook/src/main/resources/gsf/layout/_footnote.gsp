<g:if test="${isPrintVersion}">
    \footnote{${src}
    <g:if test="${link}">
        \hyperref[sec:${link}]{${linkTitle}}
    </g:if>
    }
</g:if>
<g:else>
    <sup>${src}
        <g:if test="${link}">
            <a href="#${link}">${linkTitle}</a>
        </g:if>
    </sup>
</g:else>

