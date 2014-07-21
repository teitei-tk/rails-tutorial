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
            perpage: 10
            cond:
                offset: 0
                limit: 10
        methods:
            getPostEntries: (params) ->
                self = @
                params = params or
                    data:
                        offset: entitiy.$data.cond.offset
                        limit: entitiy.$data.cond.limit
                xhrParam = $.extend {}, params, url: "{0}/entries/get_by_cond.json".format App.Config.url

                xhr = $.ajax xhrParam
                xhr.done (entries) ->
                    for entry in entries
                        entitiy.$data.contents.push new Entry entry
            more: ->
                @$data.cond.offset = @$data.cond.offset + @$data.perpage
                @$data.cond.limit  = @$data.cond.limit  + @$data.perpage

                @.getPostEntries()

    # start render post entry
    entitiy.$options.methods.getPostEntries()
