Talkfolio::Application.routes.draw do

  controller :talks do
    get "my_talks",   :action => :my_talks, :as => :my_talks
    get "talks/new",  :action => :new,      :as => :new_talk
    post "talks",     :action => :create,   :as => :talks
  end

  controller :groups do
    get   "group/:id",  :action => :show,       :as => :group    
    get   "my_groups",  :action => :my_groups,  :as => :my_groups
    get   "groups/new", :action => :new,        :as => :new_group
    post  "groups",     :action => :create,     :as => :groups
  end

  root :to => 'talks#my_talks'
end
