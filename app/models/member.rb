class Member < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  scope :accepted, where(:accepted => true)
  scope :pending, where(:accepted => false)

  delegate :email, :name, :to => :user

  def pending?
    !accepted?
  end

  def accept!
    self.accepted = true
    save
  end
end