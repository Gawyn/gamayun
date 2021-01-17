Gamayun::Engine.routes.draw do
  devise_for :users, class_name: "Gamayun::User"

  namespace :admin do
    Gamayun::Engine.app_config['manageable_models'].each do |model_attrs|
      resource model_attrs['model'].pluralize.to_sym
    end
  end
end
