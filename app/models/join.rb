class Join < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :group, required: true
end
