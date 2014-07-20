class Entry extends App.Entry.Format
    _validate: () ->
        @title      = @detailLink.format App.Config.url, @id, @title
        @content    = App.Util.strimwidth markdown.toHTML App.Util.escapeHtml @content
        @updatedAt  = @updatedAt.format "YYYY/MM/DD hh:mm"

$ ->
    entitiy = new Vue
        el: ".root-index-wrapper"
        data:
            contents: []
            message: ""
            offset: 10
            limit: 10
        method:
            getPostEntries: (params) ->
                self = @

                console.log entitiy
                params = params or {}
                xhrParam = $.extend {}, params, url: "{0}/entries/entry_by_cond.json".format App.Config.url

                xhr = $.ajax xhrParam
                xhr.done (entries) ->
                    if entries.length <= 0
                        self.entryNotfound()
                        return
                    for entry in entries
                        entitiy.$data.contents.push new Entry entry

                xhr.fail () ->
                    self.entryNotfound()

            entryNotfound: ->
                console.log entitiy

    # start render post entry
    entitiy.$options.method.getPostEntries()
