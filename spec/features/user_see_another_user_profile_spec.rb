require 'spec_helper'

feature 'User see another user profile' do
  scenario "User see another user profile page" do
    alice = Fabricate(:user)
    bob = Fabricate(:user)
    business = Fabricate(:business)
    review_1 = Fabricate(:review, business: business, user: alice)
    review_2 = Fabricate(:review, business: business, user: bob)

    sign_in(alice)
    visit user_path(bob)
    expect(page).to have_content(bob.username)
    expect(page).to have_content(bob.reviews.first.description)
  end

  scenario "User profile page shows this user's past reviews" do
    alice = Fabricate(:user)
    business = Fabricate(:business)
    review_1 = Fabricate(:review, business: business, user: alice)
    review_2 = Fabricate(:review, business: business, user: alice)

    sign_in(alice)
    visit user_path(alice)
    expect(page).to have_content(alice.reviews.first.description)
    expect(page).to have_content(alice.reviews.last.description)
  end
end
