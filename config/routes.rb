Talkfolio::Application.routes.draw do

  controller :talks do
    get "my_talks",     :action => :my_talks,     :as => :my_talks
    get "talks/new",    :action => :new,          :as => :new_talk
    post "talks",       :action => :create,       :as => :talks
  end

  controller :groups do
    get   "group/:id",  :action => :show,       :as => :group
    get   "my_groups",  :action => :my_groups,  :as => :my_groups
    get   "groups/new", :action => :new,        :as => :new_group
    post  "groups",     :action => :create,     :as => :groups
  end

  controller :talk_submitions do
    get "groups/:group_id/submit_talk", :action => :new, :as => :new_talk_submition
    post "groups/:group_id/submit_talk", :action => :create, :as => :talk_submitions
  end

  root :to => 'talks#my_talks'
end
