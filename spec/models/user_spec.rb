require 'rails_helper'

RSpec.describe User, type: :model do
  it 'can be created' do
    user = create(:user)
    expect(user.save).to eq(true)
  end

  context 'owner?' do
    let(:user) { create(:user) }
    let(:list) { create(:list, user: user) }
    let(:list2) { create(:list) }

    it 'works when owning resource' do
      expect { user.owner?(list) }.not_to raise_error
    end

    it 'throws error when not owning resource' do
      expect { user.owner?(list2) }.to raise_error('Unauthorized')
    end
  end
end
