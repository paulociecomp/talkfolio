class TalkSubmition < ActiveRecord::Base
  belongs_to :talk
  belongs_to :submit_receiver, :polymorphic => true
end