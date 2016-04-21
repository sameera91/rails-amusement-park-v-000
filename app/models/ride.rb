class Ride < ActiveRecord::Base
  attr_accessor :user
  belongs_to :user
  belongs_to :attraction

  def take_ride

    user = User.find_by(self.user_id)

    if (user.height < attraction.min_height) and (user.tickets < attraction.tickets)
      "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      user.tickets = user.tickets - attraction.tickets
      user.nausea = user.nausea + attraction.nausea_rating
      user.happiness = user.happiness + attraction.happiness_rating
      user.save
      user
    end
  end

  def message
    "Thanks for riding the #{self.attraction.name}!"
  end

end
