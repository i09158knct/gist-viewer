(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'underscore', 'backbone', 'text!templates/gist.html'], function($, _, Backbone, template) {
    var GistView;
    return GistView = (function(_super) {

      __extends(GistView, _super);

      function GistView(options) {
        GistView.__super__.constructor.apply(this, arguments);
      }

      GistView.prototype.tagName = 'div';

      GistView.prototype.template = _.template(template);

      GistView.prototype.render = function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      };

      return GistView;

    })(Backbone.View);
  });

}).call(this);
