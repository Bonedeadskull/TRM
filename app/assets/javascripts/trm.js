$('select').select2
    language:
        noResults: ->
             return "<a href='http://google.com'>Add</a>";

    escapeMarkup: (markup) ->
        return markup;
