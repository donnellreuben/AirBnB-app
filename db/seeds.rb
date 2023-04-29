user_pictures = []

6.times do
  user_pictures << URI.parse(Faker::Avatar.image(size: "300x300")).open
end

me = User.create(email: "chris@typefast.co", password: "password")
me.profile.update(first_name: "Donnell", last_name: "Reuben")
me.profile.picture.attach(io: user_pictures[0], filename: "#{me.full_name}.jpg")


5.times do |i|
  user = User.create(email: Faker::Internet.email, password: "password")
  user.profile.update(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  user.profile.picture.attach(io: user_pictures[i + 1], filename: "#{user.full_name}.jpg")
end

10.times do |i|
  property = Property.create!(
    user: me,
    name: Faker::Hipster.word,
    headline: Faker::Hipster.sentence,
    description: Faker::Hipster.paragraphs(number: 30).join(" "),
    address_1: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country_code: "US",
    price: Money.from_amount((25..100).to_a.sample)
  )

  property.images.attach(io: File.open(Rails.root.join("db", "sample", "images", "property_#{i + 1}.png")), filename: property.name)

  (1..5).to_a.sample.times do
    Review.create(reviewable: property, rating: (1..5).to_a.sample, title: Faker::Hipster.word, body: Faker::Hipster.paragraph, user: User.all.sample)
  end
end
