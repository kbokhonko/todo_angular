angular.module('Todo.filters', []).filter('todoFilter', [function () {     
	return function (todos, criteria) {         
		if (!angular.isUndefined(criteria)) 
    	{  
    		var tempTodos = []; 
   			angular.forEach(todos, function (todo) {   
     			if (angular.equals(todo.done, criteria)) {    
      			tempTodos.push(todo);   
       		} 
        });  
        return tempTodos;  
      } 
    else 
      {  
        return todos;  
      } 
    }; 
}])