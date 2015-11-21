require 'spec_helper'

describe User do
  it { should have_many(:reviews) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_uniqueness_of(:email) }

  describe "#recent_reviews" do
    it "return all the reviews if there are less than 6" do 
      alice = Fabricate(:user)
      review_1 = Fabricate(:review, user: alice)
      review_2 = Fabricate(:review, user: alice)
      expect(alice.recent_reviews.count).to eq(2)
    end

    it "return 6 reviews if there are more than 6e reviews" do
      alice = Fabricate(:user)
      7.times { Fabricate(:review, user: alice) }
      expect(alice.recent_reviews.count).to eq(6)
    end

    it "return the most recent 6 reviews" do
      alice = Fabricate(:user)
      6.times { Fabricate(:review, user: alice) }
      review_yesterday = Fabricate(:review, user:alice, created_at: 1.day.ago)
      expect(alice.recent_reviews).not_to include(review_yesterday)
    end
    it "return an empty array if the business does not have an videos" do
      alice = Fabricate(:user)
      expect(alice.recent_reviews).to eq([])
    end
  end
end 
