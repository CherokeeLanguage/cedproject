package net.cherokeedictionary.chrbook.sections

import net.cherokeedictionary.transliteration.SyllabaryUtil

class DialogLine {
    String name
    String dialog
    String engName
    String engDialog

    String getNameTranslit() {
        SyllabaryUtil.mixedTransliteration(name)
    }

    String getDialogTranslit() {
        SyllabaryUtil.mixedTransliteration(dialog)
    }
}
