require 'rails_helper'

RSpec.describe Game, type: :model do
  describe '::initalize' do
    context 'valid' do
      let(:game) { build(:game_random) }

      it 'should be valid' do
        expect(game).to be_valid
      end
    end

    context 'invalid' do
      let(:game) { build(:game_invalid)}

      it 'should be invalid' do
        expect(game).to be_invalid
      end
    end
  end
end
