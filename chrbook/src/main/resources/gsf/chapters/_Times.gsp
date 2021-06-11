<g:bookChapter anchor="${baseSection.title}" title="${baseSection.title}" titletranslit="${baseSection.titleTranslit}">
    <g:whatYouWillLearn objectives="${baseSection.topics}"/>
    <g:render template="gsf/layout/dialogVocab" model="[isPrintVersion:isPrintVersion, dialogs:baseSection.dialogs, vocabulary:baseSection.vocabulary, showPhonetic:true]"/>

    <g:footnote src="1 Any time after 12:00 p.m. until the sun starts to set."/>
    <g:footnote src="2 The time of day when the sun is setting."/>
    <g:footnote src="3 The time somewhere in the late time of night like 12:00 a.m."/>
    <g:citation title="walcpp47" src="walc pp47"/>
</g:bookChapter>