class Group < ActiveRecord::Base
  attr_accessible :name, :description

  has_many :talk_submitions, :as => :receiver
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

  def pending_talks
    talk_submitions.collect do |submition| 
      submition.talk unless submition.accepted?
    end.compact
  end

  def accepted_talks
    talk_submitions.collect do |submition| 
      submition.talk if submition.accepted?
    end.compact
  end

  def accept_talk(talk)
    talk.talk_submition_of(self).accept
  end
end