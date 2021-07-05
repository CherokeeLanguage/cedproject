package net.cherokeedictionary.chrbook

def str = """syllabary
accent
sounds
vowels, consonants, etc

greetings
do you speak japanese?
please speak a little slower
thanks!
hello how are you?
I'd like you to meet...
what's new?
see you soon
have you two met/
glad to have met you
what's your name?
where are you from?
numbers 1-10
numbers
more numbers
pronunciation of numbers before certain counters
ordinals
two and two
writing and mailing letters and faxes
telephoning
the telephone number is...
my address is...
how old are you?
days and months
some dates
meeting an old friend
what time is it?
the time is now....
when will you come?
it's time

ago
morning, noon, and night
this week, next month, etc
expressions of past, present, and future

days of the week
days of the month
waht's the date today?
months of the year

how's the weather?
the seasons

where is it?
here and there
near and far
on the road
bus, train, subway, taxi
north, south, east, west
i have been to...
sometimes I go...
iku to go
a few action phases

in a restaurant
something to drink
breakfast
a sample menu

colors
shopping
how much/
how many?
it costs...

family matters
professions"""

str.eachLine {
    if (it != "") {
        println "nChapter(\"${it}\") {}"
    }
}