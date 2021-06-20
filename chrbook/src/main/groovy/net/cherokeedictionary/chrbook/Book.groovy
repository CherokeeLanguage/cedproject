package net.cherokeedictionary.chrbook

import net.cherokeedictionary.chrbook.format.AsciidocFormat
import net.cherokeedictionary.chrbook.format.LatexFormat
import net.cherokeedictionary.chrbook.sections.ColorsSection
import net.cherokeedictionary.chrbook.sections.DatesSection
import net.cherokeedictionary.chrbook.sections.MonthsSection
import net.cherokeedictionary.chrbook.sections.NumbersSection
import net.cherokeedictionary.chrbook.sections.SeasonsSection
import net.cherokeedictionary.chrbook.sections.ShapesSection
import net.cherokeedictionary.chrbook.sections.TimesSection
import net.cherokeedictionary.chrbook.sections.WeatherSection
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

def greetingsSection = new GreetingsSection()
def whatIsYourNameSection = new WhatIsYourNameSection()
def numbersSection = new NumbersSection()
def colorsSection = new ColorsSection()
def shapesSection = new ShapesSection()
def datesSection = new DatesSection()
def monthsSection = new MonthsSection()
def timesSection = new TimesSection()
def seasonsSection = new SeasonsSection()
def weatherSection = new WeatherSection()

def path = "/projects/GoogleDriveTimo/Cherokee Umbrella"
//def path = "W:/GOOGLEDRIVE/Cherokee Umbrella"

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

def footnote = {src, linkTitle=null, link=null, isInternal=true ->
    out(format.footnote(src, linkTitle, link, isInternal))
}

def br = {
    println "break"
    output.append(format.br)
}

def pre = {
    output << format.pre
}

def text = {
    output.append(it)
}

def tbr = {
    text("${it}\\\\\n")
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
        text "\\newpage"
        dialog(baseSection)
        text "\\vfill"
        text "\\newpage"
        vocabulary(baseSection.vocabulary)
        closure()
    }
}

def sent = {en, chr ->
    output.append("${en}\\newline ${redSpan(transl(chr))}")
}

def pdf = {fileName, pages, appender ->
    def pagez = pages ? "[pages={${pages}}]" : ""
    appender.append("\\includepdf${pagez}{${path}${fileName}}\n")
}

def walc1 = {pages, appender=output ->
    pdf("/sort/timo/walc1.pdf", pages, appender)
}

def noindent = {appender=output ->
    appender.append("\\noindent")
}

def nChapter = {title, closure ->
    def sb = new StringBuilder()
    sb << format.chapter(title, title, title)

    output << sb.toString()

    closure()
}

clearCitations

out(format.chapter("Pronunciation and Syllabary", "", "Pronunciation and Syllabary - "))

walc1 "9-10, 109"

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

nChapter("I'd like you to meet...") {
    tbr "[could be in What is your name?]"
    tbr "JAC I'd like you to meet"
    tbr "JAC What's new"
    tbr "JAC have you two met?"
    tbr "JAC glad to have met you"
}

nChapter("I want, I see") {
    tbr "Deal with plurals and I we/want from Ch4"
    tbr "I see 2 apples"
    tbr "I want 4 bananas"
    tbr "I want some grapes"
    tbr "there are some verbs included in the book specifically for this purpose"
}

def vocab = [:]
vocab."Where do you live? (1 person)" = "Hadlv hinela?"//HS pp32#22
vocab."What is your address? (Where written-material it-you-get?" = "Hadlv gowelia dijanesdi?"//HS pp32#28
vocab."My address is ____. (written-material it-I-get-at _____." = "Goweli diginesdi ____."//HS pp33#29

vocab."people, tribe" = "yvwi"//HS pp77
vocab."I am an Indian. (I originate of the real people.)" = "Jiyvwiyadv."//HS pp75#68
vocab."You are an Indian." = "hiyvwiyadv."//HS pp76#69
vocab."Are you an Indian?" = "Hiyvwiyasgohv?"//HS pp76#70
vocab."He is an Indian." = "Ayvwiyadv."//HS pp76#71
vocab."What tribe of Indian does he belong to?" = "Gado usdi ayvwiya?"//HS pp76#72
vocab."Do you speak English?" = "Yunegake hiwonia?"//HS pp76#73
vocab."I am of Osage origin . (I originate as an ...)" = "Asasi jiyvwi."//HS pp76#74
vocab."... as a Delaware" = "Agwanvgi jiyvwi."//HS pp76#74
vocab."... as a Creek" = "Agusa jiyvwi."//HS pp76#74
vocab."... as a White" = "Jiyunega jiyvwi."//HS pp76#74
vocab."American Indian (yv-wi means a people, -ya means basic, real, true, essential)" = "ayvwiya"//HS pp76
vocab."I speak Cherokee a little. (Little I-speak Cherokee)" = "Gaoyotli jiwonia Jalagi."//HS pp76#65

vocab."Do you speak Cherokee a little?" = "Gayotlike hiwonia Jalagi?"//HS pp76#66
vocab."He speaks Cherokee well. (Well-indeed Cherokee he-speaks.)" = "Osdadv Jalagi gawonia."//HS pp76#67
vocab."" = ""
vocab."" = ""

nChapter("Where are you from?") {
    tbr "ARC where are you from?"
    tbr "tell about oklahoma and nc"
    tbr "I am from xyz"
    tbr "pics of nationalities"
    tbr "reference Appendicies"
    tbr "ex10 where are these people from?"
    tbr "ex 12 list xyz of countries (area codes of states?)"
    tbr "where are you?  where are you from?"
    tbr "languages - german"
    tbr "countries - Germany"
    tbr "people - German"
    tbr "english - yonega (according-to-white)"
}

nChapter("Do you speak Tsalagi?") {
    tbr "Do you speak xyz?"
    tbr "JAC do you speak Japanese?"
    tbr "JAC please speak a little slower"
    tbr "other languages"
}

nChapter("on the telephone") {
    tbr "ARC the telephone number is"
    tbr "JAC telephoning"
    tbr "what is your phone number?"
    tbr "ex11 what are the phone numbers and who do they belong to?"
    tbr "contacts list on your phone"
    tbr "email list?"
}

nChapter("Address \\& Email") {
    tbr "JAC my address is"
    tbr "JAC writing and mailing letters"
    tbr "email - NOT JAC - but faxing didn't seem like a current topic"
}

genericChapter(numbersSection) {
    bookSection("Cardinal Numbers", "") {
        text("Cardinal Numbers are any of the numbers that express amount, as one, two, three,  etc. (distinguished from ordinal number).")
        citation("cardinalNumbers", "http://dictionary.reference.com/browse/cardinal+numbers?s=t")
        br
        br
        text("Cardinal numbers answer the question: How many are there? and tell the total.")
    }

    bookSection("Ordinal Numbers", "") {
        text("Cardinal numbers are any of the numbers that express degree, quality, or position in a series, as first, second, and third  (distinguished from cardinal number ).")
        citation("ordinalNumbers", "http://dictionary.reference.com/browse/ordinal+numbers?s=t")
        br
        br
        text("Ordinal numbers answer the question: Where does it fit in a numbered set? and tell the order.")
        br
        br
        text("Ord(inal) - Ord(er)")
    }
}

genericChapter(datesSection) {
    footnote("Discussed in the section ", "Days Of Week Meanings", "daysOfWeekMeaning")
}

genericChapter(timesSection) {
    tbr "Time - Time, and Time of Day"
    tbr "JAC ago"
    tbr "morning, noon, and night"
    tbr "Ask about opening times (museum, movie)"
    citation("walcpp42", "walc pp42")
    citation("walcpp47", "walc pp47")
}

genericChapter(monthsSection) {
    footnote("Discussed in the section ", "Days Of Week Meanings", "daysOfWeekMeaning")
}

genericChapter(seasonsSection) {
    citation("walcpp49", "walc pp49")
    br
    tbr"\\noindent JAC Seasons pp140"
    tbr "In winter"
    tbr "in summer"
    tbr "in autumn, in fall"
    tbr "in spring"
    tbr "June is in the summer"
    tbr "December is in the winter"
}

nChapter("Profession") {
   tbr "JAC profession"
   tbr "Personal details"
   tbr "What do you do?"
   tbr "Different jobs and occupations"
   tbr "personal details [not family unless \"I have 2 kids\"]"
   tbr "At work - looking for a job"
   tbr "at the office"
   tbr "ARC when do you work"
   tbr "pictures of profesions"
}

nChapter("This and That") {
    tbr "Describing things - cars, trucks, buildings, signs"
    tbr "JAC this and that"
    tbr "this and that as describing things.  and basic here, there, this, that, where clause"
    tbr "more indepth in chapter 9"
    tbr "JAC where is it?"
    tbr "JAC here and there"
    tbr "JAC near and far"
    tbr "form phrases like this, that, these, those"
    tbr "describing things holmes smith 98"
}

nChapter("Family") {
    tbr "talking about your family, saying who things belong to, describing things"
    tbr "numbers 21-100"
    tbr "ARC the family"
    tbr "JAC family members"
}

nChapter("To have and have not") {
    tbr "JAC do you have"
    tbr "to have and have not"
}

nChapter("Describing Others") {
    tbr "describing people"
}

nChapter("Directions") {
    tbr "where, where in the town center. where are my clothes"
    tbr "Giving simple directions"
    tbr "talking about more places around town and their location"
    tbr "saying what belongs to whom"
    tbr "ARC around town"
    tbr "agreement (in sentence)"
    tbr "JAC common verb forms"
    tbr "JAC asking a question"
    tbr "where is it?"
    tbr "here and there"
    tbr "near and far"
    tbr "names of places around town"
    tbr "where is the town square (center)?"
    tbr "simple directions"
    tbr "about more places in town and locations"
    tbr "what belongs to whom (continued from last chapter)"
    tbr "ch 27 pp245-252 smith holmes"
    tbr "go straight"
    tbr "make a right"
    tbr "go two blocks"
    tbr "make a left"
    tbr "second house on the right"
    tbr "go north on highway 41"
    tbr "get off at exit 12"
    tbr "make a right (head east)"
    tbr "go to the 4-way stop"
    tbr "go straight one mile"
}

nChapter("At the doctor") {
    tbr "body - body parts and bodily functions"
    tbr "ARC My Head Hurts"
    tbr "ARC the future"
    tbr "ARC Command forms"
    tbr "Body parts"
    tbr "smith holmes pp236-241"
    tbr "i don't feel well"
}

nChapter("To the Beach") {
    tbr "ARC let's go to the beach"
}

nChapter("Transportation") {
    tbr "at the bus stop"
    tbr "at the train station"
    tbr "at the hotel"
    tbr "ARC at the hotel"
    tbr "ARC nationalities"
    tbr "ARC dual form"
    tbr "JAC on the road"
    tbr "JAC bus, train, subway, taxi"
}

nChapter("at the airport") {
    tbr "ARC at the airport"
}

nChapter("Festivals and Celebrations") {
    tbr "festivals"
}

nChapter("Weather") {
    tbr "JAC How is the weather"
}

nChapter("Money") {
    tbr "ARC how much is this?"
    tbr "ARC I would like to change 100"
    tbr "buying things"
    tbr  "food"
    tbr "money"
    tbr "desire"
    tbr "JAC in a restaurant"
    tbr "JAC it costs"
    tbr "JAC shopping"
    tbr "JAC house hunting"
}

nChapter("Clothes and Shopping") {
    tbr "describe clothes"
    tbr "buy different clothing items"
}

nChapter("Animals") {
    tbr "different animals in the wild"
}

genericChapter(colorsSection) {}

genericChapter(shapesSection) {}

genericChapter(weatherSection) {
    noindent
    tbr "JAC Weather pp29"
    tbr "How's the weather today? What's the weather like today?"
    tbr "It's nice weather."
    tbr "It's raining."
    tbr "It's snowing."
    tbr "It's hot."
    tbr "It's cold."
    tbr "It's cool"
    tbr "It's warm"
    tbr "The weather is bad today."
}

nChapter("Food") {
    tbr "ARC this is delicious"
    tbr "ARC verbs"
    tbr "ARC past tense"
    tbr "JAC breakfast"
    tbr "JAC sample menu"
}

nChapter("on the farm") {
    tbr "driving a tractor"
    tbr "harvesting corn"
}

nChapter("Visiting Friends") {
    tbr "I am a guest"
}

nChapter("Yours, Mine, Ours") {
    tbr "our house, your house, etc"
    tbr "JAC my, your, his/her"
    tbr "ARC to have"
    tbr "ARC possessives"
    tbr "ARC Possessive noun construction"
    tbr "JAC it's me"
    tbr "JAC it's mine"
    tbr "JAC about me"
    tbr "JAC to me"
}

nChapter("Questions") {
    tbr "JAC who, what, when, where, how"
    tbr "JAC how much"
    tbr "JAC how many"
    tbr "ARC question words"
}

nChapter("Sort Further") {
    tbr "JAC nouns and noun particles"
    tbr "JAC common adjective forms"
    tbr "JAC plain or polite"
    tbr "JAC to construct polite"
    tbr "JAC some comparisons"
    tbr "JAC also"
    tbr "JAC I have been to..."
    tbr "JAC sometimes I go"
    tbr "JAC i can.  I am able to."
    tbr "JAC I've decided to"
    tbr "JAC the modifiers"
    tbr "JAC the noun maker no"
    tbr "JAC to goJAC a few action phrases"
    tbr "JAC reading section"
    tbr "JAC they say that"
    tbr "JAC I have to, I must"
    tbr "JAC something to drink"
    tbr "JAC a little and a little"
    tbr "JAC too much"
    tbr "JAC more or less"
    tbr "JAC enough and some more"
    tbr "JAC I want to"
    tbr "JAC i intend to"
    tbr "JAC it is supposed to"
    tbr "JAC something, everything, nothing"
    tbr "JAC of course, it's a pitty it doesn' tmatter"
    tbr "JAC the same"
    tbr "JAC already"
    tbr "JAC i like it, it's good"
    tbr "JAC i don't like it, it's bad"
    tbr "JAC reading"
    tbr "JAC some, someone, something"
    tbr "JAC once, twice"
    tbr "JAC up to"
    tbr "JAC i need. it is necessary"
    tbr "JAC i feel like"
    tbr "JAC at the home of"
    tbr "JAC in, on, under"
    tbr "JAC if, when"
    tbr "JAC without"
    tbr "JAC to come"
    tbr "JAC to say"
    tbr "JAC to do"
    tbr "JAC i'm a stranger here"
    tbr "Present, past, future"
    tbr "a story or part of a story in Cherokee - then analyze it"
    tbr "negative command sentences"
}

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
    br
    br
    text "In addition to and as an adjunct to tohi, the concept of osi describes the proper state of the individual person. Visualized as upright, facing forward, and resting on a single point of balance, osi is also used in greetings and replies (${redSpan("osigwatsv?")} and ${redSpan("osigwu.")}), and in other contexts that indicate that the notion of an individual’s state of being is crucial in ensuring that all is flowing well in the larger Cherokee world. Osi is properly understood as referring to the state of neutrality and balance, but it is most often glossed as \"good.\" If individuals are out of balance, they can cause problems in the larger system."
    citation("altmanBelt90-98", "Altman, H.M., & Belt, T.N. (2008). Reading History: Cherokee History through a Cherokee Lens. Native South 1, 90-98. http://doi.org/10.1353/nso.0.0003")
}

wordBreakdown("Notes on the meanings of the days of the week", "daysOfWeekMeaning") {
    tbr "Notes on the meanings of the days of the week:"
    citation("walc1pp46", "We Are Learning Cherokee pp46")
    tbr"${textf("Unadodagwonvi", "i")} - When they have completed doing something all day"
    tbr"${textf("Ta’line iga", "i")} - The second day"
    tbr "${textf("Jo’ine iga", "i")} - The third day"
    tbr "${textf("Nvhgine iga", "i")} - The fourth day"
    tbr "${textf("Jun(v)gilosdi", "i")} - The day they wash their clothes"
    footnote("The first way to say Friday was actually \"hisgine\'iga\" which means \"the fifth day.\"")
    tbr "${textf("Unadodagwidena", "i")} - The day before they do something all day (when you went to town)"
    tbr "${textf("Unadodagwasgv’i", "i")} - The day they do something all day."
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

printCitations

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

