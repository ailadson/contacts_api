5.times do |i|
  contact = User.create!(username: "user_name_#{i}").
    contacts.create!(name: "Anthony#{i}", email: "contact#{i}@aol.com")
end

5.times do |j|
  User.find(5).contact_shares.create!(contact_id: (j + 1))
end
