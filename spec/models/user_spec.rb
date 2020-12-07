# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'requires the email' do
      expect(build(:user, email: nil)).to_not be_valid
    end
  end
end
