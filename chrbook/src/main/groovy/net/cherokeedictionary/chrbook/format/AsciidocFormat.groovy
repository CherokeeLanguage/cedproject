package net.cherokeedictionary.chrbook.format

import net.cherokeedictionary.transliteration.SyllabaryUtil

class AsciidocFormat extends BaseFormat {
    AsciidocFormat() {
        super.extension = "adoc"
        super.title = "= ᏣᎳᎩ ᎦᏬᏂᎯᏍᏓ ᏗᎪᏪᎵ - Cherokee Language Book\n" +
                "Tim Orr\n" +
                "v1.0, 2003-12\n" +
                ":doctype: book\n\n"
    }

    def index = {
        return "indexterm:[${it}]"
    }

    def chapter = { titleName, titleTranslit, title ->
        def sb = new StringBuilder()

        sb << "${title}\n"
        sb << "---------------------\n\n"
        sb << index(titleName) << "\n"
        sb << index(titleTranslit) << "\n"

        return sb
    }

    def whatYouWillLearn = {objectives ->
        def sb = new StringBuilder()
        def whatYouWillLearn = "\nWhat You Will Learn"

        sb << "${whatYouWillLearn}\n"
        sb << "~~~~~~~~~~~~~~~~~~~\n"
        sb << index(whatYouWillLearn)
        sb << "\n\n"
        sb << "* In this unit you will learn:\n"

        objectives.each {
            sb << "- ${it}\n"
        }

        sb << "<<<\n\n"

        return sb
    }

    def dialog = {baseSection, showPhonetic=true ->
        def sb = new StringBuilder()
        sb << "\\subsection{Dialog - }\n"
        sb << "\\begin{tabular}{p{2cm} p{11cm}}\n"
        baseSection.dialogs.each {
            sb << SyllabaryUtil.mixedTransliteration(it.name).trim()
            sb << ":"
            if (showPhonetic) {
                sb << "\\newline \\textcolor{red}{${it.name}}:"
            }

            sb << " & "
            sb << SyllabaryUtil.mixedTransliteration(it.dialog)
            sb << "\\newline"
            if (showPhonetic) {
                sb << "\\textcolor{red}{${it.dialog}}"
            }
            sb << "\\\\\n"
        }

        sb << "\\end{tabular}\n"
        sb << "\\\\\n"
        sb << "\\\\\n"
        sb << "\\\\\n"
        sb << "\\noindent\\begin{tabular}{p{2cm} p{11cm}}"
        baseSection.dialogs.each {
            sb << "${it.engName}: & ${it.engDialog}\\\\\n"
        }
        sb << "\\end{tabular}\n"

        return sb
    }

    def vocabulary = {src ->
        def sb = new StringBuilder()

        sb << "\\subsection{Vocabulary - ${SyllabaryUtil.mixedTransliteration("dikaneisdi")}}\n"
        sb << "\\begin{tabular}{p{3cm} p{11cm}}\n"
        def translit = ""

        src.each { key, value ->
            def sb2 = new StringBuilder()
            if (value instanceof List) {
                translit = value.join(" ")
                value.each {val ->
                    if (val.contains("<e>")) {
                        sb2 << " ${val.substring("<e>".size())} "
                    } else {
                        sb2 << "${SyllabaryUtil.mixedTransliteration(val)} "
                    }
                }
            } else {
                translit = value
                sb2 << "${SyllabaryUtil.mixedTransliteration(value)} "
            }

            sb << "${key.replaceAll("_", " ")} & ${sb2}\\newline \\textcolor{red}{${translit}}\\\\\n"
//                sb << "${key} & ${SyllabaryUtil.mixedTransliteration(translit)} \\newline \\textcolor{red}{${translit}}\\\\<br/>"
//                sb << "<div style=\"display:table-row\"><div style=\"display:table-cell;padding-right:10px\">${key}</div><div style=\"display:table-cell\">${SyllabaryUtil.mixedTransliteration(translit)}"
//                sb << "<br/><span style=\"color:red\">${translit}</span>"
//                sb << "</div></div>"
        }
        sb << "\\end{tabular}\n\n"


        return sb
    }

    def bookSection = { title, phonetic ->
        def sb = new StringBuilder()
        sb << "\\index{${title}}\\subsection{${title}"
        if (phonetic) {
            sb << " - ${transl(phonetic)}"
        }
        sb << "}\n"

        return sb
    }

    def footnote = {src, linkTitle=null, link=null ->
        def sb = new StringBuilder()
        sb << "\\footnote{${src}"
        if (link) {
            sb << "\\hyperref[sec:${link}]{${linkTitle}}"
        }
        sb << "}"

        return sb
    }

    def br = {
        return "\\\\\n"
    }

    def pre = {
        return ""
    }

    def redSpan = {
        return "\\textcolor{red}{${it}}"
    }

    def exercise = {displayText, answers, displaySyllabary=true ->
        def sb = new StringBuilder()

        def exerciseTitle = "Exercise - ${transl("alisinahisdisgv digvdodi")}"
        sb << "\n\\section{${exerciseTitle}}\n"
        sb << "Translate to Cherokee syllabary and the phonetic equivalent\\\\\n"
        sb << "${displayText}\\\\\n"
        if (answers) {
            sb << "${answers}\\\\\n"
            if (displaySyllabary) {
                sb << "${SyllabaryUtil.mixedTransliteration(answers)}"
            }
        }

        return sb
    }

    def citation = {title ->
        return "\\cite{${title}}"
    }

    def printCitations = {citationMap ->
        def sb = new StringBuilder()

        sb << "\n\n%+Bibliography\n\\begin{thebibliography}{99}\n"

        citationMap.eachWithIndex { item, idx ->
            def value = item.value.replaceAll("&", "\\\\&")
            sb << "\\bibitem{${item.key}} ${value}\n"
        }

        sb << "\\end{thebibliography}\n%-Bibliography\n"

        return sb
    }

    def wordBreakdown = {title, anchor ->
        def sb = new StringBuilder()
        if (anchor) {
            sb << "\\label{sec:${anchor.replaceAll(" ", "")}}"
        }
        sb << "\\section{Word Breakdown - ${title}}"

        return sb
    }

    def answerKeyPrint = {answerKey ->
        def sb = new StringBuilder()
        sb << "\\section{Answer Key -}\n"
        answerKey.each {String key, String value ->
            sb << "\\noindent${key}"
            sb << "\\\\\n"
            sb << value
            sb << "\\\\\n"
            sb << SyllabaryUtil.mixedTransliteration(value)
            sb << "\n\n"
        }

        return sb
    }

    def reader = {answerKey ->
        def sb = new StringBuilder()
        sb << "\\section{Reader -}\n"
        answerKey.each {String key, String value ->
            sb << SyllabaryUtil.mixedTransliteration(value)
            sb << "\\\\\n"
        }

        return sb
    }
}
