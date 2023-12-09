//
//  DifficultyLevel.swift
//  ImagineThis
//
//  Created by Aleksey Kabishau on 11/28/23.
//

import Foundation

enum Complexity: String, CaseIterable {
	case easy
	case normal
	case hard
	
	
	var imageName: String {
		self.rawValue
	}
	
	var selectedImageName: String {
		"\(self.rawValue)Selected"
	}
	
	var label: String {
		"\(self.rawValue)Label"
	}
	
	
	var sentenceStructure: [WordType] {
		switch self {
			case .easy: [.subject, .verb, .directObject]
			case .normal:  [.adjective, .subject, .verb, .indirectObject, .directObject]
			case .hard: [.adjective, .subject, .adverb, .verb, .adjective, .directObject, .preposition, .indirectObject]
		}
	}
}
