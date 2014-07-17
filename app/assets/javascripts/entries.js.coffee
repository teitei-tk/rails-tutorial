class Format
    constructor:(entry) ->
        @id         = entry["id"]
        @title      = entry["title"]
        @content    = entry['content']
        @updatedAt  = new Date entry["updated_at"]

        console.log entry

        @._validate()

    _validate: () ->

App.Entry = {}
App.Entry.Format = Format
