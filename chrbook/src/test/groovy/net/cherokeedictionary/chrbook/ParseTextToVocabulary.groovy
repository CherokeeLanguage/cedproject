package net.cherokeedictionary.chrbook

def str = """1. Sidanelv’i - Family
2. Juniyvwi - Clans
3. Edoda - Father
4. Eji - Mother
5. Etlogi - (paternal) Aunt
6. Eduji - Uncle
7. Elisi - Grandma
8. Eduda - Grandpa (maternal)
9. Vgido - My sibling (opposite sex)
10. Josdadahnvtli - My brother (same sex)
11. Josdadalv’i - My sister (same sex)
12. Gohusdi agwvni - My cousin
13. Agwadadujiyv achuja - My nephew
14. Agwadadujiyv agehyuja - My niece
15. Ta’line eji - Aunt (maternal)
16. Enisi - Grandpa (paternal)
1. Ani-Kawi - Deer Clan
2. Ani-godagewi - Savannah Clan
3. Ani-jisgwa - Bird Clan
4. Ani-sahoni - Blue Clan
5. Ani-wah(a)ya - Wolf Clan
6. Ani-wodi - Paint Clan
7. Ani-gilohi - Long Hair Clan
8. Digiyvwi - My clan
9. ____ digiyvwi. - My clan is ____.
10. ___ dijayvwi. - Your clan is ___."""

str.eachLine {
    def chr = it.substring(it.indexOf(". ") + 2, it.indexOf(" - "))
    def en = it.substring(it.indexOf(" - ") + 3)

    println "vocabulary.\"${en}\" = \"${chr}\""
}