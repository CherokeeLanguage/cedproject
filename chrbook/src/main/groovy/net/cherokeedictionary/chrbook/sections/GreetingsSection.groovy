package net.cherokeedictionary.chrbook.sections

import net.cherokeedictionary.chrbook.BookFormatter

class GreetingsSection extends BaseSection {
    GreetingsSection() {
        super()
        title = "Greet Others"
        titleTranslit = "unalihelijeti"

        //todo: what if these have audio files?
        vocabularies.Titus = 'Dadasi'
        vocabularies.Timothy = 'Dimadi'
        vocabularies.Mary = 'Meli'
        vocabularies.Mark = 'Maga'
        vocabularies.Daniel = 'Danili'
        vocabularies.Susan = 'Susani'
        vocabularies.John = 'Jani'
        vocabularies.Hello = '(o)siyo'
        vocabularies.And = ['ale', '<e>or', 'nole']
        vocabularies.Good = 'osda'
        vocabularies."Well/Fine" = 'osigwu'

        topics = ['How to greet people',
                  'How to make short descriptive phrases',
                  'About definites and indefinites',
                  'Say "hello" and "goodbye"',
                  'Ask how someone is doing']
        dialogs << new DialogLine(name:"Danili",dialog:"Osiyo.  Danili dawadoa.  Gado dejadoa?", engName:"Daniel", engDialog:"Hello.  My name is Daniel.  What is your name?")
        dialogs << new DialogLine(name:"Susani", dialog:"Osiyo.  Susani dawadoa.  Dohiju?", engName:"Susan", engDialog:"Hello.  My name is Susan.  How are you?")
        dialogs << new DialogLine(name:"Danili", dialog:"Osigwu.  Nihinahv?", engName:"Daniel", engDialog:"I'm fine.  And you?")
        dialogs << new DialogLine(name:"Susani", dialog:"Osda.  Donadagohvi.", engName:"Susan", engDialog:"Good.  Goodbye.")
        dialogs << new DialogLine(name:"Danili", dialog:"Donadagohvi.", engName:"Daniel", engDialog:"Goodbye.")
    }
}
