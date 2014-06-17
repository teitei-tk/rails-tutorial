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
        methods:
            preview: (e) ->
                $input   = $ e.target
                markdownPreview.preview($input, $ $input.attr "data-preview-selector" )
