Fabricator(:user) do
  email { Faker::Intrernet.email }
  password 'password'
  username { Faker:Name.name }
end
