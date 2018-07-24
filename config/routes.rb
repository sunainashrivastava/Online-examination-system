Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  resources :take_tests
  resources :students
  root to: "users#index"
  get 'questions' => 'take_tests#questions'
  get 'displays' => 'students#displays'
  post 'change_question' => 'students#change_question'
  get 'result' => 'students#result'
  get 'view_answers' => 'students#view_answers'
  get 'records' => 'students#records'
  get 'error' => 'students#error'
end
