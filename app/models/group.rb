class Group < ActiveRecord::Base
  attr_accessible :name, :description

  has_many :talk_submitions, :as => :submition_receiver
  has_many :talks, :through => :talk_submitions

  def found
    save
    self
  end

  def submit_talk(talk)
    submition = self.talk_submitions.build
    submition.talk = talk
    submition.save
  end
end