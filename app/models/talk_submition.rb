class TalkSubmition < ActiveRecord::Base
  belongs_to :talk
  belongs_to :receiver, :polymorphic => true

  def accept
    self.accepted = true
    save
  end
end