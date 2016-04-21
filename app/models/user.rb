class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, :through => :rides

  def mood
    if self.nausea.to_i > self.happiness.to_i
      "sad"
    else
      "happy"
    end
  end
end
