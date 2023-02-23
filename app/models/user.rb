# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  has_many :items
  has_many :electronics
  has_many :clothes
  has_many :footwears
  has_many :groceries
  has_many :books
  has_many :beauties
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :assign_default_role

  validate :must_have_a_role, on: :update

  private

  def must_have_a_role
    return if roles.any?

    errors.add(:roles, 'Must Have At Least 1 Role')
  end

  def assign_default_role
    add_role(:newuser) if roles.blank?
  end
end
