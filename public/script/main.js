// Generated by CoffeeScript 1.3.1
(function() {
  var Accordion, WebService;

  $(function() {
    var accordion, ws;
    ws = new WebService;
    return accordion = new Accordion({
      listIdentifier: "input[name='list-id']",
      listContainer: ".list-options",
      elements: "div.module",
      switcher: ".switcher",
      activeClass: "active",
      ws: ws
    });
  });

  Accordion = (function() {

    Accordion.name = 'Accordion';

    function Accordion(settings) {
      var module, _i, _len, _ref;
      this.settings = settings;
      _ref = $(this.settings.elements);
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        module = _ref[_i];
        this.bindModules(module);
      }
      this.listId = $(this.settings.listIdentifier).val();
    }

    Accordion.prototype.bindModules = function(module) {
      var _this = this;
      return $(module).find(this.settings.switcher).bind('click', function(event) {
        return _this.moduleClicked(event);
      });
    };

    Accordion.prototype.moduleClicked = function(event) {
      var switcher;
      console.log($(event.target).data('state'));
      switcher = $(event.target);
      if (switcher.data('state') === 'on') {
        this.hideModule(switcher);
        return this.settings.ws.updateModule(this.listId, switcher.data('module-id'), switcher.data('state'));
      } else {
        this.showModule(switcher);
        return this.settings.ws.updateModule(this.listId, switcher.data('module-id'), switcher.data('state'));
      }
    };

    Accordion.prototype.hideModule = function(switcher) {
      switcher.parent().next(this.settings.listContainer).removeClass(this.settings.activeClass);
      switcher.data('state', 'off');
      switcher.removeClass('on');
      switcher.addClass('off');
      return switcher.html('OFF');
    };

    Accordion.prototype.showModule = function(switcher) {
      switcher.parent().next(this.settings.listContainer).addClass(this.settings.activeClass);
      switcher.data('state', 'on');
      switcher.removeClass('off');
      switcher.addClass('on');
      return switcher.html('ON');
    };

    return Accordion;

  })();

  WebService = (function() {

    WebService.name = 'WebService';

    function WebService() {}

    WebService.prototype.sendRequest = function(data) {
      return $.ajax(data);
    };

    WebService.prototype.updateModule = function(listId, moduleId, state) {
      return this.sendRequest({
        url: '/module',
        data: {
          listId: listId,
          moduleId: moduleId,
          state: state
        },
        type: 'POST'
      });
    };

    return WebService;

  })();

}).call(this);
