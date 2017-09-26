require 'rails_helper'

RSpec.describe Cell, type: :model do
  let(:game) { create(:game) }

  describe '::next_round_alive' do
    context 'staying alive' do
      let(:cell) { game.cells.where(x: 2, y: 1).first }

      it 'should be alive' do
        expect(cell.alive).to be true
      end

      it 'should stay alive' do
        expect(cell.next_round_alive).to be true
      end
    end

    context 'dying because of over population' do
      let(:cell) { game.cells.where(x: 1, y: 1).first }

      it 'should be alive' do
        expect(cell.alive).to be true
      end

      it 'should die next round' do
        expect(cell.next_round_alive).to be false
      end
    end

    context 'birth of new cell' do
      let(:cell) { game.cells.where(x: 2, y: 2).first }

      it 'should be dead' do
        expect(cell.alive).to be false
      end

      it 'should be born next round' do
        expect(cell.next_round_alive).to be true
      end
    end

    context 'stays dead' do
      let(:cell) { game.cells.where(x: 3, y: 1).first }

      it 'should be dead' do
        expect(cell.alive).to be false
      end

      it 'should be dead next round' do
        expect(cell.next_round_alive).to be false
      end
    end
  end
end
