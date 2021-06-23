package net.cherokeedictionary.chrbook.sections

import net.cherokeedictionary.chrbook.format.LatexFormat
import net.cherokeedictionary.transliteration.SyllabaryUtil

class BaseSection {
    def title = ""
    def titleTranslit = ""
    def vocabularies = [:]
    def topics = []
    def dialogs = []
    def tmpBindings = [:]

    BaseSection() {
//        dialogs << new DialogLine(name:"REMOVE", dialog:"REMOVE", engName:"REMOVE", engDialog:"REMOVE")
    }

    String getLinkTitle() {
        return title.replaceAll(" ", "").replaceAll(",", "").replaceAll("\\?", "").replaceAll("\\.", "")
    }

    void addBinding(name, value) {
        tmpBindings.put(name, value)
    }

    Map createBinding() {
        def bindings = [:]
        bindings.titleName = title
        bindings.titleTranslit = titleTranslit
        bindings.title = SyllabaryUtil.mixedTransliteration(titleTranslit)
        bindings.anchor = title.replaceAll(" ", "").replaceAll(",", "").replaceAll("\\?", "").replaceAll("\\.", "")
        bindings.objectives = topics
        bindings.vocabulary = vocabularies
        bindings.dialogs = dialogs
        bindings << tmpBindings
        return bindings
    }
}
