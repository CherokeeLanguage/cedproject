<%@ page import="cherokeedictionary.lessons.Chapter; cherokeedictionary.lessons.Content; cherokeedictionary.lessons.Section; cherokeedictionary.lessons.SubSection" %>
<g:chapter en="Greetings" chr="unalihelijeti"/>
<h3>Greet Others - </h3>
<b>What You Will Learn In This Chapter</b><br/>
<ul>
    <li>How to greet poeple
    <li>How to make short descriptive phrases
    <li>About definites and indefinites
    <li>Say "hello" and "good  bye"
    <li>Ask how someone is doing
</ul>
%{--<div style="display:table-row">--}%
%{--    <div style="display:table-cell">--}%
%{--        <div style="display:table-row">--}%
%{--            <div style="display:table-cell"></div>--}%
%{--        </div>--}%
%{--        <div style="display:table-row">--}%
%{--            <div style="display:table-cell"></div>--}%
%{--        </div>--}%
%{--    </div>--}%
%{--    <div style="display:table-cell">--}%
%{--        <div style="display:table-row">--}%
%{--            <div style="display:table-cell"></div>--}%
%{--        </div>--}%
%{--        <div style="display:table-row">--}%
%{--            <div style="display:table-cell"></div>--}%
%{--        </div>--}%
%{--    </div>--}%
%{--</div>--}%
<div style="display:table-row">
    <div style="display:table-cell;padding-right:20px">
        <g:dialogLine name="Danili" dialog="Osiyo.  Danili dawadoa.  Gado dejadoa?" phonetic="true"/>
        <g:dialogLine name="Susani" dialog="Osiyo.  Susani dawadoa.  Dohiju?" phonetic="true"/>
        <g:dialogLine name="Danili" dialog="Osigwu.  Nihinahv?" phonetic="true"/>
        <g:dialogLine name="Susani" dialog="Osda.  Donadagohvi." phonetic="true"/>
        <g:dialogLine name="Danili" dialog="Donadagohvi." phonetic="true"/>
    </div>
    <%
        def vocabulary1 = [:]
        vocabulary1.Titus = 'Dadasi'
        vocabulary1.Timothy = 'Dimadi'
        vocabulary1.Mary = 'Meli'
        vocabulary1.Mark = 'Maga'
        vocabulary1.Daniel = 'Danili'
        vocabulary1.Susan = 'Susani'
        vocabulary1.John = 'Jani'
        vocabulary1.Hello = '(o)siyo'
        vocabulary1.And = 'ale <e>or nole'
        vocabulary1.Good = 'osda'
        vocabulary1."Well/Fine" = 'osigwu'
    %>
    <div style="display:table-cell">
        <g:vocabulary src="${vocabulary1}"/>
    </div>
</div>
<g:clearCitations/>
<h4>Hello - <g:translit src="osiyo"/></h4>
In Cherokee there is only one way to say 'Good Morning,' 'Good Afternoon,' 'Good Evening,' and Hello; that is by saying <g:translit src="osiyo"/> <span style="color:red">(o)siyo</span> or the shortened version <g:translit src="siyo"/> <span style="color:red">siyo</span>
<br/>
<g:footnote src="We will follow the convention of placing optional syllables in parenthesis.  You will see this written as (O)siyo.  The parentheses around the 'O' mean that the voicing of the 'O' is optional."/><br/>
<g:footnote src="Osi will be discussed more in the section " linkTitle="Word Breakdown - Tohi and Osi" link="wordBreakdownTohiOsi"/>
<br/>
<h4>Excercise - </h4>
Translate to Cherokee syllabary and the phonetic equivalent<br/>
1. Hello, Mary 2. Hello, Mark 3. Hello, Daniel<br/>

<h4>Good Bye - <g:translit src="donadagohvi"/></h4>
There is no word for 'goodbye' only 'to meet again'. The way to say 'goodbye' to one person is <g:translit src="donadagohvi"/>
<span style="color:red">donadagohvi</span>. If you would like to say 'goodbye' to more than one person you would say
<g:translit src="dodadagohvi"/> <span style="color:red">dodadagohvi</span>.  Lit: Let's meet again.
<g:footnote src="We will discuss the plurality prefixes (d-) in the section " linkTitle="Word Breakdown - Plurality Prefixes" link="wordBreakdownPluralityPrefixes"/>
<br/>

<h4>Excercise - </h4>
Translate to Cherokee syllabary and the phonetic equivalent<br/>
1. Goodbye, Mary and John 2. Goodbye, Titus 3. Goodbye, Daniel 4. Goodbye, Mary, John, Susan, and Mark<br/>

<a name="wordBreakdownTohiOsi"/>
<h4>Word Breakdown - <g:translit src="dohi"/> and <g:translit src="osi"/> Tohi and Osi</h4>
Altman and Belt (pp91-92) have this to say about Tohi and Osi:

Tohi is a Cherokee morpheme that indicates the state in which nature is flowing at its appropriate pace and everything
is as it should be. This fundamental concept is used in greetings and responses (<span style="color:red">Tohigwatsv?</span> and <span style="color:red">Tohigwu.</span>), and in a
variety of other instances and constructions that indicate an underlying concern with the notion that things be flowing
well in the Cherokee world. Tohi can be glossed variously as "well," "peaceful," "unhurried," and "health." In the Cherokee
speakers' view, if the state of tohi becomes disrupted there can be disastrous consequences, and communities that are disrupted
in this way can be dangerous or unhealthy places to live.
<br/><br/>
In addition to and as an adjunct to tohi, the concept of osi describes the proper state of the individual person.
Visualized as upright, facing forward, and resting on a single point of balance, osi is also used in greetings and
replies (<span style="color:red">osigwatsv?</span> and <span style="color:red">osi-gwu.</span>), and in other contexts that indicate that the notion of an individual’s state of
being is crucial in ensuring that all is flowing well in the larger Cherokee world. Osi is properly understood as
referring to the state of neutrality and balance, but it is most often glossed as "good." If individuals are out of
balance, they can cause problems in the larger system.
<g:citation src="Altman, H.M., & Belt, T.N. (2008). Reading History: Cherokee History through a Cherokee Lens. Native South 1, 90-98. http://doi.org/10.1353/nso.0.0003"/>
<br/>

%{--<pre>
\noindent picture of a person at a house waving good bye to people in a car \\
\noindent picture of the people in a car waving good bye to a person at the house\\
\noindent person shaking hands with someone business attire\\
\noindent person shaking hands with someone casual attire (maybe a bar)

\subsection{Exercise - <s></s>}
Fill in the missing words:\\
1. <s>jani</s> ---------\\
1. I'm (my name is) John.

\subsection{Vocabulary}
\input{chap1vocab2.tex}
</pre>--}%
<br/><br/><br/>
<br/><br/><br/>
<g:printCitations/>
%{--<g:render template="/templates/may2421TestYourself"/>--}%

%{--<%
    def chapterGreetings = new Chapter()
    chapterGreetings.englishTitle = "Greetings"
    chapterGreetings.phoneticTitle = "unalihelijeti"

    def sectionGreetOthers = new Section()
    sectionGreetOthers.englishTitle = "Greet Others"

    def subsectionWhatYouWillLearn = new SubSection()
    subsectionWhatYouWillLearn.englishTitle = "What You Will Learn"

    def contentChapter1WhatYouWillLearn = new Content()
    contentChapter1WhatYouWillLearn.englishTitle = "In this unit you will learn:"
    contentChapter1WhatYouWillLearn.content << "How to greet poeple"
    contentChapter1WhatYouWillLearn.content << "How to make short descriptive phrases"
    contentChapter1WhatYouWillLearn.content << "About definites and indefinites"
    contentChapter1WhatYouWillLearn.content << "Say \"hello\" and \"goodbye\""
    contentChapter1WhatYouWillLearn.content << "Ask how someone is doing"

    subsectionWhatYouWillLearn.content << contentChapter1WhatYouWillLearn

    sectionGreetOthers.content << subsectionWhatYouWillLearn

    def sectionVocabulary = new Section()
    sectionVocabulary.englishTitle = "Vocabulary"

    chapterGreetings.content << sectionGreetOthers
    chapterGreetings.content << sectionVocabulary

    def subsectionHello = new SubSection()
    subsectionHello.englishTitle = "Hello"
    subsectionHello.phoneticTitle = "osiyo"

    def subsectionHelloContent = new Content()
    subsectionHelloContent.content << "In Cherokee there is only one way to say \'Good Morning,\' \'Good Afternoon,\' \'Good Evening,\' and Hello; that is by saying <s>osiyo</s> \\  \\textcolor{red} {(o-)si-yo} or the shortened version <s>siyo</s> \\ \\textcolor{red} {si-yo}."
    subsectionHelloContent.content << "\\footnote{In this book we will follow the convention of placing optional syllables in parenthesis.  You will see this written as (O)siyo.  The parentheses around the 'O' mean that the voicing of the 'O' is optional.}"
    subsectionHelloContent.content << "\\footnote{Osi will be discussed more in the section \\hyperref[sec:wordBreakdownTohiOsi]{Word Breakdown - Tohi and Osi}}"
    subsectionHello.content << subsectionHelloContent

    sectionVocabulary.content << subsectionHello

    def publishContent = {section ->
        section.each {subsection ->
            out << raw("<b>${subsection.englishTitle}</b><br/><br/>")
            subsection.content.each {content ->
                out << content.englishTitle
                out << raw("<br/>")
                content.content.each {
                    out << it.englishTitle
                    out << raw("<br/>")
                    it.content.each {
                        out << it
                        out << raw("<br/>")
                    }
                }
            }
            out << raw("<br/>")
        }
        return ""
    }
%>

<h2>${chapterGreetings.englishTitle} - <g:translit src="${chapterGreetings.phoneticTitle}"/></h2>
<br/>
<g:each var="genericChapter" in="${chapterGreetings}">
    ${publishContent(genericChapter.content)}
</g:each>--}%
%{--<h3><g:translit src="Sagwu"/> - Lesson 1</h3>--}%
%{--<g:render template="old/1Greetings/Chapter"/>--}%
%{--<g:render template="old/2WhatDoYouWantToDo/Chapter"/>--}%