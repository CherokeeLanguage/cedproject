package net.cherokeedictionary.chrbook.sections

import net.cherokeedictionary.chrbook.util.Footnote
import net.cherokeedictionary.chrbook.util.Vocabulary

class TimesSection extends BaseSection {
    TimesSection() {
        title = "Time, Counting, Hours, Minutes, Seconds, Fractions"
        vocabularies."Hours" = "Ijutliloda"
        vocabularies."Minutes" = "Iyatawostanv"
        vocabularies."Seconds" = "Iyasetlv"
        vocabularies."Before" = "Udalula"
        vocabularies."After" = "Ulosvsdi"
        vocabularies."Today" = "Gohi iga"
        vocabularies."Tomorrow" = "Sanale iyv"
        vocabularies."Morning" = "Sanale didla"
        vocabularies."Yesterday" = "Svhi"
        vocabularies."Dawn" = "Ugitsideyi"
        vocabularies."Afternoon" = new Vocabulary(english:"Afternoon", cherokee: "Svhiyeyi didla", footnote: new Footnote(src:"Any time after 12:00 p.m. until the sun starts to set."))
        vocabularies."Evening" = new Vocabulary(english:"Evening", cherokee: "Svhiyeyi", footnote: new Footnote(src:"The time of day when the sun is setting."))
        vocabularies."Night" = "Usv"
        vocabularies."Midnight" = new Vocabulary(english:"Midnight", cherokee: "Svnoyi", footnote: new Footnote(src:"The time somewhere in the late time of night like 12:00 a.m."))
        vocabularies."Day/ Noon" = "Iga"
        vocabularies."At what time?" = "Hila atliilisv?"
        vocabularies."What time is it?\\\\ (what hour is it)" = "Hila iyuwanilv?"
        vocabularies."What time is it?" = "Hila atliili?"
        vocabularies."When are you going?" = "Hilayv tesi?"
        vocabularies."It is 8:00" = "Chanela iyuwanilv."
        vocabularies."1 Hour" = "Sutliloda"
        vocabularies."When will it start?" = "Hilayv dvdalenvhi?"
        vocabularies."When will it end?" = "Hilayv dvlisgwadi?"
        vocabularies."9:45 (fifteen minutes before ten)" = "Sgigadu iyatawostanv udalula sgohi"
        vocabularies."10:15 (fifteen minutes after ten)" = "Sgigadu iyatawostanv ulosvsdi sgohi"
        vocabularies."1:30 (one and a half)" = "Sagwu ayetli"
        vocabularies."Wake up!" = "hiyegi"
        vocabularies."Go to sleep!" = "hitlvna"
        vocabularies."days" = "tsusvhida"
        vocabularies."this evening" = "kohi svhiyeyi"
        vocabularies."next morning" = "ugitsvda"
        vocabularies."watch" = "watsi"
        vocabularies."clock (lit. big watch)" = "utana watsi"
        vocabularies."outside" = "doyi"

//        dialogs << new DialogLine(name:"Danili", dialog:"Hila atliilisv?", engName:"Daniel", engDialog:"At what time?")
    }
}
