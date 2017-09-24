require 'rails_helper'

RSpec.describe "games/index", type: :view do
  before(:each) do
    assign(:games, [
      Game.create!(
        :height => 2,
        :width => 3,
        :name => "Name"
      ),
      Game.create!(
        :height => 2,
        :width => 3,
        :name => "Name"
      )
    ])
  end

  it "renders a list of games" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
