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
        data:
            previewAreaMap:
                entry_title: "#entryTitle"
                entry_content: "#preview"
        methods:
            preview: (e) ->
                $input    = $ e.target
                $textArea = $ @.$data.previewAreaName[e.target.id]
                markdownPreview.preview($input, $textArea)
