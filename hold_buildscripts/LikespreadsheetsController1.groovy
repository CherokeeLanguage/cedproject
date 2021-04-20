package cherokeedictionary


import cherokee.dictionary.Likespreadsheets
import net.cherokeedictionary.transliteration.SyllabaryUtil

//import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

//@Transactional(readOnly = true)
class LikespreadsheetsController {

    def copyLikespreadsheetsToHistoryService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
//        redirect url: "/"
        boolean loggedin = session.getAttribute("loggedin")
        if (!loggedin) {
            redirect url: "/"
        } else {
            params.max = Math.min(max ?: 10, 100)
            respond Likespreadsheets.list(params), model: [likespreadsheetsInstanceCount: Likespreadsheets.count()]
        }
    }

    def show(Likespreadsheets likespreadsheetsInstance) {
        boolean loggedin = session.getAttribute("loggedin")
        if (!loggedin) {
            redirect url: "/"
        } else {
//        respond likespreadsheetsInstance
//            println likespreadsheetsInstance
            render(view: "hold/show", model: [likespreadsheetsInstance: likespreadsheetsInstance]);
        }
    }

    def create() {
        boolean loggedin = session.getAttribute("loggedin")
        if (!loggedin) {
            redirect url: "/"
        } else {
//        respond likespreadsheetsInstance
            render(view: "hold/create", model: [likespreadsheetsInstance: new Likespreadsheets(params)]);
        }
//        respond new Likespreadsheets(params)
    }

//    @Transactional
    def save(Likespreadsheets likespreadsheetsInstance) {
        boolean loggedin = session.getAttribute("loggedin")
        if (!loggedin) {
            redirect url: "/"
        }
        if (likespreadsheetsInstance == null) {
            notFound()
            return
        }

        if (likespreadsheetsInstance.hasErrors()) {
            respond likespreadsheetsInstance.errors, view:'hold/create'
            return
        }

        likespreadsheetsInstance.save flush:true



        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'likespreadsheets.label', default: 'Likespreadsheets'), likespreadsheetsInstance.id])
                redirect likespreadsheetsInstance
            }
            '*' { respond likespreadsheetsInstance, [status: CREATED] }
        }
    }

    def edit(Likespreadsheets likespreadsheetsInstance) {
        boolean loggedin = session.getAttribute("loggedin")
        if (!loggedin) {
            redirect url: "/"
        } else {
            def ls1 = Likespreadsheets.findById(likespreadsheetsInstance.id)

            copyLikespreadsheetsToHistoryService.copyLikeToHistory(ls1, session.getAttribute("admin"))
//        respond likespreadsheetsInstance
            render(view: "hold/edit", model: [likespreadsheetsInstance: likespreadsheetsInstance]);
        }
    }

//    @Transactional
    def update(Likespreadsheets likespreadsheetsInstance) {
        if (likespreadsheetsInstance == null) {
            notFound()
            return
        }

        if (likespreadsheetsInstance.hasErrors()) {
            likespreadsheetsInstance.errors.allErrors.each {
                println it
            }

            respond likespreadsheetsInstance.errors, view:'hold/edit'
            return
        }

        likespreadsheetsInstance.partofspeechc = likespreadsheetsInstance.partofspeechc ?: ""

        likespreadsheetsInstance.save flush:true
        copyLikespreadsheetsToHistoryService.copyLikeToHistory(likespreadsheetsInstance, session.getAttribute("admin"))

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Likespreadsheets.label', default: 'Likespreadsheets'), likespreadsheetsInstance.id])
                redirect likespreadsheetsInstance
            }
            '*'{ respond likespreadsheetsInstance, [status: OK] }
        }
    }

//    @Transactional
    def delete(Likespreadsheets likespreadsheetsInstance) {

        if (likespreadsheetsInstance == null) {
            notFound()
            return
        }

        likespreadsheetsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Likespreadsheets.label', default: 'Likespreadsheets'), likespreadsheetsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def simplifiedEntry(Likespreadsheets likespreadsheetsInstance) {
        boolean loggedin = session.getAttribute("loggedin")
        if (!loggedin) {
            redirect url: "/"
        } else {
            if (likespreadsheetsInstance == null) {
                render(view: "hold/simplifiedEntry")
                return
            }

            if (likespreadsheetsInstance.hasErrors()) {
                respond likespreadsheetsInstance.errors, view: 'hold/simplifiedEntry'
                return
            }

            likespreadsheetsInstance.partofspeechc = likespreadsheetsInstance.partofspeechc ?: ""

            def su = new SyllabaryUtil()
            likespreadsheetsInstance.entrytranslit = su.parseSyllabary(likespreadsheetsInstance.syllabaryb ?: '')
            likespreadsheetsInstance.nounadjpluraltranslit = su.parseSyllabary(likespreadsheetsInstance.nounadjpluralsyllf ?: '')
            likespreadsheetsInstance.vfirstprestranslit = su.parseSyllabary(likespreadsheetsInstance.vfirstpresh ?: '')
            likespreadsheetsInstance.vthirdpasttranslit = su.parseSyllabary(likespreadsheetsInstance.vthirdpastsyllj ?: '')
            likespreadsheetsInstance.vthirdprestranslit = su.parseSyllabary(likespreadsheetsInstance.vthirdpressylll ?: '')
            likespreadsheetsInstance.vsecondimpertranslit = su.parseSyllabary(likespreadsheetsInstance.vsecondimpersylln ?: '')
            likespreadsheetsInstance.vthirdinftranslit = su.parseSyllabary(likespreadsheetsInstance.vthirdinfsyllp ?: '')
            likespreadsheetsInstance.sentencetranslit = su.parseSyllabary(likespreadsheetsInstance.sentencesyllr ?: '')

            if (likespreadsheetsInstance.save(flush: true)) {
                if (likespreadsheetsInstance.hasErrors()) {
                    respond likespreadsheetsInstance.errors, view: 'hold/simplifiedEntry'
                    return
                } else {
                    flash.message = "Added new entry to database for ${likespreadsheetsInstance.syllabaryb} with id of ${likespreadsheetsInstance.id}"
                }
            }

            render(view: "hold/simplifiedEntry", model: [likespreadsheetsInstance: likespreadsheetsInstance])
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'likespreadsheets.label', default: 'Likespreadsheets'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
