package net.cherokeedictionary.chrbook.sections

class GreetingsSection extends BaseSection {
    GreetingsSection() {
        title = "Greet Others"
        titleTranslit = "unalihelijeti"

        //todo: what if these have audio files?
        vocabulary = [:]
        vocabulary.Titus = 'Dadasi'
        vocabulary.Timothy = 'Dimadi'
        vocabulary.Mary = 'Meli'
        vocabulary.Mark = 'Maga'
        vocabulary.Daniel = 'Danili'
        vocabulary.Susan = 'Susani'
        vocabulary.John = 'Jani'
        vocabulary.Hello = '(o)siyo'
        vocabulary.And = ['ale', '<e>or', 'nole']
        vocabulary.Good = 'osda'
        vocabulary."Well/Fine" = 'osigwu'

        topics = ['How to greet people',
                  'How to make short descriptive phrases',
                  'About definites and indefinites',
                  'Say "hello" and "goodbye"',
                  'Ask how someone is doing']
        dialogs = []
        dialogs << new DialogLine(name:"Danili",dialog:"Osiyo.  Danili dawadoa.  Gado dejadoa?", engName:"Daniel", engDialog:"Hello.  My name is Daniel.  What is your name?")
        dialogs << new DialogLine(name:"Susani", dialog:"Osiyo.  Susani dawadoa.  Dohiju?", engName:"Susan", engDialog:"Hello.  My name is Susan.  How are you?")
        dialogs << new DialogLine(name:"Danili", dialog:"Osigwu.  Nihinahv?", engName:"Daniel", engDialog:"I'm fine.  And you?")
        dialogs << new DialogLine(name:"Susani", dialog:"Osda.  Donadagohvi.", engName:"Susan", engDialog:"Good.  Goodbye.")
        dialogs << new DialogLine(name:"Danili", dialog:"Donadagohvi.", engName:"Daniel", engDialog:"Goodbye.")
    }
}
