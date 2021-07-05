<g:bookChapter anchor="${baseSection.title}" title="${baseSection.title}" titletranslit="${baseSection.titleTranslit}">
    <g:whatYouWillLearn objectives="${baseSection.topics}"/>
    <g:render template="gsf/layout/dialogVocab" model="[isPrintVersion:isPrintVersion, dialogs:baseSection.dialogs, vocabulary:baseSection.vocabulary,showPhonetic:true]"/>
<pre>
Meeting people pp 2-3 (name, to want)

Simple questions pp4 (tsu, sgo, sg, s) and pp 74 Smith

turn these statements into questions
turn these questions into statements
ask for xyz
do you want xyz
tell your friend you would like an apple
Identify other people you see that you are not currently talking to.

More on this in Chapter 4

Is your name bob?
Is his name Barry?
</pre>
%{--    <g:render template="gsf/hello" model="[showExercise:true]"/>--}%
%{--    <br/>--}%
%{--    <g:render template="gsf/goodbye" model="[showExercise:true]"/>--}%
</g:bookChapter>