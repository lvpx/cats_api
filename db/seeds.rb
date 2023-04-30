# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
image_paths = Dir.glob('/Users/lovepreetsingh/repo/cats_api/seed_data/*')

image_paths.each do |path|
  cat = Cat.new
  cat.image.attach(io: File.open(path), filename: File.basename(path))
  cat.save!
end
