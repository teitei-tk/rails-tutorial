class Format
    detailLink : "<a href='{0}/entries/detail/{1}'>{2}</a>"

    constructor:(entry) ->
        @entry      = entry
        @id         = entry["id"]
        @title      = entry["title"]
        @content    = entry['content']
        @updatedAt  = new Date entry["updated_at"]

        @._validate()

    _validate: () ->

App.Entry = {}
App.Entry.Format = Format
