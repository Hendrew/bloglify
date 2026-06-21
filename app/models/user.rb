# frozen_string_literal: true

class User < ApplicationRecord
  has_many :articles, dependent: :destroy

  validates :name, presence: true

  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
end
