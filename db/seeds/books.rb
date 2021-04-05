if Book.count.zero? && Rails.env.production?
  Book.create!(
    title: 'Mobile Applications Development',
    description: 'The book covers the concepts of Python programming language along with mobile application development. Starting from fundamentals, the book continues with the explanation of mobile app development using Kivy framework. All the chapters offer questions and exercises for to better understanding of the subject. At the end of the book some hands-on projects are given to help the readers to improve their programming and project development skills.',
    category_id: rand(1..Category.count),
    price: rand(1.0..1000.0).floor(2),
    height: rand(7.0..40.0).floor(2),
    width: rand(1.0..20.0).floor(2),
    depth: rand(1.0..7.0).floor(2),
    published_at: '2020-12-16',
    materials: 'optio',
    authors: [Author.all.sample, Author.all.sample]
  )

  Book.create!(
    title: 'Unity 2020 Mobile Game Development',
    description: 'A practical guide on how to use Unity for building cross-platform mobile games and Augmented Reality apps using the latest Unity 2020 toolset Key Features Create, deploy, and monetize captivating and immersive games on Android and iOS platforms Take your games into the real world by adding augmented reality features to your mobile projects Kick-start your mobile game development journey with step-by-step instructions and a demo game project Book Description Unity 2020 brings a lot of new features that can be harnessed for building powerful games for popular mobile platforms.',
    category_id: rand(1..Category.count),
    price: rand(1.0..1000.0).floor(2),
    height: rand(7.0..40.0).floor(2),
    width: rand(1.0..20.0).floor(2),
    depth: rand(1.0..7.0).floor(2),
    published_at: '2020-08-21',
    materials: 'suscipit',
    authors: [Author.all.sample, Author.all.sample]
  )

  Book.create!(
    title: 'The Life Guide to Digital Photography',
    description: "Photography has been the business and the passion of LIFE since the original weekly magazine's inception in 1936, and it continues to be the business and passion of LIFE Books and LIFE.com in the new millennium. But photography has surely changed during these many decades. The rigs and gear of old have given way-first slowly, then all at once-to sleek miracle machines that process pixels and have made the darkroom obsolete.",
    category_id: rand(1..Category.count),
    price: rand(1.0..1000.0).floor(2),
    height: rand(7.0..40.0).floor(2),
    width: rand(1.0..20.0).floor(2),
    depth: rand(1.0..7.0).floor(2),
    published_at: '2017-09-24',
    materials: 'optio',
    authors: [Author.all.sample, Author.all.sample]
  )

  Book.create!(
    title: 'Rare and Astonishing Photographs',
    description: 'An exquisite photo collection showcasing awe-inducing moments from around the world, including the aurora borealis, cities made of neon lights, a great wildebeest migration, a contortionist on display.',
    category_id: rand(1..Category.count),
    price: rand(1.0..1000.0).floor(2),
    height: rand(7.0..40.0).floor(2),
    width: rand(1.0..20.0).floor(2),
    depth: rand(1.0..7.0).floor(2),
    published_at: '2018-06-04',
    materials: 'optio',
    authors: [Author.all.sample, Author.all.sample]
  )

  Book.create!(
    title: 'Self-Regulated Design Learning: A Foundation and Framework for Teaching and Learning Design',
    description: 'The book weaves together concepts of constructivism, social cognitive theory, and self-regulated learning into a solid theoretical foundation for innovative teaching that emphasizes meaning, memory, problem solving, and mastery.',
    category_id: rand(1..Category.count),
    price: rand(1.0..1000.0).floor(2),
    height: rand(7.0..40.0).floor(2),
    width: rand(1.0..20.0).floor(2),
    depth: rand(1.0..7.0).floor(2),
    published_at: '2021-03-14',
    materials: 'optio',
    authors: [Author.all.sample, Author.all.sample]
  )

  Book.create!(
    title: 'Responsive Web Design',
    description: 'Create websites that make a difference. In this book, you’ll learn how to design responsive websites: sites that adapt to all screen sizes and look great on any device. With CSS3 and its new design features, which work similarly to image editing programs, you can transform, rotate, scale, apply filters, edit masks and animate graphics and texts on your web pages without programming in JavaScript or Flash.',
    category_id: rand(1..Category.count),
    price: rand(1.0..1000.0).floor(2),
    height: rand(7.0..40.0).floor(2),
    width: rand(1.0..20.0).floor(2),
    depth: rand(1.0..7.0).floor(2),
    published_at: '2017-11-20',
    materials: 'optio',
    authors: [Author.all.sample, Author.all.sample]
  )

  Book.create!(
    title: 'Agile Web Development with Rails 6',
    description: "Learn Rails the way the Rails core team recommends it, along with the tens of thousands of developers who have used this broad, far-reaching tutorial and reference. If you're new to Rails, you'll get step-by-step guidance. If you're an experienced developer, get the comprehensive, insider information you need for the latest version of Ruby on Rails. The new edition of this award-winning classic is completely updated for Rails 6 and Ruby 2.6, with information on system testing, Webpack, and advanced JavaScript.",
    category_id: rand(1..Category.count),
    price: rand(1.0..1000.0).floor(2),
    height: rand(7.0..40.0).floor(2),
    width: rand(1.0..20.0).floor(2),
    depth: rand(1.0..7.0).floor(2),
    published_at: '2020-02-25',
    materials: 'optio',
    authors: [Author.all.sample, Author.all.sample]
  )
else
  if Book.count.zero? && Rails.env.development?
    authors = Author.all
    50.times do
      Book.create!(
        title: FFaker::Book.title,
        description: FFaker::Book.description,
        category_id: rand(1..Category.count),
        price: rand(1.0..1000.0).floor(2),
        height: rand(7.0..40.0).floor(2),
        width: rand(1.0..20.0).floor(2),
        depth: rand(1.0..7.0).floor(2),
        published_at: FFaker::Time.date,
        materials: FFaker::Lorem.word,
        authors: [authors.sample, authors.sample]
      )
    end
  end
end
