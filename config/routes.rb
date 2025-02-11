Rails.application.routes.draw do
    # Route to list all tasks
    get '/tasks', to: 'tasks#index'
    # Create
    get    'tasks/new',      to: 'tasks#new', as: :new_task
    post   'tasks',          to: 'tasks#create'
    # Read one - The `show` route needs to be *after* `new` route.
    get    'tasks/:id',      to: 'tasks#show', as: :task

    get    'tasks/:id/edit', to: 'tasks#edit', as: :edit_task
    patch  'tasks/:id',      to: 'tasks#update', as: :update
    # Delete
    delete 'tasks/:id',      to: 'tasks#destroy'
end
