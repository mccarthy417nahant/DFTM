class Recipe < ApplicationRecord
  belongs_to :user

  has_many :ingredients,
    inverse_of: :recipe,
    dependent: :destroy
  has_many :directions, inverse_of: :recipe, dependent: :destroy

  accepts_nested_attributes_for :ingredients,
                                reject_if: proc { |attributes| attributes['name'].blank? },
                                allow_destroy: true

  # has_many :ingredient_measures
  # accepts_nested_attributes_for :ingredient_measures,
  #                               reject_if: proc { |attributes| attributes['ingredient_name'].blank? },
  #                               allow_destroy: true
  accepts_nested_attributes_for :directions,
                                reject_if: proc { |attributes| attributes['step'].blank? },
                                allow_destroy: true

  validates :title, :description, :image, presence: true

  has_attached_file :image, styles: { :medium => "400x400" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
