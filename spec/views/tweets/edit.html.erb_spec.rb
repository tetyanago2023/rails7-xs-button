require 'rails_helper'

RSpec.describe "tweets/edit", type: :view do
  let(:tweet) {
    Tweet.create!(
      body: "MyText",
      user: nil
    )
  }

  before(:each) do
    assign(:tweet, tweet)
  end

  it "renders the edit tweet form" do
    render

    assert_select "form[action=?][method=?]", tweet_path(tweet), "post" do

      assert_select "textarea[name=?]", "tweet[body]"

      assert_select "input[name=?]", "tweet[user_id]"
    end
  end
end
