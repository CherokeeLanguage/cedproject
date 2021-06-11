<%@ page import="net.cherokeedictionary.transliteration.SyllabaryUtil; net.cherokeedictionary.chrbook.sections.DialogLine"%>
%{--<g:render template="gsf/layout/bookChapter" model="[anchor:title, title:title, titletranslit:titleTranslit]">--}%
%{--    <g:whatYouWillLearn objectives="${greetOthersTopics}"/>--}%
%{--    <g:render template="gsf/layout/dialogVocab" model="[isPrintVersion:isPrintVersion, dialogs:dialogs, vocabulary:vocabulary,showPhonetic:true]"/>--}%
%{--    <g:render template="gsf/hello" model="[showExercise:true]"/>--}%
%{--    <br/>--}%
%{--    <g:render template="gsf/goodbye" model="[showExercise:true]"/>--}%
%{--</g:render>--}%
<g:bookChapter anchor="${baseSection.title}" title="${baseSection.title}" titletranslit="${baseSection.titleTranslit}">
    <g:whatYouWillLearn objectives="${baseSection.topics}"/>
    <g:render template="gsf/layout/dialogVocab" model="[isPrintVersion:isPrintVersion, dialogs:baseSection.dialogs, vocabulary:baseSection.vocabulary,showPhonetic:true]"/>
    ${body()}
</g:bookChapter>