require 'rails_helper'

RSpec.describe CellsController, type: :controller do
  let(:game) { create(:game_random)}
  describe "GET #toggle" do
    it "returns http success" do
      get :toggle, params: {id: game.cells.first.id }
      expect(response).to have_http_status(:success)
    end
  end

end
