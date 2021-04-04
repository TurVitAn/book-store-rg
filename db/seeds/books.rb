if Book.count.zero?
  authors = Author.all
  50.times do
    Book.create!(
      title: FFaker::Book.title,
      description: FFaker::Book.description,
      category_id: rand(1..Category.count),
      authors: [authors.sample, authors.sample]
    )
  end
end
