class Feed < ActiveRecord::Base

belongs_to :user


enum status: [:for_all, :only_me, :friends]  
end
