if Author.count.zero?
  7.times do
    Author.create!(
      first_name: FFaker::NameUA.first_name,
      last_name: FFaker::NameUA.last_name
    )
  end
end
