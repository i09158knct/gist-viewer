define [
  'jquery'
  'underscore'
  'backbone'
], ($, _, Backbone) ->

  class Gist extends Backbone.Model
    constructor: () ->
      super

      attrs =
        id: @attributes.id
        html_url: @attributes.html_url
        description: @attributes.description
        files: @attributes.files
        user: @attributes.user

      if attrs.user?
        Gist.normalize attrs
      else
        attrs.user = @defaults.user

      @attributes = attrs

    @normalize: (attrs) ->
      {id, user:{login}} = attrs
      attrs.html_url = "https://gist.github.com/#{login}/#{id}"

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
        login: 'Unknown User'

    @createAsync: (id, cb) ->
      url = "https://api.github.com/gists/#{id}?callback=?"
      $.getJSON url, (res) ->
        remaining = res.meta["X-RateLimit-Remaining"]
        console.log "Remaining Rate: #{remaining}"
        if remaining == 0 then alert '0!!!!'
        gist = new Gist res.data
        cb? gist, arguments...
