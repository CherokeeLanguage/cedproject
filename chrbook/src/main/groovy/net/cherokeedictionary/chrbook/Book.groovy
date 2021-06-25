package net.cherokeedictionary.chrbook

//TODO: adjust vocabulary for words so they're 2 columns
//TODO: adjust vocabulary so sentences are one column and width is more standard
//TODO: etymologies of words

import net.cherokeedictionary.chrbook.format.AsciidocFormat
import net.cherokeedictionary.chrbook.format.LatexFormat
import net.cherokeedictionary.chrbook.sections.AddressAndEmailSection
import net.cherokeedictionary.chrbook.sections.ClothesAndShoppingSection
import net.cherokeedictionary.chrbook.sections.ColorsSection
import net.cherokeedictionary.chrbook.sections.DatesSection
import net.cherokeedictionary.chrbook.sections.DirectionsSection
import net.cherokeedictionary.chrbook.sections.DoctorSection
import net.cherokeedictionary.chrbook.sections.FamilySection
import net.cherokeedictionary.chrbook.sections.FoodSection
import net.cherokeedictionary.chrbook.sections.MoneySection
import net.cherokeedictionary.chrbook.sections.MonthsSection
import net.cherokeedictionary.chrbook.sections.NumbersSection
import net.cherokeedictionary.chrbook.sections.PeopleAndProfessionsSection
import net.cherokeedictionary.chrbook.sections.SeasonsSection
import net.cherokeedictionary.chrbook.sections.ShapesSection
import net.cherokeedictionary.chrbook.sections.TelephoneSection
import net.cherokeedictionary.chrbook.sections.ThisAndThatSection
import net.cherokeedictionary.chrbook.sections.TimesSection
import net.cherokeedictionary.chrbook.sections.TransportationSection
import net.cherokeedictionary.chrbook.sections.WeatherSection
import net.cherokeedictionary.chrbook.sections.WhatIsYourNameSection
import net.cherokeedictionary.chrbook.sections.WhereAreYouFromSection
import net.cherokeedictionary.chrbook.sections.YoursMineOursSection
import net.cherokeedictionary.chrbook.util.Vocabulary
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

//def path = "/projects/GoogleDriveTimo/Cherokee Umbrella"
def path = "W:/GOOGLEDRIVE/Cherokee Umbrella"

def books = [:]
books.put("begCher", "/books/BeginningCherokeeSearchable04.pdf")
books.put("interCherokee", "/books/intermediate_cherokee_0570773_C0609_howard_gregg_eby_rick.pdf")
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

def vocabulary = {src, showTitle=true ->
    out(format.vocabulary(src, showTitle))
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
    output.append(format.br())
}

def pre = {
    output << format.pre()
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
        if (baseSection.topics.size() > 0) {
            whatYouWillLearn(baseSection)
            text "\\newpage"
        }

        if (baseSection.dialogs.size() > 0) {
            dialog(baseSection)
            text "\\vfill"
            text "\\newpage"
        }

        if (baseSection.vocabularies) {
            vocabulary(baseSection.vocabularies)
        }

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
def peopleAndProfessionsSection = new PeopleAndProfessionsSection()
def moneySection = new MoneySection()
def directionsSection = new DirectionsSection()
def whereAreYouFromSection = new WhereAreYouFromSection()
def telephoneSection = new TelephoneSection()
def addressAndEmailSection = new AddressAndEmailSection()
def thisAndThatSection = new ThisAndThatSection()
def familySection = new FamilySection()
def doctorSection = new DoctorSection()
def transportationSection = new TransportationSection()
def clothesAndShoppingSection = new ClothesAndShoppingSection()
def foodSection = new FoodSection()
def yoursMineOursSection = new YoursMineOursSection()

clearCitations

out(format.chapter("Pronunciation and Syllabary", "", "Pronunciation and Syllabary - "))

walc1 "9-10, 109"

def str = """personal details
meeting people, saying where you are from, simple sentences with is/are, saying there is/there are, numbers 1-10

how you describe yourself
 saying your nationality, saying which languages you speak, talking about more than one object, some places around town, what your profession is

this and that
telling time, asking about opening times, days of the week, numbers 11-20, making phrases and sentences with this that those

our house
family, saying who things belong to, describing things, numbers 21-100

where is the town center?
giving simple directions, talking about more places around town and their location, saying what belongs to whom

what did you do?
 talking about things which happened in the past, means of transport, arabic verbs, saying me,him, them, etc

once upon a time
saying was/were, is/are not; describing something, saying became, a new type of is/are sentence, saying you had done something

more than one
 looking for a job in the paper, looking for a flat or a house, talking about more than one person or thing, saying these/those, talking about two people or things

what do you do?
 saying what you do every day, talking about your interests, saying what you like or dislike, saying what you will do in the future; more about /not/

talking about nationalities

more about describing places, saying who, which, that, passive verbs

recipe, telling people to do something; duals, plurals, possessive

shopping, saying how things are done

sports and leisure activities, talking about colors, describing how or when you have done something

talking about what you hope to do, making suggestions

talking about each, every, all and some, using irregular nouns and adjectives, news from everywhere else"""

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

genericChapter(whatIsYourNameSection) {}

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

genericChapter(whereAreYouFromSection) {}

nChapter("Do you speak Tsalagi?") {
    tbr "Do you speak xyz?"
    tbr "JAC do you speak Japanese?"
    tbr "JAC please speak a little slower"
    tbr "other languages"
}

genericChapter(telephoneSection) {}

genericChapter(addressAndEmailSection) {}

genericChapter(numbersSection) {
    bookSection("Cardinal Numbers", "") {
        text("Cardinal Numbers are any of the numbers that express amount, as one, two, three,  etc. (distinguished from ordinal number).")
        citation("cardinalNumbers", "http://dictionary.reference.com/browse/cardinal+numbers?s=t")
        text "\\\\\\\\\n"
        text"Cardinal numbers answer the question: How many are there? and tell the total."
    }

    bookSection("Ordinal Numbers", "") {
        text("Ordinal numbers are any of the numbers that express degree, quality, or position in a series, as first, second, and third  (distinguished from cardinal number ).")
        citation("ordinalNumbers", "http://dictionary.reference.com/browse/ordinal+numbers?s=t")
        text "\\\\\\\\\n"
        text("\\noindent Ordinal numbers answer the question: Where does it fit in a numbered set? and tell the order.")
        text "\\\\\\\\\n"
        text("\\noindent Ord(inal) - Ord(er)")
        text "\\\\\\\\\n"
        text "Ordinal numbers are very similar to the regular numbers in Cherokee. To make a number into an ordinal number, most of the time you will only add the suffix ${redSpan("-ne")} to the end of the word. For some the suffix ${redSpan("-hine")} (seen on 1st) and the suffix ${redSpan("-sine")} (seen on 11th - 19th) needs to be added to change the number into an ordinal."
        citation("walc141", "WALC1 pp41")
    }
}

genericChapter(datesSection) {
    footnote("Discussed in the section ", "Days Of Week Meanings", "daysOfWeekMeaning")
}

genericChapter(timesSection) {
    text "\\ \\newline"
    tbr "\\noindent Time - Time, and Time of Day"
    tbr "JAC ago"
    tbr "morning, noon, and night"
    text "Ask about opening times (museum, movie)"
    citation("walcpp42", "walc pp42")
    citation("walcpp47", "walc pp47")
    text "\\\\\n\n"
    text "\\noindent In order to tell time in relationship to what has passed you would use the phrase ${SyllabaryUtil.tsalagiToSyllabary("tsigesv")} meaning \"formerly existing\" or \"dead\""
    footnote("This would normally be used to refer to someone who is now dead.")
    citation("feelingHiderGregg202Dpp9", "Feeling, Hider, Gregg, Intermediate Cherokee Module 202D pp9")
    text "\\\\\n\n"
    def timesVocab = [:]
    timesVocab."last year" = "eji jigesv"
    timesVocab."last month" = "sinvda jigesv"
    timesVocab."two years ago" = "tali nadetiya"
    vocabulary(timesVocab, false)
//    text "\\\\\n"
    text "\\noindent When asked, \"What time it was?\" you could answer by using the phrase: ${SyllabaryUtil.tsalagiToSyllabary("iyuwanilvi")} - time (as it relates to striking of the clock)."
    citation("feelingHiderGregg202Dpp9", "Feeling, Hider, Gregg, Intermediate Cherokee Module 202D pp9")
    text "\\\\\n\n"
    text "\\noindent For instance:\\\\\n"
    def timesVocab2 = [:]
    timesVocab2."It's eight o'clock." = "janela iyuwanilv"
    timesVocab2."It is five o'clock." = "hisgi iyuwanilv"
    vocabulary(timesVocab2, false)
//    text "\\\\\n\\noindent If you wanted to use an equivalent word for ${textf("minute", "i")} you could use ${SyllabaryUtil.tsalagiToSyllabary("iyatawostanv")}.  You use it the same as in English.  ${textf("Hour", "i")} is ${SyllabaryUtil.tsalagiToSyllabary("sutlilodv")}."
    citation("feelingHiderGregg202Dpp9", "Feeling, Hider, Gregg, Intermediate Cherokee Module 202D pp9")
    text "\\\\\n"
    def timesVocab3 = [:]
    timesVocab3."five before three" = "hisgi hvdalula joi"
    timesVocab3."q quarter-past" = "ginutidi nvlosvsdi"
    timesVocab3."it's a quarter past one." = "ginutidi nvlosvsdi sagwui"
    timesVocab3."It's fifteen past one." = Vocabulary.factory("It's fifteen past one.", "sgigadu ulosvsdi sagwu", "Whether you use ${SyllabaryUtil.tsalagiToSyllabary("Sagwu")} or ${SyllabaryUtil.tsalagiToSyllabary("Sagwui")} is your choice.  Many Cherokee drop the final -i when speaking.", null, null, false)
    timesVocab3."half past" = "ayetli ulosvsdi"
    timesVocab3."it's half past nine" = "ayetli ulosvsdi sonela"
    timesVocab3."it's nine thirty" = "sonela josgohi"
    vocabulary(timesVocab3, false)
    citation("feelingHiderGregg202Dpp9", "Feeling, Hider, Gregg, Intermediate Cherokee Module 202D pp10")
    text "\\\\\nA question such as \"What time is lunch?\" ${SyllabaryUtil.tsalagiToSyllabary("hila aatliilisv iga alisdayvdi")} would perhaps be answered:\\"
    text "\"1130\" ${SyllabaryUtil.tsalagiToSyllabary("sadu ayetli")} or \"soon\" ${SyllabaryUtil.tsalagiToSyllabary("gilagwuiyusdi")}"
    footnote "Actually the phrase translates to: \"kind of like later\" or in English you'd say \"soon\""
    citation("feelingHiderGregg202Dpp9", "Feeling, Hider, Gregg, Intermediate Cherokee Module 202D pp10")
    text "\\includepdf[pages={64}]{${path}${books.interCherokee}}"

}

genericChapter(monthsSection) {
    footnote("Discussed in the section ", "Days Of Week Meanings", "daysOfWeekMeaning")
    def monthsVocab = [:]
    monthsVocab."Today is, March, 20th." = "Kohi iga, anvyi talisgohine."
    monthsVocab."Yesterday was, December fifth." = "Svhi jigesv, vsgiyi hisgine."
    vocabulary(monthsVocab, false)
    citation("walc1pp48", "WALC 1 PP48")
}

genericChapter(seasonsSection) {
    citation("walcpp49", "walc pp49")

    def seasonsVocab = [:]
    seasonsVocab."When winter comes, it becomes cold." = "Gola yinulistana, ahyvdladisgo’i."
    seasonsVocab."The birds are singing this morning, it’s spring!" = "Jisgwa danihnogi’a kohi sanale, gogeyi’dv nigalsdiha!"
    seasonsVocab."The leaves fall in Autumn." = "Degalsduwo’osgo’i ulagohvsdi."
    seasonsVocab."What are you going to do this summer?" = "Gado tadvneli kohi gogi?"
    vocabulary(seasonsVocab, false)
    citation("walcpp49", "walc pp49")
}

genericChapter(peopleAndProfessionsSection) {
    bookSection("Attaching Pronoun Prefixes To Nouns", "") {
        text "In Cherokee, pronoun prefixes are attached to a noun just as they are in a verb. Pronouns are not separated from the noun and verb as they are in English. The following examples will begin to demonstrate how to attach set A and set B prefixes onto nouns."
        citation("walcpp53","walc pp53")
        text "\\\\\n"
        text "\\newline \\noindent Set A Prefixes:"
        text "\\begin{itemize}\n"
        text "\\item A-ganakti —> He/she is a doctor\n"
        text "\\item Ji-ganakti —> I am a doctor\n"
        text "\\item Ani-ganakti —> They are doctors\n"
        text "\\item Hi-ganakti —-> You are a doctor\n"
        text "\\item A-yvwi —> A person or He/she is a person\n"
        text "\\item Ji-yvwi —> I am a person\n"
        text "\\item Hi-yvwi —> You are a person\n"
        text "\\item Ani-yvwi —> They are people\n"
        text "\\end{itemize}\n"
        text "\n"
        text "\\noindent Set B Prefixes:\n"
        text "\\begin{itemize}\n"
        text "\\item U-gvwiyuhi —> He/she is a chief/president\n"
        text "\\item Agi-gvwiyuhi —> I am a chief/president\n"
        text "\\item Ja-gvwiyuhi —> You are a chief/president\n"
        text "\\item Uni-gvwiyuhi —> They are chiefs/presidents\n"
        text "\\end{itemize}\n"
    }
}

genericChapter(thisAndThatSection) {}

genericChapter(familySection) {}

nChapter("To have and have not") {
    tbr "JAC do you have"
    tbr "to have and have not"
}

nChapter("Describing Others") {
    tbr "describing people"
}

genericChapter(directionsSection) {
    citation("walcpp828594","walc pp82-85,94")
    text "\\noindent The verb suffix that means “Going Somewhere.”\\\\\n"
    text "Rules for use\\\n"
    text "Attaching “-ega” to the past tense of the verb will produce the meaning of “going somewhere to do something.”\\\\\n"
    text "So take the remote past suffix and cut the “-v’i” off and add “-ega.”\\\\\n"
    text "1. Dagilvwisdanelv’i I worked. becomes —> Dagilvwisdanel-ega - I am going to work.\\\\\n"
    text "2. Agwalsdayvhnv’i I ate a meal. becomes —> Galisdayvhn-ega I am going to eat a meal.\\\\\n"
    text "3. Unasuhnv’i They fished. becomes —> Anasuhn-ega They are going to fish.\\\\\n\n"
    text "\\noindent Place of\\\\\n"
    text "The suffixes -i and -o’i mean “the place of” and it is added to nouns in Cherokee to form place names. Examples shown below.\\\\\n"
    text "1. Agusa Creek person —>  Guso’i “Muskogee” (Creek Place)\\\\\n"
    text "2. Kolanv Raven —> Kolanv’i “Big Cove” (Place of the Raven)\\\\\\\\\n\n"
    text "On or In\\\\\n"
    text "This noun suffixes -hi and -ohi means“on” or “in” and can also have the meaning of “into” as shown below in the following examples:\\\\\n"
    text "3. Ama Water—> Amohi Into the water\\\\\n"
    text "4. Taluja Basket —>  Talujohi Into the basket\\\\\n"
    text "5. Gasgilo Table —>  Gasgilohi On the table\\\\\n"
    citation("walcpp88", "walc pp88")
}

genericChapter(doctorSection) {}

nChapter("To the Beach") {
    tbr "ARC let's go to the beach"
}

genericChapter(transportationSection) {}

nChapter("at the airport") {
    tbr "ARC at the airport"
}

nChapter("Festivals and Celebrations") {
    tbr "festivals"
}

genericChapter(moneySection) {}

genericChapter(clothesAndShoppingSection) {}

nChapter("Animals") {
    tbr "different animals in the wild"
}

genericChapter(colorsSection) {}

genericChapter(shapesSection) {}

genericChapter(weatherSection) {}

genericChapter(foodSection) {}

nChapter("on the farm") {
    tbr "driving a tractor"
    tbr "harvesting corn"
}

nChapter("Visiting Friends") {
    tbr "I am a guest"
}

genericChapter(yoursMineOursSection) {}

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

    def othervocab = [:]
    othervocab."How much does it cost?  What are the stakes?" = "hala jugvwalodi"
    othervocab."What size do you want?  (What written do you want?)" = "Hala goweli jaduliha?"
    othervocab."How many do you want? How much do you want?" = "Hala igai jaduliha?"
    othervocab."David quit his job." = "dawidi usulagoje dulvwistanehv."//HS 133
    othervocab."That's the way it is!" = "sgidv nusdi"
    othervocab."(Yes), and several workers in his plant have lost their jobs." = "Ale hilvsgi junilvwistanehi duniyohusi junilvstaneti."//HS 133
    othervocab."What day of the week is it today?" = "Gado usdi iga atligili?"//HB 107
    othervocab."What date is it today?" = "Gado usdi asesdi kohi?"//HB 107
    othervocab."I am glad you all came." = "Galieligi nigada jijilugi."//HB 107
    othervocab."Won't you sit down?  (anywhere you choose) To one person: (bend yourself on something) To several: (Let's all be sitting around)" = "Halisdutlvga. idanvnida."//HB 107
    othervocab."Everybody be seated. (in a certain place like at the dinner table)" = "higada ijanvnida."//HB 107
    othervocab."rain (always a verb)" = "agasga"
    othervocab."lawyer (arguer for a goal)" = "ginitiyohihi"//HB 132
    othervocab."marine (on-deep-water-goer)" = "amayihawinianedohi"//HB 132
    othervocab."minister" = "analijadohvsgi"//HB 132
    othervocab."musician" = "dinikanogisdisgi"//HB 132
    othervocab."nurse (caretaker of the ill)" = "junatlvgi dinigitiya"//HB 132
    othervocab."post" = "digowelisgi kanohatlvsgi"//HB 132
    othervocab."posts" = "dinowelisgi kanohetlvsgi"//HB 132
    othervocab."policeman (final catcher)" = "dinidaniyisgi"//HB 132
    othervocab."repairman (makes it good again)" = "osda igvnehi"//HB 132
    othervocab."repairman" = "osda iyanvnehi"//HB 132
    othervocab."sailor (on-water-goer)" = "amaianedohi"//HB 132
    othervocab."secretary (writer-down)" = "gowelisgi digowelisgi"//HB 132
    othervocab."secretaries" = "digowelisgi dinowelisgi"//HB 132
    othervocab."soldier" = "aniyosgi"//HB 132
    othervocab."teacher" = "dinadeyohvsgi"//HB 132
    othervocab."typist" = "dini gesdisgi"//HB 132
    othervocab."When do they get off work? (each day)" = "Halayv anisulagogo junilvwistanehi?"//HB 132
    othervocab."When do you stop work? (temporarily, for time off or for vacation)" = "Halayv tohtedoli?"//HB 132
    othervocab."John has a new job." = "Jani aje julvwisdaniti uha."//HB 132
    othervocab."I hear he is working very hard." = "Gadvgi stayosv dulvwistanehv"//HB 132
    othervocab."They say Mark has been transferred." = "ujatina dulvwistane anadi Maga."//HB 132
//    othervocab."" = ""
//    othervocab."" = ""
//    othervocab."" = ""
//    othervocab."" = ""
//    othervocab."" = ""
//    othervocab."" = ""
//    othervocab."" = ""
//    othervocab."" = ""
//    othervocab."" = ""
//    othervocab."" = ""
//    othervocab."" = ""
//    othervocab."" = ""
    vocabulary(othervocab)
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
    tbr "Notes on the meanings of the days of the week:\\\\\\\\\n"
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

printCitations()


