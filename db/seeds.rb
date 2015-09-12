User.create({username: "gamemaster", email: "game@master.com", password: "norman"})

User.first.decks << Deck.create({name: "World Capitals", subject: "Name the capital of the country.", personal: false})

Card.create([
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
