Gamayun::Engine.routes.draw do
  devise_for :users, class_name: "Gamayun::User"
end
