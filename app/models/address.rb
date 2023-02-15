# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :contact

  validates :zipcode, :street, :number, :neighborhood, :city, :state, :country, presence: true
end
