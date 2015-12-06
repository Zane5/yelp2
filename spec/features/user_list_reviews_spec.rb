require "spec_helper"

feature "user list reviews" do
  scenario "user can see text reviews" do
    alice = Fabricate(:user)
    bob = Fabricate(:user)
    business = Fabricate(:business)
    review_1 = Fabricate(:review, business: business, user: alice)
    review_2 = Fabricate(:review, business: business, user: bob)

    sign_in(alice)
    expect(page).to have_content(review_1.description)
    expect(page).to have_content(review_2.description)
  end  
end
