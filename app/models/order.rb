class Order < ActiveRecord::Base
  belongs_to :user # fk user_id
end
