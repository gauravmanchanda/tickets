class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  attr_accessor :create_customer

  has_many :comments

  before_create :make_customer, if: :create_customer?

  validates :first_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  private

    def make_customer
      self.type = Customer
    end

    def create_customer?
      create_customer == "1"
    end
end
