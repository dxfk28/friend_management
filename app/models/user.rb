class User < ActiveRecord::Base
  validates_format_of :email, :message => "Incorrect mailbox format!", :with => /\w+[@]{1}\w+[.]\w+/
  validates_uniqueness_of :email, :message => "email has present"
end
