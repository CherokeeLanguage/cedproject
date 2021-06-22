package net.cherokeedictionary.chrbook.util

class Vocabulary {
    String english
    String cherokee
    Footnote footnote = null

    static Vocabulary factory(en, chr, src, link, linkTitle="", isInternal=true) {
        return new Vocabulary(english:en, cherokee:chr, footnote: new Footnote(src:src, link:link,linkTitle:linkTitle, isInternal:isInternal))
    }
}
