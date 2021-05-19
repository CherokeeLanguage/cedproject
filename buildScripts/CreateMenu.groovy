package net.cherokeedictionary.menubuilder

//ideas from https://askubuntu.com/questions/1146166/bash-how-to-create-a-menu-with-submenu
// the lists here include a title that will be displayed to a user such as "clone repos" and the function name in functions.sh that will be called when
// this menu item is selected
def CHECKOUT_AND_BUILD_COMMANDS=
        [title:"CHECKOUT AND BUILD COMMANDS",
         "clone repos": "gitClone",
         "pull latest from git": "updateLocalFromGit",
         "status of repositories from git": "statusLocalFromGit",
         "reset repositories from git": "resetLocalFromGit"
        ]

def GIT_ADD_AND_COMMIT=
        [title:"GIT ADD AND COMMIT",
         "add and commit ALL repositories to git": "addCommitToGit",
         "add and commit transliteration": "buildTransliteration",
         "add and commit utilities": "addCommitUtilities",
         "add and commit conjugation": "addCommitConjugation",
         "add and commit date time library": "addCommitDateTime",
         "add and commit react": "addCommitReactCEDReact ./",
         "add and commit deconstructor": "addCommitDeconstructor ./",
         "add and commit dictionary (production)": "addCommitDictionary ./"
        ]

def BUILD_COMMANDS=
        [title:"BUILD COMMANDS",
         "build all": "buildAll",
         "build transliteration": "buildTransliteration",
         "build utilities": "buildUtilities",
         "build conjugation": "buildConjugation",
         "build date time library": "buildDateTime",
         "build react": "buildReactCED ./",
         "build deconstructor": "buildDeconstructor ./",
         "build dictionary (production)": "buildDictionary ./"
        ]

def ALL_SERVER_COMMANDS=
        [title:"ALL SERVER COMMANDS",
         "backup database on server": "backupDatabaseOnServer",
         "backup database from server": "pullDatabaseFromServer",
         "upload latest war to site": "updateServerWithLatestWar",
         "go to server": "goToServer",
         "restartServer with latest war": "restartServer"
        ]

def ALL_LINUXMAC_COMMANDS=
        [title:"ALL LINUX/MAC COMMANDS",
         "linux/mac install node": "installNodeLinuxMac",
         "linux/mac install npm": "installNPMLinuxMac",
         "linux/mac install sdkman gradle grails jdk groovy": "installSDKMANAllLinuxMac",
         "linux/mac install sdkman": "installSDKManLinuxMac",
         "linux/mac install gradle ..": "installGradleSDKLinuxMac",
         "linux/mac install grails ..": "installGrailsSDKLinuxMac",
         "linux/mac install jdk ": "installJDKSDKLinuxMac",
         "linux/mac install groovy ..": "installGroovySDKLinuxMac"
        ]

def ALL_WINDOWS_COMMANDS=
        [title:"ALL WINDOWS COMMANDS",
         "windows install node": "installNodeWindows",
         "windows install npm": "installNPMWindows",
         "windows install gradle grails jdk groovy": "installAllWindows",
         "windows install gradle": "installGradleSDKWindows",
         "windows install grails": "installGrailsSDKWindows",
         "windows install jdk": "installJDKSDKWindows",
         "windows install groovy": "installGroovySDKWindows"
        ]

def ALL_DATABASE_COMMANDS=
        [title:"ALL DATABASE COMMANDS",
         "mysql install database": "installMysqlDatabase",
        ]

def menus = [CHECKOUT_AND_BUILD_COMMANDS, GIT_ADD_AND_COMMIT, BUILD_COMMANDS, ALL_SERVER_COMMANDS, ALL_LINUXMAC_COMMANDS, ALL_WINDOWS_COMMANDS, ALL_DATABASE_COMMANDS]

def f = new File("build.sh")
def f2 = new File("buildScripts/functions.sh").readLines()
f.write("")
f2.each {
        f.append(it)
        f.append("\n")
}

def createSubMenu(item, f) {
        f.append  "function ${item.get("title").replaceAll(" ", "_").replaceAll("/", "")}() {\n"
        f.append("clear\n")
        f.append  "\tPS3='Please <ENTER> submenu ${item.get("title")} option: '\n"
        f.append  "\techo \"${item.get("title")}\"\n"
        f.append  "\toptions=("
        item.each {
                if (it.key != "title") {
                        f.append  "\"${it.key.replaceAll("/", "")}\" "
                }
        }
        
        f.append  "\"Back to Main Menu\")\n"
        f.append  "\tselect opt in \"\${options[@]}\"\n"
        f.append  "\tdo\n"
        f.append  "\tcase \$opt in\n"
                item.each {
                        if (it.key != "title") {
                                f.append  "\t\t\"${it.key.replaceAll("/", "")}\")\n"
                                f.append  "\t\t\t${it.value}\n"
                                f.append  "\t\t\t;;\n"
                        }
                }
        f.append  "\t\t\"Back to Main Menu\")\n"
        f.append("clear\n")
        f.append  "\t\t\treturn\n"
        f.append  "\t\t\t;;\n"
        f.append  "\t\t*) echo \"invalid option \$REPLY\"\n\t\t\t;;\n"
        f.append  "\tesac\n"
        f.append  "\tdone\n"
        f.append  "}\n\n"
}

menus.each {
    createSubMenu(it, f)
}

f.append "echo \$(prop 'USERNAME') \$(prop 'HOSTS')\n"
f.append  "PS3='Please <ENTER> main option: '\n"
f.append  "options=("
menus.each {
    f.append  "\"${it.get("title")}\" "
}
f.append  "\"quit\")\n"
f.append  "select opt in \"\${options[@]}\"\n"
f.append  "do\n"
f.append  "\tcase \$opt in\n"
menus.each {
        f.append  "\t\t\"${it.get("title")}\")\n"
        f.append  "\t\t\t${it.get("title").replaceAll(" ", "_").replaceAll("/", "")}\n"
        f.append  "\t\t\t;;\n"
}
f.append  "\t\t\"quit\")\n"
f.append  "\t\t\texit\n"
f.append  "\t\t\t;;\n"
f.append  "\t\t\t*) echo \"invalid option \$REPLY\";;\n"
f.append  "\tesac\n"
f.append  "done\n"