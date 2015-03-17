Rails.application.routes.draw do

  mount ProcessEngine::Engine => "/process_engine" # should protect password here

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :processes, only: [:index] do
        post :start, on: :member
      end

      resources :process_instances, only: [:show]
      resources :tasks, only: [:index]


      resources :check_lists, only: [:create] do
        member do
          post :activate
          post :make_appointment
          post :handover
        end
      end

    end

    namespace :v2 do
      resources :pe_apis do
        get :process_instance, on: :collection
        get :process_definitions, on: :collection
        post :process_instance_start, on: :collection
        get :process_tasks, on: :collection
      end
    end
  end

end
