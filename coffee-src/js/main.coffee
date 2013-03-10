require.config
  paths:
    'text': 'lib/text'
    'jquery': 'lib/jquery'
    'underscore': 'lib/lodash'
    'backbone': 'lib/backbone'
  shim:
    'jquery':
      exports: 'jQuery'
    'underscore':
      exports: '_'
    'backbone':
      exports: 'Backbone'
      deps: ['jquery', 'underscore']
    'lib/bootstrap.min':
      deps: ['jquery']
require [
  'jquery'
  'routers/app'
  'models/gist'
  'views/gist'
  'views/navbar'
  'lib/bootstrap.min'
], ($, AppRouter, Gist, GistView, NavbarView) ->
  router = new AppRouter pushState: true
  Backbone.history.start()
  navbar = new NavbarView

  window.Gist = Gist
  window.GistView = GistView
  window.NavbarView = NavbarView
  window.router = router
  window.navbar = navbar
  
