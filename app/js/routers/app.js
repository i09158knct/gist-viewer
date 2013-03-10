(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'underscore', 'backbone', 'models/gist', 'views/gist'], function($, _, Backbone, Gist, GistView) {
    var AppRouter;
    return AppRouter = (function(_super) {

      __extends(AppRouter, _super);

      function AppRouter() {
        AppRouter.__super__.constructor.apply(this, arguments);
        console.log('init router');
      }

      AppRouter.prototype.routes = {
        '(index)': 'index',
        'new': 'new',
        ':id': 'show'
      };

      AppRouter.prototype.index = function() {
        return console.log('index');
      };

      AppRouter.prototype["new"] = function() {
        return console.log('new');
      };

      AppRouter.prototype.show = function(id) {
        $('#app-message').text('Loading...');
        return Gist.createAsync(id, function(gist) {
          var view;
          view = new GistView({
            model: gist
          });
          $('#app-hook').html(view.render().el);
          return $('#app-message').text('');
        });
      };

      return AppRouter;

    })(Backbone.Router);
  });

}).call(this);
