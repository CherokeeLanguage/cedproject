package net.cherokeedictionary.chrbook.sections

import net.cherokeedictionary.transliteration.SyllabaryUtil

//https://www.mscharhag.com/grails/rendering-views-using-templates-instead-of-taglibs
//https://docs.groovy-lang.org/latest/html/gapi/groovy/text/markup/TagLibAdapter.html
class CitationUtil {



    def dialogItem = {params, body ->
        def key = params.key
        def value = params.value
        return dialogLine(name: key, dialog: value, phonetic: 'true')
    }




}
