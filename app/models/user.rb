# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :trackable,
         :recoverable, :rememberable, :validatable

  has_many :surveys
  has_many :survey_user_answers

  validates :phone, :email, :first_name, :last_name, presence: :true
end
