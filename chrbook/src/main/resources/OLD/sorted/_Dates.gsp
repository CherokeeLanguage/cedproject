<g:bookChapter anchor="${baseSection.title}" title="${baseSection.title}" titletranslit="${baseSection.titleTranslit}">
    <g:whatYouWillLearn objectives="${baseSection.topics}"/>
    <g:render template="gsf/layout/dialogVocab" model="[isPrintVersion:isPrintVersion, dialogs:baseSection.dialogs, vocabulary:baseSection.vocabulary,showPhonetic:true]"/>
    <g:footnote src="Discussed in the section " linkTitle="Days Of Week Meanings" link="daysOfWeekMeaning"/>

</g:bookChapter>