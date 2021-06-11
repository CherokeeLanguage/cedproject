<%@ page import="net.cherokeedictionary.transliteration.SyllabaryUtil" %>
<g:if test="${isPrintVersion}">

</g:if>
<g:else>

%{--    <div style="display:table">--}%
%{--        <g:each in="${dialogs}">--}%
%{--            <div style="display:table-row">--}%
%{--                <div style="display:table-cell;padding-right:20px">${SyllabaryUtil.mixedTransliteration(it.name)}:<g:if test="${showPhonetic ?: false}"><br/><g:redSpan>${it.name}:</g:redSpan></g:if></div>--}%
%{--                <div style="display:table-cell">${SyllabaryUtil.mixedTransliteration(it.dialog)}<g:if test="${showPhonetic ?: false}"><br/><g:redSpan>${it.dialog}</g:redSpan></g:if></div>--}%
%{--            </div>--}%
%{--        </g:each>--}%
%{--    </div>--}%
%{--    <br/>--}%
%{--    <div style="display:table">--}%
%{--        <g:each in="${dialogs}">--}%
%{--            <div style="display:table-row">--}%
%{--                <div style="display:table-cell;padding-right:20px">${it.engName}:</div>--}%
%{--                <div style="display:table-cell">${it.engDialog}</div>--}%
%{--            </div>--}%
%{--        </g:each>--}%
%{--    </div>--}%
</g:else>

<g:vocabulary src="${vocabulary}"/>