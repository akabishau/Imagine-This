//
//  Word.swift
//  ImagineThis
//
//  Created by Aleksey Kabishau on 12/6/23.
//

import Foundation

// role the word can play in the sentence
enum WordType {
	case subject
	case verb
	case directObject
	case indirectObject
	case adjective
	case adverb
	case preposition
}


// need to separate words by categories and organize them by sentence topics later
enum WordCategory: String, Hashable, CaseIterable {
	case magic, urban, horror, general
}


struct Word: Hashable {
	let value: String
	let types: [WordType]
	let categories: [WordCategory]
	let gerund: String?
	let prepositions: [String]?
}


extension Word {
	static let words: [Word] = [
		// Subjects
		Word(value: "teacher", types: [.subject], categories: [.general], gerund: nil, prepositions: nil),
		Word(value: "student", types: [.subject], categories: [.general], gerund: nil, prepositions: nil),
		Word(value: "doctor", types: [.subject], categories: [.general], gerund: nil, prepositions: nil),
		
		// Verbs with gerunds
		Word(value: "run", types: [.verb], categories: [.general], gerund: "running", prepositions: nil),
		Word(value: "talk", types: [.verb], categories: [.general], gerund: "talking", prepositions: nil),
		Word(value: "read", types: [.verb], categories: [.general], gerund: "reading", prepositions: nil),
		Word(value: "kill", types: [.verb], categories: [.general], gerund: "killing", prepositions: nil),
		
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
	]
}
