//
//  PromptManager.swift
//  ImagineThis
//
//  Created by Aleksey Kabishau on 12/6/23.
//

import Foundation


class PromptManager {
	
	func generateSentence(from set: [WordType: [Word]], complexity: Complexity) -> String {
		
		var sentenceComponents: [String] = []
		for component in complexity.sentenceStructure {
			if let word = set[component]?.randomElement() {
				sentenceComponents.append(word.value)
			}
		}
		
		return sentenceComponents.joined(separator: " ") + "."
	}
}
