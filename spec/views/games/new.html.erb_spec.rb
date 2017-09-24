require 'rails_helper'

RSpec.describe "games/new", type: :view do
  before(:each) do
    assign(:game, Game.new(
      :height => 1,
      :width => 1,
      :name => "MyString"
    ))
  end

  it "renders new game form" do
    render

    assert_select "form[action=?][method=?]", games_path, "post" do

      assert_select "input#game_height[name=?]", "game[height]"

      assert_select "input#game_width[name=?]", "game[width]"

      assert_select "input#game_name[name=?]", "game[name]"
    end
  end
end
