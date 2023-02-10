# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    full_name { 'Peter Parker' }
    cpf { '255.255.255-22' }
    email { 'spider.man@marvel.com' }
    birthday { 20.years.ago }
  end
end
