# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

kitty = Cat.create([
    {birth_date: '2019/07/24', name: "Carl", color: "Brown", sex:"M", description: "Blah blah blah description"},
    {birth_date: '2019/01/29', name: "T'Challa", color: "Black", sex:"M", description: "Fights bad guys and stuff"},
    {birth_date: '1996/08/01', name: "Cersei", color: "Blonde", sex:"F", description: "Blows stuff up"}
])