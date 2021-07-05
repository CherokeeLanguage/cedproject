<g:bookChapter anchor="${baseSection.title}" title="${baseSection.title}" titletranslit="${baseSection.titleTranslit}">
    <g:whatYouWillLearn objectives="${baseSection.topics}"/>
    <g:render template="gsf/layout/dialogVocab" model="[isPrintVersion:isPrintVersion, dialogs:baseSection.dialogs, vocabulary:baseSection.vocabulary, showPhonetic:true]"/>
%{--    <g:render template="gsf/cardinal" model="[showExercise:true]"/><br/>--}%
%{--    <g:render template="gsf/ordinal" model="[showExercise:true]"/>--}%
</g:bookChapter>