package net.cherokeedictionary.chrbook.sections

import net.cherokeedictionary.chrbook.util.Footnote
import net.cherokeedictionary.chrbook.util.Vocabulary

class PeopleAndProfessionsSection extends BaseSection {
    PeopleAndProfessionsSection() {
        title = "People and Professions"

        vocabulary = [:]
        vocabulary."Person" = "Yvwi"
        vocabulary."Lawyer" = "Ditiyohi"
        vocabulary."Treasurer" = "Adela agatiya"
        vocabulary."People" = "Aniyvwi"
        vocabulary."Preacher" = "Alijadohvsgi"
        vocabulary."Translator" = "Dinetlvdisgi"
        vocabulary."Teacher" = "Dideyohvsgi"
        vocabulary."Dancer" = "Alisgisgi"
        vocabulary."Artist" = "Ditlilostanvhvsgi"
        vocabulary."Doctor" = "Ganagati"
        vocabulary."Medicine person" = "Didanvwisgi"
        vocabulary."Worker/Employee" = "Julvwisdane"
        vocabulary."Nurse" = "Junidlvgi digatiya"
        vocabulary."Chief / President" = "Ugvwiyuhi"
        vocabulary."Accountant" = "Adela Ugasesdi"
        vocabulary."Actor" = "Advnelisgi"
        vocabulary."Policeman" = "Didaniyisgi"
        vocabulary."Firefighter" = "Digadladisgi"
        vocabulary."Singer" = "Dikanogisgi"
        vocabulary."Soldier" = new Vocabulary(english:"Soldier", cherokee:"Ayosgi", footnote: new Footnote(src:"\"Ayawisgi\" is an alternative and older way to write the word.", isInternal:true))
        vocabulary."Store clerk" = "Adananv adagatidehi"
        vocabulary."Student" = "Didelogwasgi"
        vocabulary."Writer" = "Digowelisgi"
        vocabulary."Boss" = "Jukastli /Asgayegvsdi"
    }

    static void main(String[] args) {
def str = """1. Yvwi
Person
9. Ditiyohi
Lawyer
17. Adela aktiya
Treasurer
2. Aniyvwi
People
10. Alijadohvsgi
Preacher
18. Dihnetldisgi
Translator
3. Dideyohvsgi
Teacher
11. Alisgisgi
Dancer
19. Ditlilostanvhvsgi
Artist
4. Ganakti
Doctor
12. Didahnvwisgi
Medicine person
20. Julvwisdaneh
Worker/Employee
5. Junidlvgi diktiya
Nurse
13. Ugvwiyuhi
Chief / President
21. Adela Ug(a)sesdi
Accountant
6. Advnelisgi
Actor
14. Didaniyisgi
Policeman
22. Dikdladisgi
Firefighter
7. Dikanogisgi
Singer
15. Ayosgi1
Soldier
23. Adananv adag(a)tidehi
Store clerk
8. Didelogwasgi
Student
16. Digohwelisgi
Writer
24. Jukastli /Asgayegvsdi
Boss"""

        def en = ""
        def chr = ""
        str.eachLine {
            it - it.trim()
            if (Character.isDigit(it.charAt(0))) {
                chr = it.substring(it.indexOf(".") + 2)
                en = ""
            } else {
                en = it
            }

            if (en && chr) {
                println "vocabulary.\"${en}\" = \"${chr}\""
            }

//            println it
        }
    }
}
