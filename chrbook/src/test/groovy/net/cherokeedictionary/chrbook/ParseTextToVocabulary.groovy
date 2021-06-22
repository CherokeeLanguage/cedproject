package net.cherokeedictionary.chrbook

def str = """1. Gadidi’a - I am getting up
2. Jiyegi - I woke up
3. Gadvnv’isdiha - I am getting ready
4. Gadawoja - I just took a shower
5. Dejindohgv dejinvgala - I brushed my teeth
6. Dejitesga - I am ironing
7. Doyi-edasdi wijiyvha - I went to the bathroom
8. Sanale-ehi galisdayvhvga - I just ate breakfast
9. Deganiwoja - I put on my clothes
10. Ga’nigi - I just left
11. Degalasutlvga - I put my shoes on
12. Galitawoja - I combed my hair
13. Alsdayhdi gadvnv’isda - I prepared my meal
14. Dihnawo dejitvla - I just ironed my clothes"""

str.eachLine {
    def chr = it.substring(it.indexOf(". ") + 2, it.indexOf(" - "))
    def en = it.substring(it.indexOf(" - ") + 3)

    println "vocabulary.\"${en}\" = \"${chr}\""
}