Task.destroy_all
 
50.times do |index|
  Task.create!(
      title: Faker::Lorem.sentence,
      is_complete: [true, false].sample,
      priority: (0..9).to_a.sample,
      category: ['DS', 'Math', 'Code'].sample,
      due: Faker::Date.forward(90)
      )
end
