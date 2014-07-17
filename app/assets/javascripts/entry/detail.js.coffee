class Detail extends App.Entry.Format
    _validate: () ->
        @title      = @detailLink.format App.Config.url, @id, @title
        @content    = markdown.toHTML App.Util.escapeHtml @content
        @updatedAt  = new Date( @entry.entry["updated_at"] ).format "YYYY/MM/DD hh:mm"

$ ->
    entity = new Vue
        el: ".entry-detail-wrapper"
        ready: () ->
            @$data = new Detail App.Entry.Detail
        data:
            title: ""
            content: ""
            updatedAt: null

    console.log entity.$data
