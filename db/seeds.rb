# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Photo.destroy_all
# Story.destroy_all
# Building.destroy_all


Photo.destroy_all
Story.destroy_all
User.destroy_all
Building.destroy_all

Building.create([
  {name: "225 Bush St", address: "225 Bush Street, San Francisco, CA", description: "225 Bush Street, originally known as the Standard Oil Building, is a 328-foot (100 m), 25-floor office building in the financial district of San Francisco. The building includes 21 floors of office space, 1 floor of retail, 1 storage floor and 2 basement levels including the garage. It was the tallest building in the city from its completion in 1922 until 1925. (Source: https://en.wikipedia.org/wiki/225_Bush_Street)", main_photo: "225bush.jpg"},
  {name: "Contemporary Jewish Museum", address: "736 Mission Street, San Francisco, CA", description: "The Contemporary Jewish Museum (CJM) is a non-collecting museum at 736 Mission Street at Yerba Buena Lane in the South of Market (SoMa) neighborhood of San Francisco, California. The museum, which was founded in 1984, is located in the historic Jessie Street Substation, which was gutted and its interior redesigned by Daniel Libeskind, along with a new addition; the new museum opened in 2008. The museum's mission is to make the diversity of the Jewish experience relevant for a twenty-first century audience through exhibitions and educational programs. (Source: https://en.wikipedia.org/wiki/Contemporary_Jewish_Museum)", main_photo: "ctj.jpg"},
  {name: "TransAmerica Pyramid", address: "600 Montgomery Street, San Francisco, CA", description: "The Transamerica Pyramid at 600 Montgomery Street between Clay and Washington Streets in the Financial District of San Francisco, California, is a 48-story postmodern building and the second-tallest skyscraper in the San Francisco skyline. Its height will be surpassed by Salesforce Tower, currently under construction.[5] The building no longer houses the headquarters of the Transamerica Corporation, which moved its U.S. headquarters to Baltimore, Maryland, but it is still associated with the company and is depicted in the company's logo. Designed by architect William Pereira and built by Hathaway Dinwiddie Construction Company, at 853 ft (260 m), on completion in 1972 it was the eighth tallest building in the world. (Source: https://en.wikipedia.org/wiki/Transamerica_Pyramid)", main_photo: "pyramid1.jpg"},
  {name: "Sentinel Building/Columbus Tower", address: "916 Kearny Street, San Francisco, CA", description: "Columbus Tower, also known as the Sentinel Building is a mixed-use building in San Francisco, California, completed in 1907. The distinctive copper-green Flatiron style structure is bounded by Columbus Avenue, Kearny Street and Jackson Street, straddling the North Beach, Chinatown, and Financial districts of the city. Much of the building is occupied by film studio American Zoetrope, and the ground floor houses a cafe named after the company. The Sentinel Building is San Francisco Designated Landmark No. 33. (Source: https://en.wikipedia.org/wiki/Columbus_Tower_(San_Francisco))", main_photo: "flatiron.jpg"},
  {name: "The DeYoung Building/Old Chronicle Building", address: "690 Geary Street, San Francisco, CA", description: "When this sandstone and brick Richardson Romanesque building was completed in 1889, it was San Francisco's first skyscraper and the tallest building on the west coast. Designed for the San Francisco Chronicle by the Chicago firm of Burnham & Root, the building shared newspaper corner with the Hearst and Call buildings as well as Lotta's Fountain. (Source: http://noehill.com/sf/landmarks/sf243.asp)", main_photo: "old_chronicle.jpg"},
  {name: "Hunter-Dulin Building", address: "111 Sutter Street, San Francisco, CA", description: "The Hunter-Dulin Building is a 25-story, 94 m (308 ft) class A office building in the financial district of San Francisco, California. The building is listed on the National Register of Historic Places.[6] The building was totally restored and renovated between 1999 and 2001. (Source: https://en.wikipedia.org/wiki/Hunter-Dulin_Building)", main_photo: "hunter-dunlin.jpg"},
  {name: "The Pacific Bell Building", address: "140 New Montgomery Street, San Francisco, CA", description: "140 New Montgomery Street, also known as The Pacific Telephone Building, and, after 1984, as The Pacific Bell Building or The PacBell Building, in San Francisco's South of Market district, is an Art Deco office tower.", main_photo: "pacbell2.jpg"}
])

User.create([
  {name: "Cindy", email: "c@c.com", password: "expoTop"}, {name: "Nuranne", email: "n@n.com", password: "atomKat"}, {name: "Aly", email: "a@a.com", password: "beefWater"}
])
