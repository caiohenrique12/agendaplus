# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    full_name { 'Peter Parker' }
    cpf { '25525525522' }
    email { 'spider.man@marvel.com' }
    birthday { 20.years.ago.to_date }
  end
end
