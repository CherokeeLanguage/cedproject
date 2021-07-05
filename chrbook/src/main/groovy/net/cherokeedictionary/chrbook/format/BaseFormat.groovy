package net.cherokeedictionary.chrbook.format

import net.cherokeedictionary.transliteration.SyllabaryUtil

class BaseFormat {
    def extension = ""
    def title = ""

    def transl(it) {
        SyllabaryUtil.tsalagiToSyllabary(it)
    }
}
