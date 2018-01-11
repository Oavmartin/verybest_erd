class CuisineCategory < ApplicationRecord
  # Direct associations

  has_many   :dishes,
             :foreign_key => "cuisine_id",
             :dependent => :nullify

  # Indirect associations

  # Validations

end
