(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'underscore', 'backbone'], function($, _, Backbone) {
    var GistView;
    return GistView = (function(_super) {

      __extends(GistView, _super);

      function GistView(options) {
        var id;
        GistView.__super__.constructor.apply(this, arguments);
        id = document.location.hash.match(/[a-z0-9]+/)[0];
        this.$('#gist-id').val(id);
      }

      GistView.prototype.el = '#navbar';

      GistView.prototype.events = {
        'submit #form-gist-id': 'cahangeGist'
      };

      GistView.prototype.cahangeGist = function(event) {
        var id;
        if (event != null) {
          event.preventDefault();
        }
        id = this.$('#gist-id').val();
        return document.location.hash = '#/' + id;
      };

      return GistView;

    })(Backbone.View);
  });

}).call(this);
