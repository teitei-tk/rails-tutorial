do (w = window, $ = window.jQuery) ->

    class MarkdownPreview
        constructor:(args) ->
            {@$textArea, @$titleArea, @$preViewTitleArea, @$preViewArea} = args

        previewAsTittle: () ->
            @._preview @.$titleArea, @.$preViewTitleArea

        previewAsContent: () ->
            @._preview @.$textArea, @.$preViewArea

        _preview: ( $input, $preview ) ->
            text = $input.val().trim()
            console.log text
            if text.length <= 0
                $preview.hide()
                return false
            else
                $preview.show()

            $preview.html w.markdown.toHTML(text)

    $ ->
        $textArea  = $ "textarea.content"
        $titleArea = $ ".title"

        viewer = new MarkdownPreview
            $titleArea: $ ".title"
            $textArea:    $textArea
            $preViewTitleArea:  $ "#entryTitle"
            $preViewArea: $ "#preview"

        $titleArea.on "keyup", () ->
            viewer.previewAsTittle()

        $textArea.on "keyup ", () ->
            viewer.previewAsContent()
        return
    return
