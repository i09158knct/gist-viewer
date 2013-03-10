define [
  'jquery'
  'underscore'
  'backbone'
], ($, _, Backbone) ->

  class Gist extends Backbone.Model
    constructor: (gistData) ->
      super

      # normalize html_url
      user = @get 'user'
      name = user.login
      id = @get 'id'
      @set 'html_url', "https://gist.github.com/#{name}/#{id}"

    defaults:
      id: 'No Content'
      html_url: ''
      description: 'Gist Not found'
      files:
        'file not found':
          filename: 'file not found'
          type: 'none'
          language: 'none'
          raw_url: ''
          content: ''
      user:
        login: 'No Content'

    @createAsync: (id, cb) ->
      url = "https://api.github.com/gists/#{id}?callback=?"
      $.getJSON url, (res) ->
        remaining = res.meta["X-RateLimit-Remaining"]
        console.log "Remaining Rate: #{remaining}"
        if remaining == 0 then alert '0!!!!'
        gist = new Gist res.data
        cb? gist, arguments...

