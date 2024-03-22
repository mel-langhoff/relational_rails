class Album < ApplicationRecord
  belongs_to :artist
  
  def self.only_true
    where(on_vinyl: true)
  end
end