package net.cherokeedictionary.chrbook

import net.cherokeedictionary.chrbook.format.LatexFormat
import net.cherokeedictionary.transliteration.SyllabaryUtil

class BookFormatter {
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

    static def books = [:]

    static {
        output.write("")
        bibliography.write("")
        readerFile.write("")
        answerFile.write("")
        oldStuffFile.write("")
        appendiciesFile.write("")
        chartsFile.write("")
        grammarFile.write("")
        books.put("begCher", "/books/BeginningCherokeeSearchable04.pdf")
        books.put("interCherokee", "/books/intermediate_cherokee_0570773_C0609_howard_gregg_eby_rick.pdf")
        books.put("arc", "/OtherLanguageReference/132903393-Teach-Yourself-Arabic.pdf")
        books.put("jfe", "/OtherLanguageReference/43956948-Japanese-for-Everyone-GAKKEN-eBook.pdf")
        output.append(format.title)
    }

    static def clearCitations() {
        citationIndex = 0
        citationMap = new LinkedHashMap<String, String>()
    }

    static def out(sb) {
        output.append(sb.toString())
    }

    static def chapter( baseSection, closure) {
        def sb = new StringBuilder()
        def titleName = baseSection.title
        def titleTranslit = SyllabaryUtil.tsalagiToSyllabary(baseSection.titleTranslit)
        def title = "${titleName} - ${titleTranslit}"
        sb << format.chapter(titleName, titleTranslit, title)

        output.append(sb.toString())
        closure()
    }

    static def whatYouWillLearn(baseSection) {
        def objectives = baseSection.topics

        output.append(format.whatYouWillLearn(objectives).toString())
    }

    static def dialog(baseSection, showPhonetic=true) {
        out(format.dialog(baseSection, showPhonetic))
    }

    static def vocabulary(src, showTitle=true) {
        out(format.vocabulary(src, showTitle))
    }

    static def transl(it) {
        return format.transl(it)
    }

    static def bookSection( title, phonetic, closure) {
        out(format.bookSection(title, phonetic))
        closure()
    }

    static def footnote(src, linkTitle=null, link=null, isInternal=true) {
        out(format.footnote(src, linkTitle, link, isInternal))
    }

    static def br() {
        output.append(format.br())
    }

    static def pre() {
        output << format.pre()
    }

    static def text(it) {
        output.append(it)
    }

    static def tbr(it) {
        text("${it}\\\\\n")
    }

    static def redSpan(it) {
        return format.redSpan(it)
    }

    static def exercise(displayText, answers, displaySyllabary=true) {
        if (answers) {
            answerKey."${displayText}" = answers
        }

        out(format.exercise(displayText, answers, displaySyllabary))
    }

    static def citation(title, src) {
        citationIndex++
        citationMap[title] = src

        out(format.citation(title))
    }

    static def printCitations() {
        bibliography.append(format.printCitations(citationMap).toString())
    }

    static def wordBreakdown(title, anchor, closure) {
        out(format.wordBreakdown(title, anchor))
        closure()
    }

    static def answerKeyPrint() {
        answerFile.append(format.answerKeyPrint(answerKey).toString())
    }

    static def reader() {
        readerFile.append(format.reader(answerKey).toString())
    }

    static def textf(src, style) {
        return format.textf(src, style)
    }

    static def genericChapter(baseSection, closure) {
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

    static def sent(en, chr) {
        output.append("${en}\\newline ${redSpan(transl(chr))}")
    }

    static def pdf(String fileName, String pages, File appender, trim=null) {
        def trimSection = ""
        if (trim) {
            trimSection = ", trim=${trim},  clip=true"
        }
        def pagez = pages ? "[pages={${pages}}${trimSection}]" : ""
        appender.append("\\includepdf${pagez}{${path}${fileName}}\n")
    }

    static def walc1(String pages, File appender=output) {
        pdf("/sort/timo/walc1.pdf", pages, appender)
    }

    static def noindent(appender=output) {
        appender.append("\\noindent")
    }

    static def nChapter(title, closure) {
        def sb = new StringBuilder()
        sb << format.chapter(title, title, title)

        output << sb.toString()

        closure()
    }
}