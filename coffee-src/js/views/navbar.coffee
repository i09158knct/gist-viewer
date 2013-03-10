define [
  'jquery'
  'underscore'
  'backbone'
], ($, _, Backbone) ->
  class GistView extends Backbone.View
    constructor: (options) ->
      super
      id = document.location.hash.match(/[a-z0-9]+/)[0]
      @$('#gist-id').val(id)

    el: '#navbar'
    events:
      'submit #form-gist-id': 'cahangeGist'

    cahangeGist: (event) ->
      event?.preventDefault()
      id = @$('#gist-id').val()
      document.location.hash = '#/' + id
