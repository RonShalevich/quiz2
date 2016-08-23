class Supporter < ApplicationRecord
  def self.search(search)
    where("title LIKE ?", "%#{search}%")
    where("body LIKE ?", "%#{search}%")
  end
end
