# require 'rails_helper'
#
# RSpec.describe Tweet, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

# spec/models/tweet_spec.rb
require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'callbacks' do
    it 'triggers the broadcast_tweet after create' do
      tweet = create(:tweet) # Assuming you have a factory named "tweet"

      expect(tweet).to have_received(:broadcast_tweet)
    end
  end

  describe 'private methods' do
    describe '#broadcast_tweet' do
      it 'broadcasts the tweet using ActionCable' do
        tweet = create(:tweet)

        expect(ActionCable.server).to have_received(:broadcast)
                                        .with('tweets_channel', tweet.rendered_tweet)
      end
    end

    describe '#rendered_tweet' do
      it 'renders the tweet partial' do
        tweet = create(:tweet)
        rendered_tweet = tweet.send(:rendered_tweet)

        expect(ApplicationController.renderer).to have_received(:render)
                                                    .with(partial: 'tweets/tweet', locals: { tweet: tweet })
      end
    end
  end
end
