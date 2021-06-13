package net.cherokeedictionary.chrbook.sections

class WhatIsYourNameSection extends BaseSection {
    WhatIsYourNameSection() {
        title = "What is your name?"
        titleTranslit = "Gado Dejadoa?"
        dialogs = []
        dialogs << new DialogLine(name:"REMOVE", dialog:"REMOVE", engName:"Mary", engDialog:"Hello.  How are you?  My name is Mary.  What is your name?")
        dialogs << new DialogLine(name:"REMOVE", dialog:"REMOVE", engName:"Daniel", engDialog:"I am fine.  My name is Daniel.  This is my friend.  His name is John.")
        dialogs << new DialogLine(name:"REMOVE", dialog:"REMOVE", engName:"Mary", engDialog:"Hello.  My name is Mary.  What is your name?")
        dialogs << new DialogLine(name:"REMOVE", dialog:"REMOVE", engName:"Daniel", engDialog:"Hi.  My name is daniel.  How are you?")
        dialogs << new DialogLine(name:"REMOVE", dialog:"REMOVE", engName:"Mary", engDialog:"I am fine.  And you?")
        dialogs << new DialogLine(name:"REMOVE", dialog:"REMOVE", engName:"Daniel", engDialog:"I am fine too.  Is everything ok with you? (Is everything fine?)")
        dialogs << new DialogLine(name:"REMOVE", dialog:"REMOVE", engName:"Mary", engDialog:"Yes everything is fine.  I am happy that I have seen you.")
        dialogs << new DialogLine(name:"REMOVE", dialog:"REMOVE", engName:"Daniel", engDialog:"I am happy to have seen you too.")
        dialogs << new DialogLine(name:"REMOVE", dialog:"REMOVE", engName:"Mary", engDialog:"Who is that?")
        dialogs << new DialogLine(name:"REMOVE", dialog:"REMOVE", engName:"Daniel", engDialog:"That is John.  His name is John.")
    }
}
