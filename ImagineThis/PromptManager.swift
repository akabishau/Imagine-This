//
//  PromptManager.swift
//  ImagineThis
//
//  Created by Aleksey Kabishau on 12/6/23.
//

import Foundation

// Define the WordKey struct
struct WordKey: Hashable {
	let type: WordType
	let category: WordCategory
}


class PromptManager {

	var wordLibrary: [WordKey: [Word]] = [:]
	
	init(words: [Word] = Word.words) {
		for word in words {
			for category in word.categories {
				for type in word.types {
					let key = WordKey(type: type, category: category)
					// Append the word to the correct list in the dictionary.
					if var wordList = wordLibrary[key] {
						wordList.append(word)
						wordLibrary[key] = wordList
					} else {
						wordLibrary[key] = [word]
					}
				}
			}
		}
	}
	
	let sentenceStructures: [Complexity: [WordType]] = [
		.easy: [.subject, .verb, .directObject],
		//	.normal: [.adjective, .subject, .verb, .indirectObject, .directObject],
		.normal: [.adjective, .subject, .verb, .directObject, .preposition, .indirectObject],
		.hard: [.adjective, .subject, .adverb, .verb, .adjective, .directObject, .preposition, .indirectObject]
	]
	
	
	func generatePrompt(for topic: Topic, complexity: Complexity) -> String {
		guard let structure = sentenceStructures[complexity] else { return "Structure not found." }
		
		var sentenceComponents: [String] = []
		let categories = topic.categories
		
		for wordType in structure {
			let words = categories
				.compactMap { wordLibrary[WordKey(type: wordType, category: $0)] }
				.flatMap { $0 }
			
			if let word = words.randomElement() {
				sentenceComponents.append(word.value)
			}
		}
		
		return sentenceComponents.joined(separator: " ") + "."
	}
	
	func generateEasySentence(for topic: Topic) -> String {
		return "Not Implemented"
	}
	
}
