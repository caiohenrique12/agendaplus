# frozen_string_literal: true

FactoryBot.define do
  factory :phone do
    number { '(85) 9 9999-9999' }
    whatsapp { false }
    contact { create(:contact) }
  end
end
