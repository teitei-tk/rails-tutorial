class Entry
    constructor:(entry) ->
        @title =  entry["title"]
        @content = entry['content']
        @updatedAt = new Date entry["updated_at"]

        @._validate()

    _validate: () ->
        @content = App.Util.strimwidth markdown.toHTML App.Util.escapeHtml @content
        @updatedAt = @updatedAt.format "YYYY/MM/DD hh:mm"

$ ->
    entitiy = new Vue
        el: ".root-index-wrapper"
        data:
            contents: []
            message: ""
        method:
            getPostEntries: (params) ->
                self = @
                params = params or {}
                xhrParam = $.extend {}, params, url: "{0}/entries.json".format App.Config.url

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
