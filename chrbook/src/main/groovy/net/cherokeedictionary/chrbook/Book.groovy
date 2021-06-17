package net.cherokeedictionary.chrbook

import net.cherokeedictionary.chrbook.format.AsciidocFormat
import net.cherokeedictionary.chrbook.format.LatexFormat
import net.cherokeedictionary.chrbook.sections.ColorsSection
import net.cherokeedictionary.chrbook.sections.DatesSection
import net.cherokeedictionary.chrbook.sections.MonthsSection
import net.cherokeedictionary.chrbook.sections.NumbersSection
import net.cherokeedictionary.chrbook.sections.ShapesSection
import net.cherokeedictionary.chrbook.sections.TimesSection
import net.cherokeedictionary.chrbook.sections.WhatIsYourNameSection
import net.cherokeedictionary.transliteration.SyllabaryUtil
import net.cherokeedictionary.chrbook.sections.GreetingsSection

//https://www.overleaf.com/learn/latex/Bold,_italics_and_underlining
//def format = new AsciidocFormat()
def format = new LatexFormat()
def extension = format.extension
//def bindMap = new LinkedHashMap<String, String>()
def citationIndex = 0
def citationMap = new LinkedHashMap<String, String>()
def answerKey = new LinkedHashMap<String, String>()

def output = new File("bookOutput/book.${extension}")
def bibliography = new File("bookOutput/bibliography.${extension}")
def readerFile = new File("bookOutput/reader.${extension}")
def answerFile = new File("bookOutput/answerGuide.${extension}")
def oldStuffFile = new File("bookOutput/oldresearch.${extension}")
def appendiciesFile = new File("bookOutput/appendicies.${extension}")
def chartsFile = new File("bookOutput/charts.${extension}")
def grammarFile = new File("bookOutput/grammar.${extension}")

output.write("")
bibliography.write("")
readerFile.write("")
answerFile.write("")
oldStuffFile.write("")
appendiciesFile.write("")
chartsFile.write("")
grammarFile.write("")

def path = "/projects/GoogleDriveTimo/Cherokee Umbrella"
//def path = "w:/cherokeeumbrella"

def books = [:]
books.put("begCher", "/books/BeginningCherokeeSearchable04.pdf")

output.append(format.title)

def clearCitations = {
    citationIndex = 0
    citationMap = new LinkedHashMap<String, String>()
}

def out = {sb ->
    output.append(sb.toString())
}

def chapter = { baseSection, closure ->
    def sb = new StringBuilder()
    def titleName = baseSection.title
    def titleTranslit = SyllabaryUtil.tsalagiToSyllabary(baseSection.titleTranslit)
    def title = "${titleName} - ${titleTranslit}"
    sb << format.chapter(titleName, titleTranslit, title)

    output.append(sb.toString())
    closure()
}

def whatYouWillLearn = {baseSection ->
    def objectives = baseSection.topics

    output.append(format.whatYouWillLearn(objectives).toString())
}

def dialog = {baseSection, showPhonetic=true ->
    out(format.dialog(baseSection, showPhonetic))
}

def vocabulary = {src ->
    out(format.vocabulary(src))
}

def transl = {
    return format.transl(it)
}

def bookSection = { title, phonetic, closure ->
    out(format.bookSection(title, phonetic))
    closure()
}

def footnote = {src, linkTitle=null, link=null ->
    out(format.footnote(src, linkTitle, link))
}

def br = {
    output.append(format.br())
}

def pre = {
    output.append(format.pre())
}

def text = {
    output.append(it)
}

def redSpan = {
    return format.redSpan(it)
}

def exercise = {displayText, answers, displaySyllabary=true ->
    if (answers) {
        answerKey."${displayText}" = answers
    }
    out(format.exercise(displayText, answers, displaySyllabary))
}

def citation = {title, src ->
    citationIndex++
    citationMap[title] = src

    out(format.citation(title))
}

def printCitations = {
    bibliography.append(format.printCitations(citationMap).toString())
}

def wordBreakdown = {title, anchor, closure ->
    out(format.wordBreakdown(title, anchor))
    closure()
}

def answerKeyPrint = {
    answerFile.append(format.answerKeyPrint(answerKey).toString())
}

def reader = {
    readerFile.append(format.reader(answerKey).toString())
}

def textf = {src, style ->
    return format.textf(src, style)
}

def genericChapter = {baseSection, closure ->
    chapter(baseSection) {
        whatYouWillLearn(baseSection)
        dialog(baseSection)
        vocabulary(baseSection.vocabulary)
        closure()
    }
}

def pdf = {fileName, pages, appender ->
    def pagez = pages ? "[pages={${pages}}]" : ""
    appender.append("\\includepdf${pagez}{${path}${fileName}}\n")
}

def walc1 = {pages, appender=output ->
    pdf("/sort/timo/walc1.pdf", pages, appender)
}

def greetingsSection = new GreetingsSection()
def whatIsYourNameSection = new WhatIsYourNameSection()
def numbersSection = new NumbersSection()
def colorsSection = new ColorsSection()
def shapesSection = new ShapesSection()
def datesSection = new DatesSection()
def monthsSection = new MonthsSection()
def timesSection = new TimesSection()

/*
%{--<g:render template="gsf/sections/titleTOC" model="[tableOfContents: tableOfContents]"/>--}%
%{--<pre>
Dedication
From The Author
</pre>
<pre>
Greetings
Do you speak Cherokee?
    ${greetingsSection.linkTitle}
${whatIsYourNameSection.linkTitle}
Where are you from?
I\d like you to meet
Do you understand?
</pre>--}%
%{--<g:render template="gsf/layout/chapterLayout" model="[baseSection: greetingsSection, isPrintVersion:isPrintVersion, showPhonetic:true]">--}%
%{--    <g:render template="gsf/sections/hello" model="[showExercise:true]"/>--}%
%{--    <br/>--}%
%{--    <g:render template="gsf/sections/goodbye" model="[showExercise:true]"/>--}%
%{--</g:render>--}%
%{--<g:render template="gsf/chapters/WhatIsYourName" model="[baseSection: whatIsYourNameSection, isPrintVersion:isPrintVersion]"/>
<pre>
Numbers and Money
Cardinal Numbers
Ordinal Numbers
Money
</pre>
<g:render template="gsf/chapters/Numbers" model="[baseSection: numbersSection, isPrintVersion:isPrintVersion]"/>
<pre>
On the Telephone

Address and Email

Dates, Months, and Days of Week
</pre>
<g:render template="gsf/chapters/Dates" model="[baseSection: datesSection, isPrintVersion:isPrintVersion]"/>
<g:render template="gsf/chapters/Months" model="[baseSection: monthsSection, isPrintVersion:isPrintVersion]"/>
<g:render template="gsf/chapters/Times" model="[baseSection: timesSection, isPrintVersion:isPrintVersion]"/>
<pre>
Special Occasions

Describing Things</pre>
<g:render template="gsf/chapters/Colors" model="[baseSection: colorsSection, isPrintVersion:isPrintVersion]"/>
<pre>Clothes and Shopping
Describing Others
</pre>
Shapes
<g:render template="gsf/chapters/Shapes" model="[baseSection: shapesSection, isPrintVersion:isPrintVersion]"/>
<pre>
Food, eating, drinking
Breakfast, Coffee, Lunch, Dinner, Dating
are you hungry

Directions, where is something, directions around town
Weather, Seasons

Profession
Body Parts \& Functions
5 senses
Emotions

Seasons
This and That
Family

This \& That
Possessive
Animals

On the farm
Visiting Friends
Verb Conjugation
Yours, Mine, Ours
At the doctor
Around the House
At the beach
Transportation
Festivals and Celebrations
At the airport

I want.  I see
Questions
Pronouns
Singular/Plural
Derived Nouns
Articles and Conversion
prepositions
conjunctions
interjections
negation
To Have and Have Not
Advanced Verb
Clitics
</pre>

Grammar Summary<br/>
<g:render template="gsf/sections/dialect"/>
<g:render template="gsf/sections/tohiDohiWordBreakdownQuote"/>
<g:render template="gsf/sections/daysOfWeekMeaning"/>
<br/><br/>
<br/>Charts<br/>
*/

clearCitations()

out(format.chapter("Pronunciation and Syllabary", "", "Pronunciation and Syllabary - "))

walc1("9-10, 109")

genericChapter(greetingsSection) {
    bookSection("Hello","osiyo") {
        text"In Cherokee there is only one way to say 'Good Morning,' 'Good Afternoon,' 'Good Evening,' and Hello; that is by saying ${transl("osiyo")} ${redSpan("(o)siyo")} or the shortened version ${transl("siyo")} ${redSpan("siyo")}."
        footnote("We will follow the convention of placing optional syllables in parenthesis.  You will see this written as (O)siyo.  The parentheses around the 'O' mean that the voicing of the 'O' is optional.")
        footnote("Osi will be discussed more in the section ", "Word Breakdown - Tohi and Osi", "wordBreakdownTohiOsi")
//        ["Hello, Mary", "Hello, Mark", "Hello, Daniel", "Hello, Susan"]}" answers="${["1. (O)siyo, Meli.", "(O)siyo, Maga.", "(O)siyo, Danili", "(O)siyo, Susani"]
        //if (showExercise) {
        exercise("1. Hello, Mary 2. Hello, Mark 3. Hello, Daniel 4. Hello, Susan", "1. (O)siyo, Meli. 2. (O)siyo, Maga. 3. (O)siyo, Danili 4. (O)siyo, Susani", false)
    }
    bookSection("Goodbye", "donadagohvi") {
        text "There is no word for 'goodbye' only 'to meet again'. The way to say 'goodbye' to one person is ${transl("donadagohvi")} ${redSpan("donadagohvi")}. If you would like to say 'goodbye' to more than one person you would say ${transl("dodadagohvi")} ${redSpan("dodadagohvi")}.  Lit: Let's meet again."
        footnote("We will discuss the plurality prefixes (d-) in the section ", "Word Breakdown - Plurality Prefixes", "wordBreakdownPluralityPrefixes")
        exercise("1. Goodbye, Mary and John. 2. Goodbye, Titus. 3. Goodbye, Daniel. 4. Goodbye, Mary, John, Susan, and Mark.", "1. Dodadagohvi, Meli ale Jani. 2. Donadagohvi, Dadasi 3. Donadagohvi, Danili 4. Dodadagohvi, Meli, Jani, Susani, ale Maga", false)
    }
}

genericChapter(whatIsYourNameSection) {
    def str = """
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
    """
    text(str)
}

genericChapter(numbersSection) {
    bookSection("Cardinal Numbers", "") {
        text("Cardinal Numbers are any of the numbers that express amount, as one, two, three,  etc. (distinguished from ordinal number).")
        citation("cardinalNumbers", "http://dictionary.reference.com/browse/cardinal+numbers?s=t")
        br()
        br()
        text("Cardinal numbers answer the question: How many are there? and tell the total.")
    }

    bookSection("Ordinal Numbers", "") {
        text("Cardinal numbers are any of the numbers that express degree, quality, or position in a series, as first, second, and third  (distinguished from cardinal number ).")
        citation("ordinalNumbers", "http://dictionary.reference.com/browse/ordinal+numbers?s=t")
        br()
        br()
        text("Ordinal numbers answer the question: Where does it fit in a numbered set? and tell the order.")
        br()
        br()
        text("Ord(inal) - Ord(er)")
    }
}

genericChapter(monthsSection) {
    footnote("Discussed in the section ", "Days Of Week Meanings", "daysOfWeekMeaning")
}

genericChapter(datesSection) {
    footnote("Discussed in the section ", "Days Of Week Meanings", "daysOfWeekMeaning")
}

genericChapter(timesSection) {
    text("REMOVE")
    footnote("Any time after 12:00 p.m. until the sun starts to set.")
    footnote("The time of day when the sun is setting.")
    footnote("The time somewhere in the late time of night like 12:00 a.m.")
    citation("walcpp47", "walc pp47")
}

genericChapter(colorsSection) {}

genericChapter(shapesSection) {}

def notesName = "NOTES:"
def notesTranslit = SyllabaryUtil.mixedTransliteration("dadadugv goweli")
def notesTitle = "${notesName} - ${notesTranslit}"
out(format.chapter(notesName, notesTranslit, notesTitle))
bookSection("Dialect Breakdown", "Otali - Giduwa") {
    text("The Giduwah, or Eastern, dialect of Cherokee varies in some ways from the Otali, or Western, dialect dialect of Cherokee.  A simple example is ${transl("hawa")} (G) vs ${transl("howa")} (O).  Different spellings, same word.  Both mean \"ok, alright, sure\".  The word \"${transl("howa")}\" is an affirmative response and can be understood to mean different things depending on how it is used. Two of the more common meanings are \"Okay\" and \"You are welcome\".")
    citation("joynerlesson4", "Cherokee Lessons Michael Joyner")
}

wordBreakdown("${transl("dohi")} and ${transl("osi")} Tohi and Osi", "wordBreakdownTohiOsi") {
    text "Altman and Belt (pp91-92) have this to say about Tohi and Osi:Tohi is a Cherokee morpheme that indicates the state in which nature is flowing at its appropriate pace and everything is as it should be. This fundamental concept is used in greetings and responses (${redSpan("Tohigwatsv?")} and ${redSpan("Tohigwu.")}), and in a variety of other instances and constructions that indicate an underlying concern with the notion that things be flowing well in the Cherokee world. Tohi can be glossed variously as \"well,\" \"peaceful,\" \"unhurried,\" and \"health.\" In the Cherokee speakers' view, if the state of tohi becomes disrupted there can be disastrous consequences, and communities that are disrupted in this way can be dangerous or unhealthy places to live."
    br()
    br()
    text "In addition to and as an adjunct to tohi, the concept of osi describes the proper state of the individual person. Visualized as upright, facing forward, and resting on a single point of balance, osi is also used in greetings and replies (${redSpan("osigwatsv?")} and ${redSpan("osigwu.")}), and in other contexts that indicate that the notion of an individual’s state of being is crucial in ensuring that all is flowing well in the larger Cherokee world. Osi is properly understood as referring to the state of neutrality and balance, but it is most often glossed as \"good.\" If individuals are out of balance, they can cause problems in the larger system."
    citation("altmanBelt90-98", "Altman, H.M., & Belt, T.N. (2008). Reading History: Cherokee History through a Cherokee Lens. Native South 1, 90-98. http://doi.org/10.1353/nso.0.0003")
}

wordBreakdown("Notes on the meanings of the days of the week", "daysOfWeekMeaning") {
    text("Notes on the meanings of the days of the week:")
    citation("walc1pp46", "We Are Learning Cherokee pp46")
    br()
    text("${textf("Unadodagwonvi", "i")} - When they have completed doing something all day")
    br()
    text("${textf("Ta’line iga", "i")} - The second day")
    br()
    text "${textf("Jo’ine iga", "i")} - The third day"
    br()
    text "${textf("Nvhgine iga", "i")} - The fourth day"
    br()
    text "${textf("Jun(v)gilosdi", "i")} - The day they wash their clothes"
    footnote("The first way to say Friday was actually \"hisgine\'iga\" which means \"the fifth day.\"")
    br()
    text "${textf("Unadodagwidena", "i")} - The day before they do something all day (when you went to town)"
    br()
    text "${textf("Unadodagwasgv’i", "i")} - The day they do something all day."
}

reader()
walc1("36-37,91-92,95, 108", readerFile)

answerKeyPrint()

//pdf("/cherokee/grammar/evaG/Pronoun Prefixes A and B hand.pdf", "", grammarFile)
//pdf("/cherokee/grammar/evaG/Say It_Persons.pdf", "", grammarFile)
//pdf("/cherokee/grammar/evaG/Say It_Vtab.pdf", "", grammarFile)
//pdf("/cherokee/grammar/evaG/Get Angry_Vtab.pdf", "", grammarFile)
//pdf("/cherokee/grammar/evaG/Get Angry_Persons.pdf", "", grammarFile)
//pdf("/cherokee/grammar/evaG/MatrixSay_Persons.pdf", "", grammarFile)
walc1("66,68-79,82,103-105", grammarFile)
walc1("14-18, 20-27", grammarFile)


//on mac
def charts = """\\chapter{Appendix A - Charts}
%\\includepdf[noautoscale,landscape, angle=-90, pages={1}]{${path}/charts/cnosite/3D Solar System.jpg}
%\\includepdf[angle=90]{${path}/charts/cnosite/3DSolarSystem.jpg}

\\includegraphics{${path}/charts/cnosite/3DSolarSystem.jpg}
%\\includepdf{${path}/charts/cnosite/3DSolarSystem.jpg}
\\includepdf{${path}/charts/cnosite/Africa.pdf}
\\includepdf{${path}/charts/cnosite/Antarctica.pdf}
\\includepdf{${path}/charts/cnosite/AsiaandPacific.pdf}
\\includepdf{${path}/charts/cnosite/BodyParts.pdf}
\\includepdf{${path}/charts/cnosite/Canada.pdf}
\\includepdf{${path}/charts/cnosite/CentralandEasternEurope.pdf}
\\includepdf{${path}/charts/cnosite/CommunitySpeakerEnglish.pdf}
\\includepdf{${path}/charts/cnosite/CommunitySpeakerMap1.pdf}
\\includepdf{${path}/charts/cnosite/Continents.pdf}
\\includegraphics{${path}/charts/cnosite/DolphinDiagram.jpg}
\\includepdf{${path}/charts/cnosite/Europe.pdf}
\\includepdf{${path}/charts/cnosite/HumanBody.pdf}
\\includepdf{${path}/charts/cnosite/HumanSkeleton.pdf}
\\includegraphics{${path}/charts/cnosite/Individual50States.png}
\\includepdf{${path}/charts/cnosite/MexicoandSouthAmerica.pdf}
\\includepdf{${path}/charts/cnosite/MidEast.pdf}
\\includepdf{${path}/charts/cnosite/OfficeOnline.pdf}
\\includepdf{${path}/charts/cnosite/OklahomaCountiesMap.pdf}
\\includepdf{${path}/charts/cnosite/Semedite.pdf}
\\includegraphics{${path}/charts/cnosite/SolarSystem.jpg}
\\includepdf{${path}/charts/cnosite/UnitedStates.pdf}
\\includegraphics{${path}/charts/cnosite/WashingHands.jpg}
\\includepdf{${path}/charts/cnosite/World16x29.pdf}"""

chartsFile.append(charts)

printCitations()

oldStuffFile.append("""
%\\includepdf[pages=43-45, trim=55 100 45 250, clip=true]{${path}${books.begCher}}
%\\includepdf[pages=43-45]{${path}${books.begCher}}
%\\chapter{CHAPTER2}
\\chapter{CHAPTER 3}
\\includepdf[pages={43-45, 84-88}]{${path}${books.begCher}}
\\cite{holmessmith3234}

%\\chapter{CHAPTER 4}

\\chapter{CHAPTER 5}
\\includepdf[pages={102-105, 109-113, 132-136, 92-95, 118-125, 79,80, 151-157}]{${path}${books.begCher}}

\\chapter{CHAPTER 6}
\\includepdf[pages={16-18, 59-63, 39-43}]{${path}${books.begCher}}

\\chapter{CHAPTER 7}
\\includepdf[pages={47-50, 85}]{${path}${books.begCher}}

\\chapter{CHAPTER 8}
\\includepdf[pages={173,174, 129-137, 149-156, 159-168, 175-182}]{${path}${books.begCher}}

\\chapter{CHAPTER 9}
\\includepdf[pages={245-252}]{${path}${books.begCher}}

\\chapter{CHAPTER 10}
\\includepdf[pages={205-210, 213-223}]{${path}${books.begCher}}

\\chapter{CHAPTER 11}
\\includepdf[pages={226-233, 236-242}]{${path}${books.begCher}}

\\chapter{CHAPTER 12}
\\includepdf[pages={186-198, 325-330, 22-26}]{${path}${books.begCher}}

\\cite{cherokeeNationDownloads}
""")