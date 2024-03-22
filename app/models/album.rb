class Album < ApplicationRecord
  belongs_to :artist
  
  def self.only_true
    where(on_vinyl: true)
  end

  def self.alphabetical_order
    order(title: :asc)
  end

  def self.filter_by_threshold(threshold)
    where('number_of_tracks > ?', threshold)
  end
end