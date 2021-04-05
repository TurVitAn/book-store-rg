if Author.count.zero? && Rails.env.production?
  Author.create!(first_name: 'Alida', last_name: 'Davis')
  Author.create!(first_name: 'Cherryl', last_name: 'Kuhn')
  Author.create!(first_name: 'Dennis', last_name: 'Dennis')
  Author.create!(first_name: 'Enriqueta', last_name: 'Barrows')
  Author.create!(first_name: 'Fleta', last_name: 'Russel')
  Author.create!(first_name: 'Gricelda', last_name: 'Hermann')
  Author.create!(first_name: 'Karon', last_name: 'Nader')
else
  if Author.count.zero? && Rails.env.development?
    7.times do
      Author.create!(
        first_name: FFaker::Name.first_name,
        last_name: FFaker::Name.last_name
      )
    end
  end
end
