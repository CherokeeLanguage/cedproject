package net.cherokeedictionary.chrbook

def str = """1. Gvhnagei - Black
2. Gigagei - Red
3. Unega - White
4. Dalonigei - Yellow
5. Adalonigei - Orange
6. Sakonigei - Blue
7. Gigage Usgolv - Pink
8. Advhalige - Purple
9. Ije iyusdi - Green
10. Adela unega - Silver
11. Adela dalonige - Gold
12. Uwodige - Brown
1. usgolv sagonige - Gray/Grey
2. usgosda gigage - Scarlet
3. nvda uleyvtanv - tan
4. ulisuwida - colored
5. julsuwida - colors"""

str.eachLine {
    def chr = it.substring(it.indexOf(". ") + 2, it.indexOf(" - "))
    def en = it.substring(it.indexOf(" - ") + 3)

    println "vocabulary.\"${en}\" = \"${chr}\""
}