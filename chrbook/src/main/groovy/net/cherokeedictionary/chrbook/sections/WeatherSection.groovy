package net.cherokeedictionary.chrbook.sections

import net.cherokeedictionary.chrbook.util.Footnote
import net.cherokeedictionary.chrbook.util.Vocabulary

class WeatherSection extends BaseSection {
    WeatherSection() {
        title = "Weather"
        titleTranslit = "doyadidla nigalistanvsgv"
        topics << "JAC Weather pp29"
        topics << "How's the weather today? What's the weather like today?"
        topics << "It's nice weather."
        topics << "It's raining."
        topics <<  "It's snowing."
        topics <<  "It's hot."
        topics <<  "It's cold."
        topics <<  "It's cool"
        topics <<  "It's warm"
        topics <<  "The weather is bad today."

        vocabularies."weather" = new Vocabulary(english:"weather", cherokee:"doyadidla nigalistanvsgv", footnote: new Footnote(src:"CED weather", link:"https://cherokeedictionary.net/share/76306",linkTitle:"https://cherokeedictionary.net/share/76306", isInternal:false))
        vocabularies."weather map" = new Vocabulary(english:"weather map", cherokee:"doyi nigalistanidohv kanohesgi", footnote: new Footnote(src:"CED weather map",link:"https://cherokeedictionary.net/share/76304",linkTitle:"https://cherokeedictionary.net/share/76304", isInternal:false))
        vocabularies."wall cloud" = new Vocabulary(english:"wall cloud", cherokee:"asohyologila", footnote: new Footnote(src:"CED wall cloud", link:"https://cherokeedictionary.net/share/101954", linkTitle:"https://cherokeedictionary.net/share/101954", isInternal:false))
        vocabularies."tornado" = new Vocabulary(english:"tornado", cherokee:"unole/ agaluga utana", footnote: new Footnote(src:"CED tornado", link:"https://cherokeedictionary.net/share/101955", linkTitle:"https://cherokeedictionary.net/share/101955", isInternal:false))
        vocabularies."blizzard" = new Vocabulary(english:"blizzard", cherokee:"usgasedi gutisgvi", footnote: new Footnote(src:"CED blizzard", link:"https://cherokeedictionary.net/share/101956", linkTitle:"https://cherokeedictionary.net/share/101956", isInternal:false))
        vocabularies."avalanche" = new Vocabulary(english:"avalanche", cherokee:"odalv dadelisgalihvi", footnote: new Footnote(src:"CED avalanche", link:"https://cherokeedictionary.net/share/101957", linkTitle:"https://cherokeedictionary.net/share/101957", isInternal:false))
        vocabularies."clear sky" = new Vocabulary(english:"clear sky", cherokee:"uligaliyvda", footnote: new Footnote(src:"CED clear sky", link:"https://cherokeedictionary.net/share/101958", linkTitle:"https://cherokeedictionary.net/share/101958", isInternal:false))
        vocabularies."drizzle" = new Vocabulary(english:"drizzle", cherokee:"asdutlitsido", footnote: new Footnote(src:"CED drizzle", link:"https://cherokeedictionary.net/share/101959", linkTitle:"https://cherokeedictionary.net/share/101959", isInternal:false))
        vocabularies."flood" = new Vocabulary(english:"flood", cherokee:"deganohugi", footnote: new Footnote(src:"CED flood", link:"https://cherokeedictionary.net/share/101960", linkTitle:"https://cherokeedictionary.net/share/101960", isInternal:false))
        vocabularies."snow flurries" = new Vocabulary(english:"snow flurries", cherokee:"vn(v)tsi  ganohilidoha", footnote: new Footnote(src:"CED snow flurries", link:"https://cherokeedictionary.net/share/101961", linkTitle:"https://cherokeedictionary.net/share/101961", isInternal:false))
        vocabularies."freezing" = new Vocabulary(english:"freezing", cherokee:"ganesdalidi", footnote: new Footnote(src:"CED freezing", link:"https://cherokeedictionary.net/share/101962", linkTitle:"https://cherokeedictionary.net/share/101962", isInternal:false))
        vocabularies."freezing rain" = new Vocabulary(english:"freezing rain", cherokee:"dayowanulida", footnote: new Footnote(src:"CED freezing rain", link:"https://cherokeedictionary.net/share/101963", linkTitle:"https://cherokeedictionary.net/share/101963", isInternal:false))
        vocabularies."haze" = new Vocabulary(english:"haze", cherokee:"tsugasvsdi", footnote: new Footnote(src:"CED haze", link:"https://cherokeedictionary.net/share/101964", linkTitle:"https://cherokeedictionary.net/share/101964", isInternal:false))
        vocabularies."heavy rain" = new Vocabulary(english:"heavy rain", cherokee:"gasonv\'vsga / gasonvhi  agasga", footnote: new Footnote(src:"CED heavy rain", link:"https://cherokeedictionary.net/share/101965", linkTitle:"https://cherokeedictionary.net/share/101965", isInternal:false))
        vocabularies."high temperature (weather)" = new Vocabulary(english:"high temperature (weather)", cherokee:"wagalvladiyv nudihlegvi", footnote: new Footnote(src:"CED high temperature (weather)", link:"https://cherokeedictionary.net/share/101966", linkTitle:"https://cherokeedictionary.net/share/101966", isInternal:false))
        vocabularies."hoarfrost" = new Vocabulary(english:"hoarfrost", cherokee:"unanusdi", footnote: new Footnote(src:"CED hoarfrost", link:"https://cherokeedictionary.net/share/101967", linkTitle:"https://cherokeedictionary.net/share/101967", isInternal:false))
        vocabularies."hurricane" = new Vocabulary(english:"hurricane", cherokee:"amequohi  edohv agaluga", footnote: new Footnote(src:"CED hurricane", link:"https://cherokeedictionary.net/share/101968", linkTitle:"https://cherokeedictionary.net/share/101968", isInternal:false))
        vocabularies."whirlwind" = new Vocabulary(english:"whirlwind", cherokee:"agaluga", footnote: new Footnote(src:"CED whirlwind", link:"https://cherokeedictionary.net/share/101969", linkTitle:"https://cherokeedictionary.net/share/101969", isInternal:false))
        vocabularies."low temperature (weather)" = new Vocabulary(english:"low temperature (weather)", cherokee:"weladiyv nuyvtlvi", footnote: new Footnote(src:"CED low temperature (weather)", link:"https://cherokeedictionary.net/share/101970", linkTitle:"https://cherokeedictionary.net/share/101970", isInternal:false))
        vocabularies."misting rain" = new Vocabulary(english:"misting rain", cherokee:"kanvyolidi", footnote: new Footnote(src:"CED misting rain", link:"https://cherokeedictionary.net/share/101971", linkTitle:"https://cherokeedictionary.net/share/101971", isInternal:false))
        vocabularies."mostly cloudy" = new Vocabulary(english:"mostly cloudy", cherokee:"utli iga ulogili", footnote: new Footnote(src:"CED mostly cloudy", link:"https://cherokeedictionary.net/share/101972", linkTitle:"https://cherokeedictionary.net/share/101972", isInternal:false))
        vocabularies."partly cloudy" = new Vocabulary(english:"partly cloudy", cherokee:"udadatli ulogila", footnote: new Footnote(src:"CED partly cloudy", link:"https://cherokeedictionary.net/share/101973", linkTitle:"https://cherokeedictionary.net/share/101973", isInternal:false))
        vocabularies."rockslide" = new Vocabulary(english:"rockslide", cherokee:"nvya  gasvdosgv", footnote: new Footnote(src:"CED rockslide", link:"https://cherokeedictionary.net/share/101974", linkTitle:"https://cherokeedictionary.net/share/101974", isInternal:false))
        vocabularies."mudslide" = new Vocabulary(english:"mudslide", cherokee:"tlawoti  gvdalosgv", footnote: new Footnote(src:"CED mudslide", link:"https://cherokeedictionary.net/share/101975", linkTitle:"https://cherokeedictionary.net/share/101975", isInternal:false))
        vocabularies."sleet" = new Vocabulary(english:"sleet", cherokee:"ᎦᏁᏐᎣᏍᎩ    ganeso\'osgi", footnote: new Footnote(src:"CED sleet", link:"https://cherokeedictionary.net/share/101976", linkTitle:"https://cherokeedictionary.net/share/101976", isInternal:false))
        vocabularies."snow" = new Vocabulary(english:"snow", cherokee:"vn(v)tsi", footnote: new Footnote(src:"CED snow", link:"https://cherokeedictionary.net/share/101977", linkTitle:"https://cherokeedictionary.net/share/101977", isInternal:false))
        vocabularies."snow showers" = new Vocabulary(english:"snow showers", cherokee:"digutisgi", footnote: new Footnote(src:"CED snow showers", link:"https://cherokeedictionary.net/share/101978", linkTitle:"https://cherokeedictionary.net/share/101978", isInternal:false))
        vocabularies."wildfire" = new Vocabulary(english:"wildfire", cherokee:"degaligv", footnote: new Footnote(src:"CED wildfire", link:"https://cherokeedictionary.net/share/101979", linkTitle:"https://cherokeedictionary.net/share/101979", isInternal:false))
        vocabularies."current temperature" = new Vocabulary(english:"current temperature", cherokee:"nogwu  tsigi nudihlegvi", footnote: new Footnote(src:"CED current temperature", link:"https://cherokeedictionary.net/share/101980", linkTitle:"https://cherokeedictionary.net/share/101980", isInternal:false))
        vocabularies."isolated thunderstorm" = new Vocabulary(english:"isolated thunderstorm", cherokee:"iyudali ahyvdagwalosgi", footnote: new Footnote(src:"CED isolated thunderstorm", link:"https://cherokeedictionary.net/share/101981", linkTitle:"https://cherokeedictionary.net/share/101981", isInternal:false))
        vocabularies."moderate to heavy snow" = new Vocabulary(english:"moderate to heavy snow", cherokee:"ayehli  ale gageda  gutisgi", footnote: new Footnote(src:"CED moderate to heavy snow", link:"https://cherokeedictionary.net/share/101982", linkTitle:"https://cherokeedictionary.net/share/101982", isInternal:false))
        vocabularies."rain and snow" = new Vocabulary(english:"rain and snow", cherokee:"agasgi ale gutisgi", footnote: new Footnote(src:"CED rain and snow", link:"https://cherokeedictionary.net/share/101983", linkTitle:"https://cherokeedictionary.net/share/101983", isInternal:false))
        vocabularies."scattered showers" = new Vocabulary(english:"scattered showers", cherokee:"tsudigaleyotsv digasgi", footnote: new Footnote(src:"CED scattered showers", link:"https://cherokeedictionary.net/share/101984", linkTitle:"https://cherokeedictionary.net/share/101984", isInternal:false))
        vocabularies."scattered snow showers" = new Vocabulary(english:"scattered snow showers", cherokee:"tsudigaleyotsv vn(v)tsi", footnote: new Footnote(src:"CED scattered snow showers", link:"https://cherokeedictionary.net/share/101985", linkTitle:"https://cherokeedictionary.net/share/101985", isInternal:false))
        vocabularies."scattered thunderstorms" = new Vocabulary(english:"scattered thunderstorms", cherokee:"tsudigaleyotsv  dihyvdagwalosgi", footnote: new Footnote(src:"CED scattered thunderstorms", link:"https://cherokeedictionary.net/share/101986", linkTitle:"https://cherokeedictionary.net/share/101986", isInternal:false))
        vocabularies."The wind is blowing about." = new Vocabulary(english:"The wind is blowing about.", cherokee:"ganoleha", footnote: new Footnote(src:"CED The wind is blowing about.", link:"https://cherokeedictionary.net/share/101987", linkTitle:"https://cherokeedictionary.net/share/101987", isInternal:false))
    }
}
