if Book.count.zero?
  50.times do
    Book.create!(
      title: FFaker::Book.title,
      description: FFaker::Book.description,
      category_id: rand(1..Category.count)
    )
  end
end
