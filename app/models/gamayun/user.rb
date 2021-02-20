module Gamayun
  class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    before_save :set_role!

    def set_role!
      if self.class.count > 0
        self.role = 'end_user'
      else
        self.role = 'admin'
      end
    end
  end
end
