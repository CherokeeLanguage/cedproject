package net.cherokeedictionary.chrbook.sections

import net.cherokeedictionary.transliteration.SyllabaryUtil

class BaseSection {
    def title = ""
    def titleTranslit = ""
    def vocabulary = [:]
    def topics = []
    def dialogs = []
    def tmpBindings = [:]

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
        bindings.vocabulary = vocabulary
        bindings.dialogs = dialogs
        bindings << tmpBindings
        return bindings
    }
}
