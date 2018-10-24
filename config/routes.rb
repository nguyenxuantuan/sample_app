Rails.application.routes.draw do
  get "rails_flavored_ruby/home"
  get "rails_flavored_ruby/help"
  root "rails_flavored_ruby#home"
end
