package net.cherokeedictionary.chrbook

import net.cherokeedictionary.chrbook.format.LatexFormat
import net.cherokeedictionary.transliteration.SyllabaryUtil

class BookFormatter {
    //https://www.overleaf.com/learn/latex/Bold,_italics_and_underlining
//def format = new AsciidocFormat()
    static def format = new LatexFormat()
    static def extension = format.extension
//def bindMap = new LinkedHashMap<String, String>()
    static def citationIndex = 0
    static def citationMap = new LinkedHashMap<String, String>()
    static def answerKey = new LinkedHashMap<String, String>()

    static def output = new File("bookOutput/book.${extension}")
    static def bibliography = new File("bookOutput/bibliography.${extension}")
    static def readerFile = new File("bookOutput/reader.${extension}")
    static def answerFile = new File("bookOutput/answerGuide.${extension}")
    static def oldStuffFile = new File("bookOutput/oldresearch.${extension}")
    static def appendiciesFile = new File("bookOutput/appendicies.${extension}")
    static def chartsFile = new File("bookOutput/charts.${extension}")
    static def grammarFile = new File("bookOutput/grammar.${extension}")

//def path = "/projects/GoogleDriveTimo/Cherokee Umbrella"
    static def path = "W:/GOOGLEDRIVE/Cherokee Umbrella"

    def books = [:]
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

            if (baseSection.vocabulary) {
                vocabulary(baseSection.vocabulary)
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
}