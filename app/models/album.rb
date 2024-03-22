class Album < ApplicationRecord
  belongs_to :artist
  
  def self.only_true
    where(on_vinyl: true)
  end

  def self.alphabetical_order
    order(title: :asc)
  end
end