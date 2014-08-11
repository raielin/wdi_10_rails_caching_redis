class Product < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  validates :name, :description, presence: true
  validates :price, numericality: { greater_than: 0 }

  def tweets
    twitter.search("#{name} -rt", result_type: 'recent', lang: 'en').take(5)
  end

  private

  def twitter
    @twitter ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
    end
  end
end
