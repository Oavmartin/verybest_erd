class Dish < ApplicationRecord
  # Direct associations

  belongs_to :cuisine_type,
             :class_name => "CuisineCategory",
             :foreign_key => "cuisine_id",
             :counter_cache => true

  has_many   :bookmarks,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
