User.create!({username: "gamemaster", email: "game@master.com", password: "norman"})

User.first.decks << Deck.create!({name: "World Capitals", subject: "Name the capital of the country", personal: false})

first_deck = Card.create!([
	{question: "France", answer: "Paris", deck_id: 1},
	{question: "Russia", answer: "Moscow", deck_id: 1},
	{question: "Canada", answer: "Ottawa", deck_id: 1},
	{question: "Djibouti", answer: "Djibouti", deck_id: 1},
	{question: "Thailand", answer: "Bangkok", deck_id: 1},
	{question: "Japan", answer: "Toyko", deck_id: 1},
	{question: "Argentina", answer: "Buenos Aires", deck_id: 1},
	{question: "Australia", answer: "Canberra", deck_id: 1},
	{question: "Timor-Leste", answer: "Dili", deck_id: 1},
	{question: "Democratic Republic of Congo", answer: "Kinshasa", deck_id: 1},
])

User.first.decks << Deck.create!(name: "World Leaders", subject: "Identify the first name of the world leader", personal: false)

second_deck = Card.create!([
	{question: "Obama", answer: "Barack", deck_id: 2},
	{question: "Putin", answer: "Vladimir", deck_id: 2}
])

User.first.decks << Deck.create!(name: "Landmark Metal Albums", subject: "Name the band that released the album", personal: false)

third_deck = Card.create!([
	{question: "Paranoid", answer: "Black Sabbath", deck_id: 3},
	{question: "Number of the Beast", answer: "Iron Maiden", deck_id: 3},
	{question: "Ride the Lightning", answer: "Metallica", deck_id: 3},
	{question: "British Steel", answer: "Judas Priest", deck_id: 3},
	{question: "Blackwater Park", answer: "Opeth", deck_id: 3},
	{question: "Appetite for Destruction", answer: "Guns N' Roses", deck_id: 3},
	{question: "Toxicity", answer: "System of a Down", deck_id: 3},
	{question: "Evil Empire", answer: "Rage Against the Machine", deck_id: 3}
])

User.first.decks << Deck.create!(name: "Who Can it Be?", subject: "Answer as would any normal person...", personal: false)

fourth_deck = Card.create!([
  {question: "This character discouraged showering alone", answer: "Norman Bates", deck_id: 4},
  {question: "This character lived where everybody knows your name", answer: "Norm Peterson", deck_id: 4},
  {question: "This Canadian funnyman admits he isn't well liked", answer: "Norm MacDonald", deck_id: 4},
  {question: "This American senior is generally considered a hero", answer: "Norman Schwarzkopf, Jr", deck_id: 4},
  {question: "This author was married 6 times, but never to Marilyn Monroe", answer: "Norman Mailer", deck_id: 4},
  {question: "This artifact confidently sets the standard", answer: "Normal Distribution", deck_id: 4},
  {question: "This artist covered Americana", answer: "Norman Rockwell", deck_id: 4},
])