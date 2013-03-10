define [
  'jquery'
  'underscore'
  'backbone'
  'markdown-builder'
  'text!templates/gist.html'
], ($, _, Backbone, markdownBuilder, template) ->
  class GistView extends Backbone.View
    constructor: (options) ->
      super
      @mdBuilder = markdownBuilder

    tagName: 'div'
    template: _.template template

    render: () ->
      @$el.html @template @model.toJSON()
      @
