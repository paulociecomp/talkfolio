class Group < ActiveRecord::Base
  attr_accessible :name, :description

  belongs_to :founder, :class_name => "User"

  has_many :talk_submitions, :as => :receiver
  has_many :talks,           :through => :talk_submitions

  has_many :members

  def self.found_by(founder, params = {})
    founder.groups.create(params)
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
    talk_submitions.find_by_talk_id(talk.id).accept
  end

  def request_membership_for(user)
    member = members.build
    member.user = user
    member.save
    member
  end
end