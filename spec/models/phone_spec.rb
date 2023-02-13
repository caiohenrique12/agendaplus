# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Phone, type: :model do
  subject { build(:phone) }
  it { should validate_uniqueness_of(:number).ignoring_case_sensitivity }
  it { should validate_presence_of(:number) }
end
