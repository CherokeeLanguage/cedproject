package net.cherokeedictionary.chrbook

def entries = """
"""

entries.eachLine {
    def starr = it.split(",")
    starr[0] = starr[0].trim().substring(1, starr[0].trim().size() - 1)
    starr[1] = starr[1].trim().substring(1, starr[1].trim().size() - 1)
    starr[2] = starr[2].trim().substring(1, starr[2].trim().size() - 1)
    println "vocabularies.\"${starr[0]}\" = new Vocabulary(english:\"${starr[0]}\", cherokee:\"${starr[1]}\", footnote: new Footnote(src:\"CED ${starr[0]}\", link:\"https://cherokeedictionary.net/share/${starr[2]}\", linkTitle:\"https://cherokeedictionary.net/share/${starr[2]}\", isInternal:false))"
}
