class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  # validates :user_id, presence: true
  # validates :attraction_id, presence: true

  def take_ride
    self.user.tickets -= self.attraction.tickets
    self.user.nausea += self.attraction.nausea_rating
    self.user.happiness += self.attraction.happiness_rating
    self.user.save

    if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      errors.add(:both, "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}.")
      "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.user.tickets < self.attraction.tickets
      errors.add(:tickets, "Sorry. You do not have enough tickets the #{self.attraction.name}.")
      "Sorry. You do not have enough tickets the #{self.attraction.name}."
    elsif self.user.height < self.attraction.min_height
      errors.add(:height, "Sorry. You are not tall enough to ride the #{self.attraction.name}.")
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      errors.add(:thanks, "Thanks for riding the #{self.attraction.name}!")
      "Thanks for riding the #{self.attraction.name}!"
    end
  end
end
