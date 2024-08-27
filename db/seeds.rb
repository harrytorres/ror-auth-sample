# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'faker'

root_sections = []
root_subjects = []

10.times do
 root_sections << Section.create!(
    title: Faker::Book.title,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    public_uid: SecureRandom.uuid,
    state: ['draft', 'published', 'archived'].sample,
    ancestry: nil
  )
end

5.times do 
  Section.create!(
    title: Faker::Book.title,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    public_uid: SecureRandom.uuid,
    state: ['draft', 'published', 'archived'].sample,
    ancestry: root_sections.sample.id
  )
end

10.times do
 root_subjects << Subject.create!(
    title: Faker::Book.title,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    public_uid: SecureRandom.uuid,
    state: ['draft', 'published', 'archived'].sample,
    ancestry: nil
  )
end

5.times do 
  Subject.create!(
    title: Faker::Book.title,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    public_uid: SecureRandom.uuid,
    state: ['draft', 'published', 'archived'].sample,
    ancestry: root_subjects.sample.id
  )
end