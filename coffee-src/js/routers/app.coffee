define [
  'jquery'
  'underscore'
  'backbone'
  'models/gist'
  'views/gist'
], ($, _, Backbone, Gist, GistView) ->
  class AppRouter extends Backbone.Router
    constructor: () ->
      super
      console.log 'init router'

    routes:
      '(index)': 'index'
      'new':   'new'
      ':id':   'show'

    index: () ->
      console.log 'index'

    new: () ->
      console.log 'new'

    show: (id) ->
      $('#app-message').text('Loading...');
      Gist.createAsync id, (gist) ->
        view = new GistView model: gist
        $('#app-hook').html view.render().el
        $('#app-message').text('');
