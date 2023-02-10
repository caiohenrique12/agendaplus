# frozen_string_literal: true

class Contact < ApplicationRecord
  MIN_VALID_AGE = 18.years
  MAX_VALID_AGE = 100.years

  validates :cpf, :email, presence: true, uniqueness: true
  validates :full_name, :birthday, presence: true
  validate :birthday_is_valid?

  def birthday_is_valid?
    return if (age >= MIN_VALID_AGE) && (age <= MAX_VALID_AGE)

    errors.add(:birthday, 'Error! The contact must have between 18 and 100 years old age.')
  end

  private

  def age
    ((Date.current - birthday) / 365.25).to_i.years
  end
end
