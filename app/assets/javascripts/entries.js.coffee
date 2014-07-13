class Entry
    constructor: ()->

$ ->
    content = new Vue
        el: ".contents"
        created: (e) ->
            console.log "content load finish"
        data:
            title: "hoge"
            content: "content"
