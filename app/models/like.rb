class Like < ApplicationRecord
  belongs_to :fan, class_name: "User"
  belongs_to :photo, counter_cache: true
end
