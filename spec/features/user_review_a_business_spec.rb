require "spec_helper"

feature "User review a business" do
  scenario "User can review a business" do
    alice = Fabricate(:user)
    business = Fabricate(:business)
    review_1 = Fabricate(:review, business: business, user: alice)
 

    sign_in(alice)
    visit "businesses"
    visit business_path(business)

    fill_in "Write Review", with: review_1.description
    click_button "Submit"
    expect(page).to have_content(review_1.description)
  end
end
