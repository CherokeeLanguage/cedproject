<g:bookChapter baseSection="${baseSection}">
    <g:whatYouWillLearn objectives="${baseSection.topics}"/>
    <g:render template="gsf/layout/dialogVocab" model="[isPrintVersion:isPrintVersion, dialogs:baseSection.dialogs, vocabulary:baseSection.vocabulary,showPhonetic:showPhonetic]"/>
    ${body()}
</g:bookChapter>