Talkfolio::Application.routes.draw do

  controller :talks do
    get "my_talks",   :action => :my_talks, :as => :my_talks
    get "talks/new",  :action => :new,      :as => :new_talk
    post "talks",     :action => :create,   :as => :talks
  end

  root :to => 'talks#my_talks'
end
