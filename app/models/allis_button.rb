class AllisButton < ActiveRecord::Base
  belongs_to :user
  before_save :default_values
   def default_values
     self.warns = 0
   end
end
