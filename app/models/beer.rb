class Beer < ApplicationRecord
  include RatingAverage

  validates :name, presence: true
  validates :style, presence: true

  belongs_to :brewery
  has_many :ratings, dependent: :destroy
  has_many :raters, through: :ratings, source: :user

  def to_s
    "#{name} by #{brewery.name}"
  end
end
