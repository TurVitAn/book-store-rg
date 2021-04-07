if Book.count.zero?
  authors = Author.all
  50.times do
    Book.create!(
      title: FFaker::LoremUA.sentence(word_count = 1),
      description: FFaker::LoremUA.paragraph(sentence_count = 5),
      materials: FFaker::LoremUA.words(num = 3),
      category_id: rand(1..Category.count),
      price: rand(1.0..1000.0).floor(2),
      height: rand(7.0..40.0).floor(2),
      width: rand(1.0..20.0).floor(2),
      depth: rand(1.0..7.0).floor(2),
      published_at: FFaker::Time.date,
      authors: [authors.sample, authors.sample]
    )
  end
end
