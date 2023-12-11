//
//  LibraryManager.swift
//  ImagineThis
//
//  Created by Aleksey Kabishau on 12/7/23.
//

import Foundation

struct WordKey: Hashable {
	let type: WordType
	let category: WordCategory
}


class LibraryManager {
	
	private var wordLibrary: [WordKey: [Word]] = [:]
	
	init(words: [Word] = Word.words) {
		for word in words {
			for category in word.categories {
				for type in word.types {
					let key = WordKey(type: type, category: category)
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
	
	
	func words(for topic: Topic, complexity: Complexity) -> [WordType: [Word]] {
		var wordSet: [WordType: [Word]] = [:]
		for wordType in complexity.sentenceStructure {
			let words = topic.categories.compactMap { wordLibrary[WordKey(type: wordType, category: $0)]}.flatMap { $0 }
			wordSet[wordType] = words
		}
		return wordSet
	}
}
