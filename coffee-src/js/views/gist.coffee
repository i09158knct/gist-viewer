define [
  'jquery'
  'underscore'
  'backbone'
  'text!templates/gist.html'
], ($, _, Backbone, template) ->
  class GistView extends Backbone.View
    constructor: (options) ->
      super

    tagName: 'div'
    template: _.template template

    render: () ->
      @$el.html @template @model.toJSON()
      @
