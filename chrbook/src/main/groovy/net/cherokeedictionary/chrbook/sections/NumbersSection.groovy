package net.cherokeedictionary.chrbook.sections

import net.cherokeedictionary.chrbook.util.Vocabulary

class NumbersSection extends BaseSection {
    NumbersSection() {
        title = "Numbers"
        titleTranslit = "Disesdi"
        topics = ['Tell time']
//    dialogs << new DialogLine(name:"", dialog:"", engName:"Mary", engDialog:"Hello.  How are you?  My name is Mary.  What is your name?")
        vocabulary = [:]
        vocabulary.one = "saquu"
        vocabulary.two = "tali"
        vocabulary.three = "tsoi"
        vocabulary.four = "nvhigi"
        vocabulary.five = "hisgi"
        vocabulary.six = "sudali"
        vocabulary.seven = "galiquogi"
        vocabulary.eight = "tsanela"
        vocabulary.nine = "sonela"
        vocabulary.ten = "sgohi"
        vocabulary."Eleven" = "Sadu"
        vocabulary."Twelve" = "Talidu"
        vocabulary."Thirteen" = "Jogadu"
        vocabulary."Fourteen" = "Nigadu"
        vocabulary."Fifteen" = "Sgigadu"
        vocabulary."Twenty one" = "Talisgohi sagwu"
        vocabulary."Twenty two" = "Talisgohi tali"
        vocabulary."Twenty three" = "Talisgohi joi"
        vocabulary."Twenty four" = "Talisgohi nvhgi"
        vocabulary."Twenty five" = "Talisgohi hisgi"
        vocabulary."Forty" = "Nvgisgohi"
        vocabulary."Fifty" = "Hiksgohi"
        vocabulary."Sixty" = "Sudalisgohi"
        vocabulary."Seventy" = "Galigwasgohi"
        vocabulary."Six" = "Sudali"
        vocabulary."Seven" = "Galigwogi"
        vocabulary."Eight" = "Chanela"
        vocabulary."Nine" = "Sohnela"
        vocabulary."Ten" = "Sgohi"
        vocabulary."Sixteen" = "Daladu"
        vocabulary."Seventeen" = "Galigwadu"
        vocabulary."Eighteen" = "Neladu"
        vocabulary."Nineteen" = "Sohneladu"
        vocabulary."Twenty" = "Talisgohi"
        vocabulary."Twenty six" = "Talisgohi sudali"
        vocabulary."Twenty seven" = "Talisgohi galigwogi"
        vocabulary."Twenty eight" = "Talisgohi chanela"
        vocabulary."Twenty nine" = "Talisgohi sohnela"
        vocabulary."Thirty" = "Joisgohi"
        vocabulary."Eighty" = "Nelisgohi"
        vocabulary."Ninety" = "Sohnelisgohi"
        vocabulary."One Hundred" = "Sgohijigwa"

        //todo: add redspan for the footnote
        //todo: add a way to add citations to footnotes?
        vocabulary.first = Vocabulary.factory("first", "Sagwuhine / igvyii", "Both sagwuhine and igvyi mean first, but sagwuhine is more commonly used when expressing 21st, 31st, etc. -- We Are Learning Cherokee pp 41", null, null,false)
        vocabulary.second = "talinei"
        vocabulary.third = "tsoinei"
        vocabulary.fourth = "nvsginei"
        vocabulary.fifth = "hisginei"
        vocabulary.sixth = "sudalinei"
        vocabulary.seventh = "galiquoginei"
        vocabulary.eighth = "tsunelinei"
        vocabulary.ninth = "sonelinei"
        vocabulary.tenth = "sgohinei"
        vocabulary."11th" = "Sadusine"
        vocabulary."12th" = "Talidusine"
        vocabulary."13th" = "Jogadusine"
        vocabulary."14th" = "Nigadusine"
        vocabulary."15th" = "Sgigadusine"
        vocabulary."16th" = "Daladusine"
        vocabulary."17th" = "Galigwadusine"
        vocabulary."18th" = "Neladusine"
        vocabulary."19th" = "Sohneladusine"
        vocabulary."20th" = "Talisgohine"
        vocabulary."21st" = "Talisgoi sagwuhine"
        vocabulary."30th" = "Joisgohine"

    }
}

