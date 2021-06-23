package net.cherokeedictionary.chrbook.sections

import net.cherokeedictionary.chrbook.util.Footnote
import net.cherokeedictionary.chrbook.util.Vocabulary

class PeopleAndProfessionsSection extends BaseSection {
    PeopleAndProfessionsSection() {
        title = "People and Professions"

        vocabularies."Person" = "Yvwi"
        vocabularies."Lawyer" = "Ditiyohi"
        vocabularies."Treasurer" = "Adela agatiya"
        vocabularies."People" = "Aniyvwi"
        vocabularies."Preacher" = "Alijadohvsgi"
        vocabularies."Translator" = "Dinetlvdisgi"
        vocabularies."Teacher" = "Dideyohvsgi"
        vocabularies."Dancer" = "Alisgisgi"
        vocabularies."Artist" = "Ditlilostanvhvsgi"
        vocabularies."Doctor" = "Ganagati"
        vocabularies."Medicine person" = "Didanvwisgi"
        vocabularies."Worker/Employee" = "Julvwisdane"
        vocabularies."Nurse" = "Junidlvgi digatiya"
        vocabularies."Chief / President" = "Ugvwiyuhi"
        vocabularies."Accountant" = "Adela Ugasesdi"
        vocabularies."Actor" = "Advnelisgi"
        vocabularies."Policeman" = "Didaniyisgi"
        vocabularies."Firefighter" = "Digadladisgi"
        vocabularies."Singer" = "Dikanogisgi"
        vocabularies."Soldier" = new Vocabulary(english:"Soldier", cherokee:"Ayosgi", footnote: new Footnote(src:"\"Ayawisgi\" is an alternative and older way to write the word.", isInternal:true))
        vocabularies."Store clerk" = "Adananv adagatidehi"
        vocabularies."Student" = "Didelogwasgi"
        vocabularies."Writer" = "Digowelisgi"
        vocabularies."Boss" = "Jukastli /Asgayegvsdi"

        topics << "JAC profession"
        topics << "Personal details"
        topics << "What do you do?"
        topics << "Different jobs and occupations"
        topics << "personal details [not family unless \"I have 2 kids\"]"
        topics << "At work - looking for a job"
        topics << "at the office"
        topics << "ARC when do you work"
        topics << "pictures of professions"
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
                println "vocabularies.\"${en}\" = \"${chr}\""
            }

//            println it
        }
    }
}
