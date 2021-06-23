package net.cherokeedictionary.chrbook.sections

class WhatIsYourNameSection extends BaseSection {
    WhatIsYourNameSection() {
        title = "What is your name?"
        titleTranslit = "Gado Dejadoa?"
        dialogs << new DialogLine(name:"", dialog:"", engName:"Mary", engDialog:"Hello.  How are you?  My name is Mary.  What is your name?")
        dialogs << new DialogLine(name:"", dialog:"", engName:"Daniel", engDialog:"I am fine.  My name is Daniel.  This is my friend.  His name is John.")
        dialogs << new DialogLine(name:"", dialog:"", engName:"Mary", engDialog:"Hello.  My name is Mary.  What is your name?")
        dialogs << new DialogLine(name:"", dialog:"", engName:"Daniel", engDialog:"Hi.  My name is daniel.  How are you?")
        dialogs << new DialogLine(name:"", dialog:"", engName:"Mary", engDialog:"I am fine.  And you?")
        dialogs << new DialogLine(name:"", dialog:"", engName:"Daniel", engDialog:"I am fine too.  Is everything ok with you? (Is everything fine?)")
        dialogs << new DialogLine(name:"", dialog:"", engName:"Mary", engDialog:"Yes everything is fine.  I am happy that I have seen you.")
        dialogs << new DialogLine(name:"", dialog:"", engName:"Daniel", engDialog:"I am happy to have seen you too.")
        dialogs << new DialogLine(name:"", dialog:"", engName:"Mary", engDialog:"Who is that?")
        dialogs << new DialogLine(name:"", dialog:"", engName:"Daniel", engDialog:"That is John.  His name is John.")

        topics << "Meeting people pp 2-3 (name, to want)"
        topics << "Simple questions pp4 (tsu, sgo, sg, s) and pp 74 Smith"
        topics << "turn these statements into questions"
        topics << "turn these questions into statements"
        topics << "ask for xyz"
        topics << "do you want xyz"
        topics << "tell your friend you would like an apple"
        topics << "Identify other people you see that you are not currently talking to."
        topics << "More on this in Chapter 4"
        topics << "Is your name bob?"
        topics << "Is his name Barry?"
    }
}
