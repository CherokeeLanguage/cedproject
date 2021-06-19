package net.cherokeedictionary.chrbook.sections

import net.cherokeedictionary.chrbook.util.Footnote
import net.cherokeedictionary.chrbook.util.Vocabulary

class TimesSection extends BaseSection {
    TimesSection() {
        title = "Time, Counting, Hours, Minutes, Seconds, Fractions"
        vocabulary = [:]

        vocabulary."Hours" = "Ijutliloda"
        vocabulary."Minutes" = "Iyatawostanv"
        vocabulary."Seconds" = "Iyasetlv"
        vocabulary."Before" = "Udalula"
        vocabulary."After" = "Ulosvsdi"
        vocabulary."Today" = "Gohi iga"
        vocabulary."Tomorrow" = "Sanale iyv"
        vocabulary."Morning" = "Sanale didla"
        vocabulary."Yesterday" = "Svhi"
        vocabulary."Dawn" = "Ugitsideyi"
        vocabulary."Afternoon" = new Vocabulary(english:"Afternoon", cherokee: "Svhiyeyi didla", footnote: new Footnote(src:"Any time after 12:00 p.m. until the sun starts to set."))
        vocabulary."Evening" = new Vocabulary(english:"Evening", cherokee: "Svhiyeyi", footnote: new Footnote(src:"The time of day when the sun is setting."))
        vocabulary."Night" = "Usv"
        vocabulary."Midnight" = new Vocabulary(english:"Midnight", cherokee: "Svnoyi", footnote: new Footnote(src:"The time somewhere in the late time of night like 12:00 a.m."))
        vocabulary."Day/ Noon" = "Iga"
        vocabulary."At what time?" = "Hila atliilisv?"
        vocabulary."What time is it?\\\\ (what hour is it)" = "Hila iyuwanilv?"
        vocabulary."What time is it?" = "Hila atliili?"
        vocabulary."When are you going?" = "Hilayv tesi?"
        vocabulary."It is 8:00" = "Chanela iyuwanilv."
        vocabulary."1 Hour" = "Sutliloda"
        vocabulary."When will it start?" = "Hilayv dvdalenvhi?"
        vocabulary."When will it end?" = "Hilayv dvlisgwadi?"
        vocabulary."9:45 (fifteen minutes before ten)" = "Sgigadu iyatawostanv udalula sgohi"
        vocabulary."10:15 (fifteen minutes after ten)" = "Sgigadu iyatawostanv ulosvsdi sgohi"
        vocabulary."1:30 (one and a half)" = "Sagwu ayetli"
        vocabulary."Wake up!" = "hiyegi"
        vocabulary."Go to sleep!" = "hitlvna"
        vocabulary."days" = "tsusvhida"
        vocabulary."this evening" = "kohi svhiyeyi"
        vocabulary."next morning" = "ugitsvda"
        vocabulary."watch" = "watsi"
        vocabulary."clock (lit. big watch)" = "utana watsi"

        dialogs = []
        dialogs << new DialogLine(name:"Danili", dialog:"Hila atliilisv?", engName:"Daniel", engDialog:"At what time?")
    }
}
