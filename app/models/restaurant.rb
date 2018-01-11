class Restaurant < ApplicationRecord
  # Direct associations

  belongs_to :neighborhood,
             :required => false,
             :counter_cache => true

  has_many   :bookmarks,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
