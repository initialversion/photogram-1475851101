class Photo < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  has_many   :likes,
             :class_name => "Vote",
             :dependent => :destroy

  belongs_to :owner,
             :class_name => "User"

  # Indirect associations

  has_many   :commenters,
             :through => :comments,
             :source => :commenter

  has_many   :fans,
             :through => :likes,
             :source => :user

  # Validations

  validates :image, :presence => true

  validates :owner_id, :presence => true

end
