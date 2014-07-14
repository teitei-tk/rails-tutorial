$ ->
    content = new Vue
        el: ".root-index-wrapper"
        created: (e) ->
            console.log "content load finish"
        data:
            contents: [
                {
                    title: "hoge"
                    content: "test"
                }
                {
                    title: "hoge"
                    content: "test"
                }
            ]
