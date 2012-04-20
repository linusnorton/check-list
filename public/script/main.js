// Generated by CoffeeScript 1.3.1
(function() {
  var List, WebService;

  $(function() {
    var list, ws;
    ws = new WebService;
    return list = new List({
      listIdentifier: "input[name='list-id']",
      listContainer: ".list-options",
      elements: "div.module",
      switcher: ".switcher",
      checker: ".checkbox",
      activeClass: "active",
      checkedClass: "checked",
      ws: ws
    });
  });

  WebService = (function() {

    WebService.name = 'WebService';

    function WebService() {}

    WebService.prototype.sendRequest = function(data) {
      return $.ajax(data);
    };

    WebService.prototype.updateModule = function(listId, moduleId, state, successCallback) {
      return this.sendRequest({
        url: '/module',
        data: {
          listId: listId,
          moduleId: moduleId,
          state: state
        },
        type: 'POST',
        success: successCallback
      });
    };

    WebService.prototype.updateItem = function(listId, itemId, state, successCallback) {
      return this.sendRequest({
        url: '/item',
        data: {
          listId: listId,
          itemId: itemId,
          state: state
        },
        type: 'POST',
        success: successCallback
      });
    };

    return WebService;

  })();

  List = (function() {

    List.name = 'List';

    function List(settings) {
      var module, _i, _len, _ref;
      this.settings = settings;
      _ref = $(this.settings.elements);
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        module = _ref[_i];
        this.bindModule(module);
      }
      this.listId = $(this.settings.listIdentifier).val();
    }

    List.prototype.bindModule = function(module) {
      var item, _i, _len, _ref, _results,
        _this = this;
      $(module).find(this.settings.switcher).bind('click', function(event) {
        return _this.moduleClicked(event);
      });
      _ref = $(module).next(this.settings.listContainer).find('li');
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        item = _ref[_i];
        _results.push(this.bindItems(item));
      }
      return _results;
    };

    List.prototype.bindItems = function(item) {
      var _this = this;
      return $(item).find(this.settings.checker).bind('click', function(event) {
        return _this.itemClicked(event, $(item).data('item-id'));
      });
    };

    List.prototype.moduleClicked = function(event) {
      var switcher;
      console.log($(event.target).data('state'));
      switcher = $(event.target);
      if (switcher.data('state') === 'on') {
        this.hideModule(switcher);
      } else {
        this.showModule(switcher);
      }
      return this.settings.ws.updateModule(this.listId, switcher.data('module-id'), switcher.data('state'));
    };

    List.prototype.hideModule = function(switcher) {
      switcher.parent().next(this.settings.listContainer).removeClass(this.settings.activeClass);
      switcher.data('state', 'off');
      switcher.removeClass('on');
      switcher.addClass('off');
      return switcher.html('OFF');
    };

    List.prototype.showModule = function(switcher) {
      switcher.parent().next(this.settings.listContainer).addClass(this.settings.activeClass);
      switcher.data('state', 'on');
      switcher.removeClass('off');
      switcher.addClass('on');
      return switcher.html('ON');
    };

    List.prototype.itemClicked = function(event, itemId) {
      var checker, state;
      checker = $(event.target);
      state = checker.data('state');
      console.log(itemId);
      if (state === true) {
        this.uncheckItem(checker);
      } else if (state === false) {
        this.checkItem(checker);
      } else {
        console.log('na');
      }
      return this.settings.ws.updateItem(this.listId, itemId, checker.data('state'));
    };

    List.prototype.uncheckItem = function(checker) {
      checker.removeClass(this.settings.checkedClass);
      checker.data('state', false);
      return checker.html('Not Checked');
    };

    List.prototype.checkItem = function(checker) {
      checker.addClass(this.settings.checkedClass);
      checker.data('state', true);
      return checker.html('Checked');
    };

    return List;

  })();

}).call(this);
