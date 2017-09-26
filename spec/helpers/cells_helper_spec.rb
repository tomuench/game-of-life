require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CellsHelper. For example:
#
# describe CellsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe CellsHelper, type: :helper do
  let(:cell) { create(:game).cells.first }

  describe '::render_cell' do
    it 'should render cell correct' do
      expect(helper.render_cell(cell)).to eq "<td class=\"#{cell.alive ? 'alive' : ''}\"></td>"
    end
  end
end
