beforeEach(function() {
     todo = new Todoapp.Models.Todo();
     todos = new Todoapp.Collections.Todos({model:todo});
     view = new Todoapp.Views.TodoApp({collection:todos, el:'#todoapp', model:todo});
});


describe('Testing model and collection', function() {
    it('Model can be defined', function() {
      expect(Todoapp.Models.Todo).toBeDefined();
    });

    it('Model can be instantiated', function() {
      expect(todo).not.toBeNull();
    });

    it('Model should exhibit attributes', function() {
      var task = new Todoapp.Models.Todo({
        content: 'To do TODO'
      });
      expect(task.get('content'))
        .toEqual('To do TODO');
    });

    it('Length of collection should be 1', function() {
      expect(todos.length).toEqual(1);
    });

    it('Collection can be instantiated', function() {
      expect(Todoapp.Collections.Todos).toBeDefined();
    });

    it("Collection uses the Todo model", function () {
      expect(todos.model).toEqual(Todoapp.Models.Todo);
    });

    it("url is 'todos'", function () {
      expect(todos.url).toEqual("/todos");
    });
});

describe('Testing view', function() {
  it("is not marked as completed", function() {
    console.log($(view));
    //expect($('#toggle')).not.toBeChecked()
  });

  //it(" Title is 'Todos'", function() {
    //  console.log(view);
      //expect($('h1')).text().toBe("Todos");
  //});
});


//describe("Some Examples", function() {
//  it("check next order", function() {
//    var todo = new Todoapp.Models.Todo();
//    expect(todo.nextOrder()).toBe(1)
//  });
//});