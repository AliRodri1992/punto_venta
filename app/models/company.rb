class Company < ApplicationRecord
  has_one_attached :logo

  validates :name, presence: true
  validates :name, length: { minimum: 3 }, allow_blank: true
  validates :website, presence: true
  validates :website, length: { minimum: 3 }, allow_blank: true

  validates_format_of :name, with: /^([a-z A-ZñáéíóúÑÁÉÍÓÚ[0-9]\s]+)$/, multiline: true, allow_blank: true

  def thumbnail
    return self.logo.variant(resize: "300x300")
  end
end
