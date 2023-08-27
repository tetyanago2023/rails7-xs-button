require 'rails_helper'

RSpec.describe "tweets/new", type: :view do
  before(:each) do
    assign(:tweet, Tweet.new(
      body: "MyText",
      user: nil
    ))
  end

  it "renders new tweet form" do
    render

    assert_select "form[action=?][method=?]", tweets_path, "post" do

      assert_select "textarea[name=?]", "tweet[body]"

      assert_select "input[name=?]", "tweet[user_id]"
    end
  end
end
