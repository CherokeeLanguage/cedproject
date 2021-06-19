package net.cherokeedictionary.chrbook.util

def entries = """'wall cloud', 'asohyologila', '101954'
'tornado', 'unole/ agaluga utana', '101955'
'blizzard', 'usgasedi gutisgvi', '101956'
'avalanche', 'odalv dadelisgalihvi', '101957'
'clear sky', 'uligaliyvda', '101958'
'drizzle', 'asdutlitsido', '101959'
'flood', 'deganohugi', '101960'
'snow flurries', 'vn(v)tsi  ganohilidoha', '101961'
'freezing', 'ganesdalidi', '101962'
'freezing rain', 'dayowanulida', '101963'
'haze', 'tsugasvsdi', '101964'
'heavy rain', 'gasonv\\'vsga / gasonvhi  agasga', '101965'
'high temperature (weather)', 'wagalvladiyv nudihlegvi', '101966'
'hoarfrost', 'unanusdi', '101967'
'hurricane', 'amequohi  edohv agaluga', '101968'
'whirlwind', 'agaluga', '101969'
'low temperature (weather)', 'weladiyv nuyvtlvi', '101970'
'misting rain', 'kanvyolidi', '101971'
'mostly cloudy', 'utli iga ulogili', '101972'
'partly cloudy', 'udadatli ulogila', '101973'
'rockslide', 'nvya  gasvdosgv', '101974'
'mudslide', 'tlawoti  gvdalosgv', '101975'
'sleet', 'ᎦᏁᏐᎣᏍᎩ    ganeso\\'osgi', '101976'
'snow', 'vn(v)tsi', '101977'
'snow showers', 'digutisgi', '101978'
'wildfire', 'degaligv', '101979'
'current temperature', 'nogwu  tsigi nudihlegvi', '101980'
'isolated thunderstorm', 'iyudali ahyvdagwalosgi', '101981'
'moderate to heavy snow', 'ayehli  ale gageda  gutisgi', '101982'
'rain and snow', 'agasgi ale gutisgi', '101983'
'scattered showers', 'tsudigaleyotsv digasgi', '101984'
'scattered snow showers', 'tsudigaleyotsv vn(v)tsi', '101985'
'scattered thunderstorms', 'tsudigaleyotsv  dihyvdagwalosgi', '101986'
'The wind is blowing about.', 'ganoleha', '101987'
"""

entries.eachLine {
    def starr = it.split(",")
    starr[0] = starr[0].trim().substring(1, starr[0].trim().size() - 1)
    starr[1] = starr[1].trim().substring(1, starr[1].trim().size() - 1)
    starr[2] = starr[2].trim().substring(1, starr[2].trim().size() - 1)
    println "vocabulary.\"${starr[0]}\" = new Vocabulary(english:\"${starr[0]}\", cherokee:\"${starr[1]}\", footnote: new Footnote(src:\"CED ${starr[0]}\", link:\"https://cherokeedictionary.net/share/${starr[2]}\", linkTitle:\"https://cherokeedictionary.net/share/${starr[2]}\", isInternal:false))"
}
