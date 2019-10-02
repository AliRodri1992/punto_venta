class Company < ApplicationRecord
  has_one_attached :logo

  validates :name, presence: true

  def thumbnail
    return self.logo.variant(resize: "300x300")
  end
end
