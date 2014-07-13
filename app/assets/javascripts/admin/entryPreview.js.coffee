class MarkdownPreview
    preview: ($input, $preview) ->
        text = $input.val().trim()
        if text.length <= 0
            $preview.hide()
            return false
        else
            $preview.show()

        $preview.html markdown.toHTML(text)

$ ->
    markdownPreview = new MarkdownPreview

    content = new Vue
        el: ".admin-post-form"
        created: (e) ->
            console.log "dom loading finish"
        data:
            previewAreaMap:
                entry_title: "#entryTitle"
                entry_content: "#preview"
            entry:
                title: ''
                content: ''
            validation:
                title: false
                content: false
        filters:
            titleValidator: (val) ->
                @.validation.title = !!val
                return val
            contentValidator: (val) ->
                @.validation.content = !!val
                return val
        methods:
            preview: (e) ->
                $errors = $ "ul.errors"
                if not @.validation.title or not @.validation.content
                    $errors.show()
                else
                    $errors.hide()

                $input    = $ e.target
                $textArea = $ @.$data.previewAreaMap[e.target.id]
                markdownPreview.preview($input, $textArea)

            submitValidation: (e) ->
                if @.validation.title  and @.validation.content
                    return true
                e.preventDefault()
