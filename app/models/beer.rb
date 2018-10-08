class Beer < ApplicationRecord
  include RatingAverage

  validates :name, presence: true
  validates :style, presence: true

  belongs_to :brewery
  belongs_to :style
  has_many :ratings, dependent: :destroy
  has_many :raters, through: :ratings, source: :user

  scope :best_3, -> { all.sort(& RatingAverage.compare).first 3 }

  def to_s
    "#{name} by #{brewery.name}"
  end
end
