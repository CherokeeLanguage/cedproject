package net.cherokeedictionary.chrbook.format

import net.cherokeedictionary.chrbook.util.Vocabulary
import net.cherokeedictionary.transliteration.SyllabaryUtil

class LatexFormat extends BaseFormat {
    LatexFormat() {
        super.extension = "tex"
    }

    static def chapter(titleName, titleTranslit, title) {
        def sb = new StringBuilder()
//        titleName = titleName.replaceAll("&", "\\&")
//        titleTranslit = titleTranslit.replaceAll("&", "\\&")
//        title = title.replaceAll("&", "\\&")
        sb << "\\index{$titleName}\n"
        sb << "\\index{$titleTranslit}\n"
        sb << "\\chapter{${title}}\n"

        return sb
    }

    def whatYouWillLearn = {objectives ->
        def sb = new StringBuilder()
        def whatYouWillLearn = "What You Will Learn"
        sb << "\\index{${whatYouWillLearn}}\\subsection{${whatYouWillLearn}}\n"
        sb << "In this unit you will learn:\n"
        sb << "\\begin{itemize}\n"

        objectives.each {
            sb << "\\item ${it}\n"
        }

        sb << "\\end{itemize}\\newpage\n\n"

        return sb
    }

    def dialog = {baseSection, showPhonetic=true ->
        def sb = new StringBuilder()
        sb << "\\subsection{Dialog - ${SyllabaryUtil.tsalagiToSyllabary("analinohesgv")}}\n" //3+ danatlinohesgv
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


    //to change this to multiple columns add
    // \begin{multicols}{2}
    //[\section{Cardinal Numbers}]
    // \end{multicols} at the end
    // and \columnbreak where you want the split
    def vocabulary = {src, showTitle=true ->
        def sb = new StringBuilder()
        if (showTitle) {
            sb << "\\subsection{Vocabulary - ${SyllabaryUtil.mixedTransliteration("dikaneisdi")}}\n"
        }
        def translit = ""
        sb << "\\begin{minipage}{\\linewidth}\n"
        sb << "\\begin{tabular}{p{3cm} p{11cm}}\n"

        src.eachWithIndex { key, value, idx ->
            //first item starts new table... as does 25th item which should start a new page
            if (idx > 0 && idx % 20 == 0) {
                sb << "\\end{tabular}\n"
                sb << "\\end{minipage}\n\n"
                sb << "\\vfill\\newpage"
                sb << "\\begin{minipage}{\\linewidth}"
                sb << "\\begin{tabular}{p{3cm} p{11cm}}\n"
            }

            def sb2 = new StringBuilder()
            def footnotes = null
            if (value instanceof Vocabulary) {
                translit = value.cherokee
                footnotes = value.footnote
                sb2 << "${SyllabaryUtil.mixedTransliteration(translit)} "
            } else {
                if (value instanceof List) {
                    translit = value.join(" ")
                    value.each { val ->
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
            }

            sb << "${key.replaceAll("_", " ")} & ${sb2}\\newline \\textcolor{red}{${translit}}"
            if (footnotes) {
                sb << footnote(footnotes.src, footnotes.linkTitle, footnotes.link, footnotes.isInternal)
            }
            sb << "\\\\\n"
//                sb << "${key} & ${SyllabaryUtil.mixedTransliteration(translit)} \\newline \\textcolor{red}{${translit}}\\\\<br/>"
//                sb << "<div style=\"display:table-row\"><div style=\"display:table-cell;padding-right:10px\">${key}</div><div style=\"display:table-cell\">${SyllabaryUtil.mixedTransliteration(translit)}"
//                sb << "<br/><span style=\"color:red\">${translit}</span>"
//                sb << "</div></div>"
        }

        sb << "\\end{tabular}\n"
        sb << "\\end{minipage}\n\n"

        return sb
    }

    //\footnotemark[1]
    //\footnotetext[1]{Any time after 12:00 p.m. until the sun starts to set.}

    def bookSection = { title, phonetic ->
        def sb = new StringBuilder()
        sb << "\\\n\\index{${title}}\\subsection{${title}"
        if (phonetic) {
            sb << " - ${transl(phonetic)}"
        }
        sb << "}\n"

        return sb
    }

    def footnote = {src, linkTitle=null, link=null, isInternal=true ->
        def sb = new StringBuilder()
        sb << "\\footnote{"
        if (link) {
            if (isInternal) {
                sb << "${src}\\hyperref[sec:${link}]{${linkTitle}}"
            } else {
                sb << "\\href{${link}}{${src}}"
            }
        } else {
            sb << "${src}"
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
            sb << "\n\n\\label{sec:${anchor.replaceAll(" ", "")}}"
        }
        sb << "\\section{Word Breakdown - ${title}}"

        return sb
    }

    def answerKeyPrint = {answerKey ->
        def sb = new StringBuilder()
        sb << "\\chapter{Answer Key -}\n"
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
        sb << "\\chapter{Reader -}\n"
        answerKey.each {String key, String value ->
            sb << SyllabaryUtil.mixedTransliteration(value)
            sb << "\\\\\n"
        }

        return sb
    }

    //for multiple formatting like bold italic, bold underline, bold italic underline, etc
    // you should nest the textf methods
    // text "${textf(textf( "Unadodagwasgv’i", "i"), "b")}"
    //textf means textf(ormat)
    def textf = {src, style ->
        def sb = new StringBuilder()
        if (style) {
            switch (style) {
                case "i"://italic
                    sb << "\\textit{"
                    break;
                case "b"://bold
                    sb << "\\textbf{"
                    break;
                case "u"://underline
                    sb << "\\underline{"
                    break;
                case "e"://emphasis
                    sb << "\\emph{"
                    break;
            }
        }

        sb << src

        if (style) {
            sb << "}"
        }

        return sb
    }
}
