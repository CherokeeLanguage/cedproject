package cherokee.dictionary

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class LikespreadsheetsController {

    LikespreadsheetsService likespreadsheetsService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond likespreadsheetsService.list(params), model:[likespreadsheetsCount: likespreadsheetsService.count()]
    }

    def show(Long id) {
        respond likespreadsheetsService.get(id)
    }

    def create() {
        respond new Likespreadsheets(params)
    }

    def save(Likespreadsheets likespreadsheets) {
        if (likespreadsheets == null) {
            notFound()
            return
        }

        try {
            likespreadsheetsService.save(likespreadsheets)
        } catch (ValidationException e) {
            respond likespreadsheets.errors, view:'hold/create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'likespreadsheets.label', default: 'Likespreadsheets'), likespreadsheets.id])
                redirect likespreadsheets
            }
            '*' { respond likespreadsheets, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond likespreadsheetsService.get(id)
    }

    def update(Likespreadsheets likespreadsheets) {
        if (likespreadsheets == null) {
            notFound()
            return
        }

        try {
            likespreadsheetsService.save(likespreadsheets)
        } catch (ValidationException e) {
            respond likespreadsheets.errors, view:'hold/edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'likespreadsheets.label', default: 'Likespreadsheets'), likespreadsheets.id])
                redirect likespreadsheets
            }
            '*'{ respond likespreadsheets, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        likespreadsheetsService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'likespreadsheets.label', default: 'Likespreadsheets'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
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
