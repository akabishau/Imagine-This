//
//  Word.swift
//  ImagineThis
//
//  Created by Aleksey Kabishau on 12/6/23.
//

import Foundation

struct Word: Hashable {
	let value: String
	let types: [WordType]
	let categories: [WordCategory]
	let gerund: String?
	let prepositions: [String]?
}


enum WordType {
	case subject // doer
	case verb
	case directObject // represents the noun that directly receives the action of the verb.
	case indirectObject // represents the noun to or for whom the action is performed.
	case adjective // describes or modifies a noun.
	case adverb // modifies a verb, an adjective, or another adverb, indicating when, how, where, why, or to what extent the action is performed.
	case preposition // shows the relationship between its object and another word in the sentence (often used with direct or indirect objects).
}


enum WordCategory: String, Hashable, CaseIterable {
	case magic, urban, horror, general
}


extension Word {
	static let words: [Word] = [
		// Subjects
		Word(value: "teacher", types: [.subject], categories: [.general], gerund: nil, prepositions: nil),
		Word(value: "student", types: [.subject], categories: [.general], gerund: nil, prepositions: nil),
		Word(value: "doctor", types: [.subject], categories: [.general], gerund: nil, prepositions: nil),
		// ... and so on until 10 entries for subjects ...
		
		// Verbs with gerunds
		Word(value: "run", types: [.verb], categories: [.general], gerund: "running", prepositions: nil),
		Word(value: "talk", types: [.verb], categories: [.general], gerund: "talking", prepositions: nil),
		Word(value: "read", types: [.verb], categories: [.general], gerund: "reading", prepositions: nil),
		// ... and so on until 10 entries for verbs ...
		
		// Direct Objects with prepositions
		Word(value: "book", types: [.directObject], categories: [.general], gerund: nil, prepositions: ["about", "on"]),
		Word(value: "car", types: [.directObject], categories: [.general], gerund: nil, prepositions: ["in", "around"]),
		Word(value: "idea", types: [.directObject], categories: [.general], gerund: nil, prepositions: ["of", "about"]),
		Word(value: "meal", types: [.directObject], categories: [.general], gerund: nil, prepositions: ["for", "without"]),
		Word(value: "gift", types: [.directObject], categories: [.general], gerund: nil, prepositions: ["for", "from"]),
		Word(value: "message", types: [.directObject], categories: [.general], gerund: nil, prepositions: ["about", "concerning"]),
		Word(value: "joke", types: [.directObject], categories: [.general], gerund: nil, prepositions: ["about", "on"]),
		Word(value: "question", types: [.directObject], categories: [.general], gerund: nil, prepositions: ["about", "on"]),
		Word(value: "answer", types: [.directObject], categories: [.general], gerund: nil, prepositions: ["to", "for"]),
		Word(value: "picture", types: [.directObject], categories: [.general], gerund: nil, prepositions: ["of", "about"]),
		Word(value: "song", types: [.directObject], categories: [.general], gerund: nil, prepositions: ["about", "for"]),
		Word(value: "flower", types: [.directObject], categories: [.general], gerund: nil, prepositions: ["for", "with"]),
		Word(value: "dessert", types: [.directObject], categories: [.general], gerund: nil, prepositions: ["after", "with"]),
		
		
		// Indirect Objects
		Word(value: "friend", types: [.indirectObject], categories: [.general], gerund: nil, prepositions: nil),
		Word(value: "neighbor", types: [.indirectObject], categories: [.general], gerund: nil, prepositions: nil),
		Word(value: "stranger", types: [.indirectObject], categories: [.general], gerund: nil, prepositions: nil),
		// ... and so on until 10 entries for indirect objects ...
		
		// multi type objects
		Word(value: "children", types: [.indirectObject, .directObject], categories: [.general], gerund: nil, prepositions: ["to", "for"]),
		Word(value: "team", types: [.indirectObject, .directObject], categories: [.general], gerund: nil, prepositions: ["to", "against"]),
		Word(value: "player", types: [.indirectObject, .directObject], categories: [.general], gerund: nil, prepositions: ["to", "from"]),
		Word(value: "audience", types: [.indirectObject, .directObject], categories: [.general], gerund: nil, prepositions: ["to", "for"]),
		Word(value: "community", types: [.indirectObject, .directObject], categories: [.general], gerund: nil, prepositions: ["for", "within"]),
		Word(value: "artist", types: [.indirectObject, .directObject], categories: [.general], gerund: nil, prepositions: ["to", "from"]),
		Word(value: "author", types: [.indirectObject, .directObject], categories: [.general], gerund: nil, prepositions: ["to", "of"]),
		Word(value: "teacher", types: [.indirectObject, .directObject], categories: [.general], gerund: nil, prepositions: ["to", "for"]),
		Word(value: "scientist", types: [.indirectObject, .directObject], categories: [.general], gerund: nil, prepositions: ["to", "by"]),
		Word(value: "environment", types: [.indirectObject, .directObject], categories: [.general], gerund: nil, prepositions: ["for", "against"]),
		
		// Adjectives
		Word(value: "happy", types: [.adjective], categories: [.general], gerund: nil, prepositions: nil),
		Word(value: "sad", types: [.adjective], categories: [.general], gerund: nil, prepositions: nil),
		Word(value: "bright", types: [.adjective], categories: [.general], gerund: nil, prepositions: nil),
		
		// Adverbs
		Word(value: "quickly", types: [.adverb], categories: [.general], gerund: nil, prepositions: nil),
		Word(value: "slowly", types: [.adverb], categories: [.general], gerund: nil, prepositions: nil),
		Word(value: "loudly", types: [.adverb], categories: [.general], gerund: nil, prepositions: nil),
		
		// Prepositions
		Word(value: "above", types: [.preposition], categories: [.general], gerund: nil, prepositions: nil),
		Word(value: "below", types: [.preposition], categories: [.general], gerund: nil, prepositions: nil),
		Word(value: "across", types: [.preposition], categories: [.general], gerund: nil, prepositions: nil),
	]
}
