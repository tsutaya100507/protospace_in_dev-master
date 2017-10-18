class Tag < ActiveRecord::Base
    has_many :prototypes, through: :prototypes_tags

end
