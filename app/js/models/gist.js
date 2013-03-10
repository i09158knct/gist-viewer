(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    __slice = [].slice;

  define(['jquery', 'underscore', 'backbone'], function($, _, Backbone) {
    var Gist;
    return Gist = (function(_super) {

      __extends(Gist, _super);

      function Gist(gistData) {
        Gist.__super__.constructor.apply(this, arguments);
        if ((this.get('user')) != null) {
          this.normalize(this);
        } else {
          this.set('user', this.defaults.user);
        }
      }

      Gist.prototype.normalize = function(model) {
        var id, name, user;
        user = model.get('user');
        name = user.login;
        id = model.get('id');
        return model.set('html_url', "https://gist.github.com/" + name + "/" + id);
      };

      Gist.prototype.defaults = {
        id: 'No Content',
        html_url: '',
        description: 'Gist Not found',
        files: {
          'file not found': {
            filename: 'file not found',
            type: 'none',
            language: 'none',
            raw_url: '',
            content: ''
          }
        },
        user: {
          login: 'Unknown User'
        }
      };

      Gist.createAsync = function(id, cb) {
        var url;
        url = "https://api.github.com/gists/" + id + "?callback=?";
        return $.getJSON(url, function(res) {
          var gist, remaining;
          remaining = res.meta["X-RateLimit-Remaining"];
          console.log("Remaining Rate: " + remaining);
          if (remaining === 0) {
            alert('0!!!!');
          }
          gist = new Gist(res.data);
          return typeof cb === "function" ? cb.apply(null, [gist].concat(__slice.call(arguments))) : void 0;
        });
      };

      return Gist;

    })(Backbone.Model);
  });

}).call(this);
