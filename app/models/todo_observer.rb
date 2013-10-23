class TodoObserver < ActiveRecord::Observer
	def after_create(todo)
       todo.add_log('creating')
    end

    def after_update(todo)
       todo.add_log('updating')
    end

    def after_destroy(todo)
       todo.add_log('destroing')
    end
end
