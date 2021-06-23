package net.cherokeedictionary.chrbook.sections

import net.cherokeedictionary.chrbook.util.Vocabulary

class NumbersSection extends BaseSection {
    NumbersSection() {
        title = "Numbers"
        titleTranslit = "Disesdi"
        topics = ['Tell time']
//    dialogs << new DialogLine(name:"", dialog:"", engName:"Mary", engDialog:"Hello.  How are you?  My name is Mary.  What is your name?")
        vocabularies.one = "saquu"
        vocabularies.two = "tali"
        vocabularies.three = "tsoi"
        vocabularies.four = "nvhigi"
        vocabularies.five = "hisgi"
        vocabularies.six = "sudali"
        vocabularies.seven = "galiquogi"
        vocabularies.eight = "tsanela"
        vocabularies.nine = "sonela"
        vocabularies.ten = "sgohi"
        vocabularies."Eleven" = "Sadu"
        vocabularies."Twelve" = "Talidu"
        vocabularies."Thirteen" = "Jogadu"
        vocabularies."Fourteen" = "Nigadu"
        vocabularies."Fifteen" = "Sgigadu"
        vocabularies."Twenty one" = "Talisgohi sagwu"
        vocabularies."Twenty two" = "Talisgohi tali"
        vocabularies."Twenty three" = "Talisgohi joi"
        vocabularies."Twenty four" = "Talisgohi nvhgi"
        vocabularies."Twenty five" = "Talisgohi hisgi"
        vocabularies."Forty" = "Nvgisgohi"
        vocabularies."Fifty" = "Hiksgohi"
        vocabularies."Sixty" = "Sudalisgohi"
        vocabularies."Seventy" = "Galigwasgohi"
        vocabularies."Six" = "Sudali"
        vocabularies."Seven" = "Galigwogi"
        vocabularies."Eight" = "Chanela"
        vocabularies."Nine" = "Sohnela"
        vocabularies."Ten" = "Sgohi"
        vocabularies."Sixteen" = "Daladu"
        vocabularies."Seventeen" = "Galigwadu"
        vocabularies."Eighteen" = "Neladu"
        vocabularies."Nineteen" = "Sohneladu"
        vocabularies."Twenty" = "Talisgohi"
        vocabularies."Twenty six" = "Talisgohi sudali"
        vocabularies."Twenty seven" = "Talisgohi galigwogi"
        vocabularies."Twenty eight" = "Talisgohi chanela"
        vocabularies."Twenty nine" = "Talisgohi sohnela"
        vocabularies."Thirty" = "Joisgohi"
        vocabularies."Eighty" = "Nelisgohi"
        vocabularies."Ninety" = "Sohnelisgohi"
        vocabularies."One Hundred" = "Sgohijigwa"

        //todo: add redspan for the footnote
        //todo: add a way to add citations to footnotes?
        vocabularies.first = Vocabulary.factory("first", "Sagwuhine / igvyii", "Both sagwuhine and igvyi mean first, but sagwuhine is more commonly used when expressing 21st, 31st, etc. -- We Are Learning Cherokee pp 41", null, null,false)
        vocabularies.second = "talinei"
        vocabularies.third = "tsoinei"
        vocabularies.fourth = "nvsginei"
        vocabularies.fifth = "hisginei"
        vocabularies.sixth = "sudalinei"
        vocabularies.seventh = "galiquoginei"
        vocabularies.eighth = "tsunelinei"
        vocabularies.ninth = "sonelinei"
        vocabularies.tenth = "sgohinei"
        vocabularies."11th" = "Sadusine"
        vocabularies."12th" = "Talidusine"
        vocabularies."13th" = "Jogadusine"
        vocabularies."14th" = "Nigadusine"
        vocabularies."15th" = "Sgigadusine"
        vocabularies."16th" = "Daladusine"
        vocabularies."17th" = "Galigwadusine"
        vocabularies."18th" = "Neladusine"
        vocabularies."19th" = "Sohneladusine"
        vocabularies."20th" = "Talisgohine"
        vocabularies."21st" = "Talisgoi sagwuhine"
        vocabularies."30th" = "Joisgohine"

    }
}

