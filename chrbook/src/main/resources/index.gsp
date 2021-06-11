<%--
  Created by IntelliJ IDEA.
  User: winkimac
  Date: 5/29/21
  Time: 5:52 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="cherokee.dictionary.taglibUtil.NumbersSection; cherokee.dictionary.taglibUtil.GreetingsSection;cherokee.dictionary.taglibUtil.ColorsSection; net.cherokeedictionary.chrbook.sections.WhatIsYourNameSection" %>
<%@ page import="cherokee.dictionary.taglibUtil.DatesSection;cherokee.dictionary.taglibUtil.TimesSection;cherokee.dictionary.taglibUtil.ShapesSection;cherokee.dictionary.taglibUtil.MonthsSection;" %>
<html>
<head>
    <title>Cherokee Language Book - <g:translit src="tsalagi gawonihisd digoweli"/></title>
</head>
<body>
%{--<g:render template="hold/old/1Greetings/Chapter"/>--}%
%{--<g:render template="hold/old/2WhatDoYouWantToDo/Chapter"/>--}%
<%
def isPrintVersion = request.getParameter("print") && request.getParameter("print") == "true"


def yesNoVocabulary = [:]
yesNoVocabulary.yes = "vv"
yesNoVocabulary.no = "tla, vtla, tlahv"
yesNoVocabulary.you_too = "nihisgwu"
yesNoVocabulary.good = "osda"
yesNoVocabulary.very_good = "osdadv"

def greetings2 = [:]
greetings2."How are you?" = "dohi(gwu)ju"
greetings2."I am fine." = "osigwu"
greetings2."And you?" = "nihina"
greetings2."Thank you." = "wado"
greetings2."Thank you very much." = "wadodv"
greetings2."Ok." = "howa"
%>

<g:printVersion trueFalse="${request.getParameter("print")}"/>



%{--<g:vocabulary src="${yesNoVocabulary}"/>--}%
%{--<g:vocabulary src="${greetings2}"/>--}%
%{--<g:vocabulary src="${greetingsVocabulary << yesNoVocabulary << greetings2}"/>--}%
%{--<g:render template="gsf/items"/>--}%
</body>
</html>

%{--<g:render template="gsf/layout/footnote" model="[isPrintVersion:isPrintVersion, src:'Osi will be discussed more in the section ', linkTitle:'Word Breakdown - Tohi and Osi', link:'wordBreakdownTohiOsi']"/>--}%
%{--<g:footnote src="Osi will be discussed more in the section " linkTitle="Word Breakdown - Tohi and Osi" link="wordBreakdownTohiOsi"/>--}%
%{--<g:render template="gsf/layout/footnote" model='[isPrintVersion: false, src:'Osi will be discussed more in the section ', linkTitle:Word Breakdown - Tohi and Osi", link:"wordBreakdownTohiOsi"]"/>--}%