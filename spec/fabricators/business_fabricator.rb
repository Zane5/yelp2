Fabricator(:business) do
  name  Faker::Name.name
  description  Faker::Lorem.paragraphs(2).join(" ")
  picture_url "/images/pizza-166-236.png"
  category_id "1"
end
