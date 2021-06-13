<%@ page import="net.cherokeedictionary.transliteration.SyllabaryUtil" %>
%{--https://www.smashingmagazine.com/2015/01/designing-for-print-with-css/--}%
<style>
@page {
    size: 5.5in 8.5in;
}
@page :left {
    /*margin-left: 3cm;*/
    @bottom-left {
        margin: 10pt 0 30pt 0;
        border-top: .25pt solid #666;
        content: "My book";
        font-size: 9pt;
        color: #333;
    }
}

@page :right {
    /*margin-left: 4cm;*/
    @bottom-right {
        content: counter(page);
    }
}
@page :first {

}
@page :blank {
    @top-center { content: "This page is intentionally left blank." }
}

table, figure {
    page-break-inside: avoid;
}

.column {
    float: left;
    width: 50%;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}
.redPhonetic {
    color: red
}

.linkLook {
    color: blue;
    text-decoration: underline;
}
</style>


https://www.youtube.com/watch?v=ERD05x0JWoI -- use his ideas too because they seem like what I do<br/><br/>

%{--<%lst.each {--}%
%{--out << it << "<br/>"--}%

%{--}%> --}%
<% def su = new SyllabaryUtil()
def phraseList = []
phraseList << "ᏣᏂ<sup>3</sup> ᎦᏍᎩᎶ ᎤᏬᎳ ᎪᏪᎵᎠ"
phraseList << "ᏑᏌᏂ<sup>2</sup> ᎦᏍᎩᎶ ᎤᏬᎳ ᏗᎪᏪᎵ ᎠᎪᎵᏰᎠ"
phraseList << "ᎺᎵ<sup>6</sup> ᎤᎵᏗᏨ ᎤᏔᏅ ᏗᎧᏃᎩᏍᏗ ᎦᏙᎦ"
phraseList << "ᏘᎼᏘ<sup>5</sup> ᏍᏆᏞᏍᏗ ᎤᏕᎦ"
def englishPhraseList = []
englishPhraseList << "John<sup>3</sup> is sitting at the table writing."
englishPhraseList << "Susan<sup>2</sup> is sitting in the chair reading a book."
englishPhraseList << "Mary<sup>6</sup> is standing next to the piano."
englishPhraseList << "Timothy<sup>5</sup> is playing with a ball."
def japanesePhraseList = []
japanesePhraseList << "John <sup> 3 </ sup>はテーブルに座っています。"
japanesePhraseList << "スーザン<sup> 2 </ sup>は椅子に座って本を読んでいます。"
japanesePhraseList << "メアリー<sup> 6 </ sup>はピアノの隣に立っています。"
japanesePhraseList << "Timothy <sup> 5 </ sup>はボールで遊んでいます。"
def russianPhraseList = []
russianPhraseList << "Джон <sup> 3 </ sup> сидит за столом."
russianPhraseList << "Сьюзен <sup> 2 </ sup> сидит на стуле и читает книгу."
russianPhraseList << "Мэри <sup> 6 </ sup> стоит рядом с фортепиано."
russianPhraseList << "Тимоти <sup> 5 </ sup> играет с мячом."
def arabicPhraseList = []
arabicPhraseList << "جون <sup> 3 </ sup> يجلس على الطاولة."
arabicPhraseList << "سوزان <sup> 2 </ sup> تجلس على كرسي وتقرأ كتابًا."
arabicPhraseList << "تقف ماري <sup> 6 </ sup> بجوار البيانو."
arabicPhraseList << "تيموثي <sup> 5 </ sup> يلعب بالكرة."
def germanPhraseList = []
germanPhraseList << "John <sup> 3 </ sup> sitzt am Tisch."
germanPhraseList << "Susan <sup> 2 </ sup> sitzt auf einem Stuhl und liest ein Buch."
germanPhraseList << "Mary <sup> 6 </ sup> steht neben dem Klavier."
germanPhraseList << "Timothy <sup> 5 </ sup> spielt mit einem Ball."
def spanishPhraseList = []
spanishPhraseList << "John <sup> 3 </ sup> está sentado a la mesa."
spanishPhraseList << "Susan <sup> 2 </ sup> está sentada en una silla y leyendo un libro."
spanishPhraseList << "Mary <sup> 6 </ sup> se para al lado del piano."
spanishPhraseList << "Timothy <sup> 5 </ sup> está jugando con una pelota."

def translatePhraseList = englishPhraseList
%>

%{--Mickel was here 11 years, so I have big shoes to fill. He left a legacy of great shows and exhibits that he put together for the Heritage Center,” she said. “My hope is to continue that legacy while bringing new eyes and new things to the table."<br/>--}%
%{--ᏌᏚ ᏧᏕᏘᏴᏛ ᏚᎸᏫᏍᏓᏁᎸ ᎨᏌ Mickel, ᎣᏍᏛ ᏄᏛᏁᎴ ᎣᎯᏍᏗ ᏧᎾᏟᎶᏍᏔᏅ ᎬᏂᎨᏒ ᏂᏕᎬᏁᎲ ᎠᎴ ᎠᎾᏛᏁᎵᏍᎬ ᎠᎭᏂ ᏣᎳᎩᎯ ᏧᎾᏓᎴᏅ ᎠᏰᎵ ᎠᏆᏚᎵ ᎪᎱᏍᏗ ᎢᏤ ᎠᎴ ᏧᏓᎴᏅᏓ ᏧᎾᏟᎶᏍᏔᏅ ᎠᎴ ᎤᎾᏛᏁᎸᏗ ᎠᎩᏲᎯᏍᏗ ᎠᎭᏂ ᏣᎳᎩᎯ ᏧᎾᏓᎴᏅ ᎠᏰᎵ, ᎾᏞᎬᏊ ᎯᎸᏍᎩ ᏧᏓᎴᏅᏓ ᎠᎾᏛᏁᎵᏍᎬ ᎠᎪᏩᏛᏗ ᎨᏎᏍᏗ.<br/>--}%
%{--كان ميكيل هنا منذ 11 عامًا ، لذلك لدي أحذية كبيرة لأملأها. لقد ترك إرثًا من العروض والمعارض الرائعة التي جمعها معًا لمركز التراث ". "آمل أن أستمر في هذا الإرث مع جلب أعين جديدة وأشياء جديدة إلى الطاولة".<br/>--}%
%{--Микель был здесь 11 лет, поэтому у меня есть большие ботинки, чтобы заполнить. Он оставил в наследство великолепные шоу и экспонаты, которые он собрал для Центра наследия », - сказала она. «Я надеюсь продолжить это наследие, привлекая новые глаза и новые вещи к столу».<br/>--}%
%{--Mickel estuvo aquí 11 años, así que tengo zapatos grandes que llenar. Dejó un legado de grandes espectáculos y exhibiciones que reunió para el Heritage Center ”, dijo. "Mi esperanza es continuar con ese legado mientras traemos nuevos ojos y cosas nuevas a la mesa".<br/>--}%
%{--ミケルはここに11年いたので、私は大きな靴を埋めなければなりません。 彼は遺産センターのために一緒にした素晴らしいショーや展示の遺産を残しました」と彼女は言いました。 「私の希望は、テーブルに新しい目と新しいものをもたらしながら、その遺産を継続することです。」<br/>--}%
%{--<br/><br/><br/>--}%
<pre>
    todo:
    add listening comprehension
    add videos?
    DONE -- add optional language other than English
    add dynamic switch in javascript for language change
    fix anchors so they don't push to the top of the page - some other way to do this
</pre>

<%=  su.tsalagiToSyllabary("unalihelijeti") %><br/>
<h3>Dialect Breakdown - Otali vs Giduwah</h3>
The Giduwah, or Eastern, dialect of Cherokee varies in some ways from the Otali, or Western, dialect dialect of Cherokee.  A simple example is <g:translit src="hawa"/> (G) vs <g:translit src="howa"/> (O).  Different spellings, same word.  Both mean "ok, alright, sure" The word "<g:translit src="howa"/>" is an affirmative response and can be understood to mean different things depending on how it is used. Two of the more common meanings are “Okay” and “You are welcome”.<g:citation src="Cherokee Lessons Chapter 4 pp 35, Michael Joyner"/>

<br/><br/>
<h1><g:translit src="Sagwu"/> - Lesson 1</h1>
<span id="hideTranslit" class="linkLook">SHOW/HIDE TRANSLITERATIONS</span> |
<span id="showGrammar" class="linkLook">SHOW/HIDE GRAMMAR LESSON</span> |
<span id="hideEnglish" class="linkLook">SHOW/HIDE ENGLISH</span> |
<span id="hideSyllabary" class="linkLook">SHOW/HIDE SYLLABARY</span><br/><br/>
Greet Others<br/>
What You Will Learn<br/>
In this unit you will learn:<br/>
<ol>
    <li>How to greet people
    <li>How to make short descriptive phrases
    <li>About definites and indefinites
    <li>Say "hello" and "good  bye"
    <li>Ask how someone is doing
</ol>


<h3>Section 1</h3>
<g:printWholeLesson sentences="${lesson1Sentences}"/>
<div class="grammarLesson" style="display:none">
    <h3>Hello - <g:translit src="osiyo"/></h3>
    In Cherokee there is only one way to say 'Good Morning,' 'Good Afternoon,' 'Good Evening,' and Hello; that is by saying <g:translit src="osiyo"/> (o)siyo or the shortened version <g:translit src="siyo"/> siyo.
    <br/>In this book we will follow the convention of placing optional syllables in parenthesis.  You will see this written as (O)siyo.  The parentheses around the 'O' mean that the voicing of the 'O' is optional.
    <br/>Osi will be discussed more in the section <a href="#tohiosi">Word Breakdown - Tohi and Osi</a>
</div>

<h3>Section 2</h3>
<g:printWholeLesson sentences="${lesson1aSentences}"/>
<div class="grammarLesson" style="display:none">
    <h3>Good Bye - <g:translit src="donadagohvi"/></h3>
    There is no word for 'good bye' only 'to meet again'. The way to say 'good bye' to one person is <g:translit src="donadagohvi"/> donadagohvi. If you would like to say 'good bye' to more than one person you would say <g:translit src="dodadagohvi"/> dodadagohvi.  Lit: Let's meet again.
    <br/>We will discuss the plurality prefixes (d-) in the section <a href="#pluralityPrefixes">Word Breakdown - Plurality Prefixes</a>

    <a name="tohiosi"></a>
    <h3>Word Breakdown - <g:translit src="dohi"/> and <g:translit src="osi"/> Tohi and Osi</h3>
    Altman and Belt (pp91-92) have this to say about Tohi and Osi:<br/>
    Tohi is a Cherokee morpheme that indicates the state in which nature is flowing at its appropriate pace and everything is as it should be. This fundamental concept is used in greetings and responses ("Tohigwatsv?" "Tohigwu."), and in a variety of other instances and constructions that indicate an underlying concern with the notion that things be flowing well in the Cherokee world. Tohi can be glossed variously as “well,” “peaceful,” “unhurried,” and “health.” In the Cherokee speakers’ view, if the state of tohi becomes disrupted there can be disastrous consequences, and communities that are disrupted in this way can be dangerous or unhealthy places to live.
    In addition to and as an adjunct to tohi, the concept of osi describes the proper state of the individual person. Visualized as upright, facing forward, and resting on a single point of balance, osi is also used in greetings and replies (“osigwatsv?” “osigwu.”), and in other contexts that indicate that the notion of an individual’s state of being is crucial in ensuring that all is flowing well in the larger Cherokee world. Osi is properly understood as referring to the state of neutrality and balance, but it is most often glossed as “good.” If individuals are out of balance, they can cause problems in the larger system.
    <g:citation src="Cherokee History through a Cherokee Lens PP 91-92 Heidi M. Altman and Thomas N. Belt https://muse.jhu.edu/article/368501"/>
    <h3>-<g:translit src="dv"/> ending</h3>
</div>
<br/>
<div style="display:table">
    <div style="display:table-row">
        <div style="display:table-cell"><img src="<g:assetPath src="mystyle/LivingRoom.png"/>"/></div>
        <div style="display:table-cell;vertical-align: top">
            <div id="toggleLat" class="linkLook">Show/Hide Phonetic</div>
            <div id="toggleEn" class="linkLook">Show/Hide English</div>
            <pre><%
                phraseList.eachWithIndex{str, idx ->
                    out << raw("<div id=\"syll$idx\" style=\"display:block\">$str</div>")
                    out << raw("<div id=\"lat$idx\" style=\"display:block\">${su.parseSyllabaryWithPunctuationAndLatin(str)}</div>")
                    out << raw("<div id=\"en$idx\" style=\"display:block\">${translatePhraseList.get(idx)}</div>")
                    out << "<br/>"
                }%>
            </pre>
        </div>
    </div>
</div>
<br/>

<br/>
<br/>
CHEROKEE, N.C. – Cherokee language custodians from the Cherokee Nation, Eastern Band of Cherokee Indians and United Keetoowah Band are preserving and broadening their vocabularies one word at a time.<br/>
ᏣᎳᎩ, N. C. – ᏣᎳᎩ ᎦᏬᏂᎯᏍᏗ ᎤᎦᏎᏍᏗᏕᎦ ᏂᏓᏳᏂᎩᏓ ᏣᎳᎩ ᎠᏰᎵ, ᏣᎳᎩᏱ ᎠᏰᎵ ᎠᎴ ᎠᏂᎩᏚᏩᎩ ᎠᏂᏴᏫᏯ ᎾᎿ ᎠᎾᎵᏏᏅᏗᎭ ᎠᎴ ᎤᎪᏓ ᏂᏓᏅᏁ ᏗᎧᏁᎢᏍᏗ ᏌᏊᎭᎢ ᎧᏁᎢᏍᏗ.<br/>
<br/>
Vocabulary<br/>
ᎧᏁᎢᏍᏗ - word<br/>
<br/>
<br/>
<br/>
<img src="<g:assetPath src="mystyle/pg4_5.png"/>"/>
<pre>
    where is the radio?
    what is the boy that is standing doing?
    where is the sponge?
    what is in the sink?
</pre>

<div style="display:table;">
    <div style="display:table-row">
        <div style="display:table-cell;vertical-align:top;padding-right:10px">
            <img src="<g:assetPath src="mystyle/hotel.png"/>" style="width:200px"/><br/>
            Ich gehe ins Hotel.
        </div>
        <div style="display:table-cell;vertical-align: top">
            <img src="<g:assetPath src="mystyle/restaurant.png"/>" style="width:200px"/><br/>
            Ich gehe ins Restaurant.
        </div>
    </div>
</div>

<div style="display:table;">
    <div style="display:table-row">
        <div style="display:table-cell;vertical-align:top;padding-right:10px">
            <g:translit src="Osiyo.  Jani daquadoa."/>
        </div>
        <div style="display:table-cell;vertical-align: top">
            Hello.  My name is John.
        </div>
    </div>
</div>