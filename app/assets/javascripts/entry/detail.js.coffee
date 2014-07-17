class Detail extends App.Entry.Format

$ ->
    entity = new Vue
        el: ".entry-detail-wrapper"
        ready: () ->
            @$data = new Detail App.Entry.Detail
        data:
            title: ""
            content: ""
            updatedAt: ""
