#!/bin/bash

while true
do
    clear
    echo "Menu ----"
    echo "Choose what you want to do"
    echo "1: build all"
    echo "2: build transliteration engine"
    echo "3: build conjugation engine"
    echo "4: start local server"
    echo "5: deploy war to site"
    echo "6: commit transliteration engine changes"
    echo "7: commit conjugation engine changes"
    echo "8: clone all (transliteration, conjugation, site, grammar guide, CNT)"
    echo "9: clone transliteration engine"
    echo "10: clone conjugation engine"
    echo "11: clone site"
    echo "12: clone grammar guide"
    echo "13: clone CNT"
    echo "14: update database on server"
    echo "15: update local database"
    echo "16: backup database"
    echo "17: clone CNT"

    echo "Quit q:"
    echo -e "\n"
    echo -e "Enter your selection: \c"
    read -r answer
    case "$answer" in
        q) exit ;;
        1)
          ;;
    esac
    echo -e "Press Enter to continue \c"
    read input
done
