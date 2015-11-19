Fabricator(:review) do
  description { Faker::Lorem.paragraphs(2).join(" ") }
end
