Talkfolio::Application.routes.draw do

  devise_for :users

  controller :talks do
    get "my_talks",           :action => :my_talks,     :as => :my_talks
    get "talker/:talker_id",  :action => :talker,       :as => :talker
    get "talks/new",          :action => :new,          :as => :new_talk
    post "talks",             :action => :create,       :as => :talks
  end

  controller :groups do
    get   "my_groups",                :action => :my_groups,    :as => :my_groups
    get   "groups/new",               :action => :new,          :as => :new_group
    get   "groups/:id",               :action => :show,         :as => :group
    post  "groups",                   :action => :create,       :as => :groups
 end

  controller :talk_submitions do
    get   "groups/:group_id/submit_talk",     :action => :new,    :as => :new_talk_submition
    post  "groups/:group_id/talk_submitions", :action => :create, :as => :talk_submitions
    get   "groups/:group_id/talk_submitions", :action => :edit,   :as => :edit_talk_submitions
    put   "groups/:group_id/accept_talks",    :action => :accept, :as => :accept_talks
  end

  controller :members do
    get  "groups/:group_id/memberships",        :action => :index,  :as => :group_members
    post "groups/:group_id/request_membership", :action => :create, :as => :request_group_membership
    get  "groups/:group_id/edit_members",       :action => :edit,   :as => :edit_group_members
    put  "groups/:group_id/accept_members",     :action => :accept, :as => :accept_group_members
  end

  root :to => 'site#index'
end