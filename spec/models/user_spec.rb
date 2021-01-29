# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  let(:user) { build(:user) }

  it { expect(user).to respond_to(:tasks) }
end
