package net.cherokeedictionary.chrbook.format

import net.cherokeedictionary.transliteration.SyllabaryUtil

class HTMLFormat extends BaseFormat {
    HTMLFormat() {
        super.extension = "html"
    }
//    def clearCitations = {
//        citationIndex = 0
//        citationMap = new LinkedHashMap<String, String>()
//    }
//
//    def out = {sb ->
//        output.append(sb.toString())
//    }
//
//    def chapter = { baseSection, closure ->
//        def sb = new StringBuilder()
//        def titleName = baseSection.title
//        def titleTranslit = SyllabaryUtil.tsalagiToSyllabary(baseSection.titleTranslit)
//        def title = "${titleName} - ${titleTranslit}"
//        if (isPrintVersion) {
//            sb << "\\index{$titleName}\n"
//            sb << "\\index{$titleTranslit}\n"
//            sb << "\\chapter{${title}}\n"
//        } else {
//            sb << "<a name=\"${baseSection.title}\"></a>"
//            sb << "<h2>${title}</h2>"
//        }
//
//        output.append(sb.toString())
//        closure()
//    }
//
//    def whatYouWillLearn = {baseSection ->
//        def sb = new StringBuilder()
//        def objectives = baseSection.topics
//        if (isPrintVersion) {
//            def whatYouWillLearn = "What You Will Learn"
//            sb << "\\index{${whatYouWillLearn}}\\subsection{${whatYouWillLearn}}\n"
//            sb << "In this unit you will learn:\n"
//            sb << "\\begin{itemize}\n"
//
//            objectives.each {
//                sb << "\\item ${it}\n"
//            }
//
//            sb << "\\end{itemize}\\newpage\n\n"
//        } else {
//            sb << "<b>What You Will Learn In This Chapter</b><br/>"
//            sb << "In this unit you will learn:<br/>"
//            sb << "<ul>"
//
//            objectives.each {
//                sb << "<li>${it}</li>"
//            }
//
//            sb << "</ul>"
//        }
//
//        output.append(sb.toString())
//    }
//
//    def dialog = {baseSection, showPhonetic=true ->
//        def sb = new StringBuilder()
//        if (isPrintVersion) {
//            sb << "\\subsection{Dialog - }\n"
//            sb << "\\begin{tabular}{p{2cm} p{11cm}}\n"
//            baseSection.dialogs.each {
//                sb << SyllabaryUtil.mixedTransliteration(it.name).trim()
//                sb << ":"
//                if (showPhonetic) {
//                    sb << "\\newline \\textcolor{red}{${it.name}}:"
//                }
//
//                sb << " & "
//                sb << SyllabaryUtil.mixedTransliteration(it.dialog)
//                sb << "\\newline"
//                if (showPhonetic) {
//                    sb << "\\textcolor{red}{${it.dialog}}"
//                }
//                sb << "\\\\\n"
//            }
//
//            sb << "\\end{tabular}\n"
//            sb << "\\\\\n"
//            sb << "\\\\\n"
//            sb << "\\\\\n"
//            sb << "\\noindent\\begin{tabular}{p{2cm} p{11cm}}"
//            baseSection.dialogs.each {
//                sb << "${it.engName}: & ${it.engDialog}\\\\\n"
//            }
//            sb << "\\end{tabular}\n"
//        } else {
//            sb << "<h4>Dialog - </h4>"
//
////    <g:each in="${dialogs}">
////        <div style="display:table-row">
////
////            <div style="display:table-cell;padding-right:20px">${SyllabaryUtil.mixedTransliteration(it.name)}:<g:if test="${showPhonetic}"><br/><g:redSpan>${it.name}:</g:redSpan></g:if></div>
////            <div style="display:table-cell;padding-right:20px">${SyllabaryUtil.mixedTransliteration(it.dialog)}<g:if test="${showPhonetic}"><br/><g:redSpan>${it.dialog}</g:redSpan></g:if></div>
////            <div style="display:table-cell;padding-right:20px">${it.engName}:</div>
////                <div style="display:table-cell">${it.engDialog}</div>
////        </div>
////                </g:each>
//        }
//
//        out(sb)
//    }
//
//    def vocabulary = {src ->
//        def sb = new StringBuilder()
//
//        if (isPrintVersion) {
//            sb << "\\subsection{Vocabulary - ${SyllabaryUtil.mixedTransliteration("dikaneisdi")}}\n"
//            sb << "\\begin{tabular}{p{3cm} p{11cm}}\n"
//            src.each { key, value ->
//                def sb2 = new StringBuilder()
//                if (value instanceof List) {
//                    translit = value.join(" ")
//                    value.each {val ->
//                        if (val.contains("<e>")) {
//                            sb2 << " ${val.substring("<e>".size())} "
//                        } else {
//                            sb2 << "${SyllabaryUtil.mixedTransliteration(val)} "
//                        }
//                    }
//                } else {
//                    translit = value
//                    sb2 << "${SyllabaryUtil.mixedTransliteration(value)} "
//                }
//
//                sb << "${key.replaceAll("_", " ")} & ${sb2}\\newline \\textcolor{red}{${translit}}\\\\\n"
////                sb << "${key} & ${SyllabaryUtil.mixedTransliteration(translit)} \\newline \\textcolor{red}{${translit}}\\\\<br/>"
////                sb << "<div style=\"display:table-row\"><div style=\"display:table-cell;padding-right:10px\">${key}</div><div style=\"display:table-cell\">${SyllabaryUtil.mixedTransliteration(translit)}"
////                sb << "<br/><span style=\"color:red\">${translit}</span>"
////                sb << "</div></div>"
//            }
//            sb << "\\end{tabular}\n\n"
//        } else {
//            sb << "<h4>Vocabulary - ${SyllabaryUtil.tsalagiToSyllabary("dikaneisdi")}</h4>"
//
//            src.each { key, value ->
//                def sb2 = new StringBuilder()
//                def translit = ""
//                if (value instanceof List) {
//                    translit = value.join(" ")
//                    value.each {val ->
//                        if (val.contains("<e>")) {
//                            sb2 << "${val.substring("<e>".size())} "
//                        } else {
//                            sb2 << "${SyllabaryUtil.mixedTransliteration(val)} "
//                        }
//                    }
//                } else {
//                    translit = value
//                    sb2 << "${SyllabaryUtil.mixedTransliteration(value)}"
//                }
//
////                sb << "${key} & ${sb2}\\newline \\textcolor{red}{${translit}}\\\\<br/>"
//
//                sb << "<div style=\"display:table-row\">"
//                sb << "<div style=\"display:table-cell;padding-right:10px\">${key.replaceAll("_", " ")}</div>"
//                sb << "<div style=\"display:table-cell\">${sb2}"
//                sb << "<br/><span style=\"color:red\">${translit}</span>"
//                sb << "</div></div>"
//            }
//        }
//
//        out(sb)
//    }
//
//    def transl = {
//        SyllabaryUtil.tsalagiToSyllabary(it)
//    }
//
//    def bookSection = { title, phonetic, closure ->
//        def sb = new StringBuilder()
//        if (isPrintVersion) {
//            sb << "\\index{${title}}\\subsection{${title}"
//            if (phonetic) {
//                sb << " - ${transl(phonetic)}"
//            }
//            sb << "}\n"
//
//
//        } else {
//            sb << "<h4>${title}"
//            if (phonetic) {
//                sb << " - ${transl(phonetic)}"
//            }
//            sb << "</h4>"
//        }
//
//        out(sb)
//        closure()
//    }
//
//    def footnote = {src, linkTitle=null, link=null ->
//        def sb = new StringBuilder()
//        if (isPrintVersion) {
//            sb << "\\footnote{${src}"
//            if (link) {
//                sb << "\\hyperref[sec:${link}]{${linkTitle}}"
//            }
//            sb << "}"
//        } else {
//            sb << "<sup>${src}"
//            if (link) {
//                sb << "<a href=\"#${link}\">${linkTitle}</a>"
//            }
//            sb << "</sup>"
//        }
//
//        out(sb)
//    }
//
//    def br = {
//        if (isPrintVersion) {
//            output.append("\\\\\n")
//        } else {
//            output.append("<br/>")
//        }
//    }
//
//    def pre = {
//        if (isPrintVersion) {
//
//        } else {
//            output.append("<pre>${it}</pre>")
//        }
//    }
//
//    def text = {
//        output.append(it)
//    }
//
//    def redSpan = {
//        def sb = new StringBuilder()
//
//        if (isPrintVersion) {
//            sb << "\\textcolor{red}{${it}}"
//        } else {
//            sb << "<span style=\"color:red\">${it}</span>"
//        }
//
//        return sb.toString()
//    }
//
//    def exercise = {displayText, answers, displaySyllabary=true ->
//        def sb = new StringBuilder()
//
//        def exerciseTitle = "Exercise - ${transl("alisinahisdisgv digvdodi")}"
//        if (isPrintVersion) {
//            sb << "\n\\section{${exerciseTitle}}\n"
//            sb << "Translate to Cherokee syllabary and the phonetic equivalent\\\\\n"
//            sb << "${displayText}\\\\\n"
//            if (answers) {
//                sb << "${answers}\\\\\n"
//                if (displaySyllabary) {
//                    sb << "${SyllabaryUtil.mixedTransliteration(answers)}"
//                }
//            }
//        } else {
//            sb << "<h4>${exerciseTitle}</h4>"
//            sb << "Translate to Cherokee syllabary and the phonetic equivalent<br/>"
//            sb << displayText
//            if (answers) {
//                sb << "<br/>${answers}"
//                if (displaySyllabary) {
//                    sb << "<br/>${SyllabaryUtil.mixedTransliteration(answers)}"
//                }
//            }
//        }
//
//        if (answers) {
//            answerKey."${displayText}" = answers
//        }
//
//        out(sb)
//    }
//
//    def citation = {title, src ->
//        def sb = new StringBuilder()
//        citationIndex++
//
//        if (isPrintVersion) {
//            sb << "\\cite{${title}}"
//        } else {
//            sb << "<a name=\"#cite${title}\"></a><sup><a id=\"#cite${title}\" href=\"#ref${title}\">${citationIndex}</a></sup>"
//        }
//
//        citationMap[title] = src
//
//        out(sb)
//    }
//
//    def printCitations = {
//        def sb = new StringBuilder()
//
//        if (isPrintVersion) {
//            sb << "\n\n%+Bibliography\n\\begin{thebibliography}{99}\n"
//
//            citationMap.eachWithIndex { item, idx ->
//                def value = item.value.replaceAll("&", "\\\\&")
//                sb << "\\bibitem{${item.key}} ${value}\n"
//            }
//            sb << "\\end{thebibliography}\n%-Bibliography\n"
//        } else {
//            sb << "<a name=\"bibliography\"></a><h2>Bibliography</h2>"
//            citationMap.eachWithIndex { item, idx ->
//                sb << "<sup id=\"ref${item.key}\">[${idx + 1}]</sup> ${item.value} <br/>"//<a href=\"#cite${item.key}\">go back</a>
//            }
//        }
//
//        bibliography.append(sb.toString())
//    }
//
//    def wordBreakdown = {title, anchor, closure ->
//        def sb = new StringBuilder()
//        if (isPrintVersion) {
//            if (anchor) {
//                sb << "\\label{sec:${anchor.replaceAll(" ", "")}}"
//            }
//            sb << "\\section{Word Breakdown - ${title}}"
//        } else {
//            if (anchor) {
//                sb << "<a name=\"${anchor.replaceAll(" ", "")}\"></a>"
//            }
//            sb << "<h4>Word Breakdown - ${title}</h4>"
//        }
//
//        out(sb)
//        closure()
//    }
//
//    def answerKeyPrint = {
//        def sb = new StringBuilder()
//        if (isPrintVersion) {
//            sb << "\\section{Answer Key -}\n"
//            answerKey.each {String key, String value ->
//                sb << "\\noindent${key}"
//                sb << "\\\\\n"
//                sb << value
//                sb << "\\\\\n"
//                sb << SyllabaryUtil.mixedTransliteration(value)
//                sb << "\n\n"
//            }
//        } else {
//            sb << "<h3>Answer Key - </h3>"
//            answerKey.each {String key, String value ->
//                sb << key
//                sb << "<br/>"
//                sb << value
//                sb << "<br/>"
//                sb << SyllabaryUtil.mixedTransliteration(value)
//                sb << "<br/><br/>"
//            }
//        }
//
//        answerFile.append(sb.toString())
//    }
//
//    def reader = {
//        def sb = new StringBuilder()
//        if (isPrintVersion) {
//            sb << "\\section{Reader -}\n"
//            answerKey.each {String key, String value ->
//                sb << SyllabaryUtil.mixedTransliteration(value)
//                sb << "\\\\\n"
//            }
//        } else {
//            sb << "<h3>Reader - </h3>"
//            answerKey.each {String key, String value ->
//                sb << SyllabaryUtil.mixedTransliteration(value)
//                sb << "<br/>"
//            }
//        }
//
//        readerFile.append(sb.toString())
//    }
//
//    def genericChapter = {baseSection, closure ->
//        chapter(baseSection) {
//            whatYouWillLearn(baseSection)
//            dialog(baseSection)
//            vocabulary(baseSection.vocabulary)
//            closure()
//        }
//    }
}
