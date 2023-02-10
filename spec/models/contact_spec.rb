# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of(:cpf) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:birthday) }
  end

  describe '#birthday_is_valid?' do
    context 'when create contact with less than 18 years old' do
      it 'returns message error' do
        contact = build(:contact, birthday: 10.years.ago)

        contact.save

        expect(contact.errors['birthday'].first)
          .to eq('Error! The contact must have between 18 and 100 years old age.')
      end
    end
  end
end
