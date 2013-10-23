var app;

app = angular.module("Todo", ["ngResource"]);

this.TodoCtrl = function($scope, $resource) {
  var Todo;
  Todo = $resource("/todos/:id", {id: "@id"}, { update: {method: "PUT"}, destroy: {method: "DELETE"}});
  $scope.todos = Todo.query();

  $scope.remaining = function() {
    remaining = $scope.todos.length;
     angular.forEach($scope.todos, function(todo) {
	      if (todo.done) {
	        remaining--;
	      }
	    });
    return remaining;
  };

  $scope.completed = function() {
    completed = $scope.todos.length;
     angular.forEach($scope.todos, function(todo) {
	      if (!todo.done) {
	        completed--;
	      }
	    });
    return completed;
  };

  $scope.clearCompleted = function() {
    angular.forEach($scope.todos, function(todo) {
	    if (todo.done) {
	      todo.$destroy();
	    }
	  });
    $scope.todos = Todo.query();
  };
  
  $scope.addTodo = function() {
	  console.log($scope.todos);
	  var new_todo = Todo.save({content: $scope.newTodo, done: false, order: $scope.todos.length});
	  $scope.todos.push(new_todo);
	  $scope.newTodo = "";
	};

	$scope.toggleTodo = function() {
	  this.todo.$update();
	};

	$scope.destroyTodo = function() {
	  this.todo.$destroy();
	  $scope.todos = Todo.query();
	};

	$scope.sortMethod = 'order';

  $scope.enableEditor = function() {
        this.editorEnabled = true;
    };

  $scope.disableEditor = function() {
        $scope.todos = Todo.query();
        this.editorEnabled = false;
    };

  $scope.save = function() {
    if (this.todo.content === "") {
        return false;
    }

    this.todo.$update();
    this.disableEditor();
    $scope.todos = Todo.query();
  };

  $scope.filterTrue = function() {
    $scope.filterCondition = true;
  };

  $scope.filterAll = function() {
    $scope.filterCondition = false || true;
  };

  $scope.filterFalse = function() {
    $scope.filterCondition = false;
  };
};

