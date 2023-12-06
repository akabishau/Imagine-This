//
//  Category.swift
//  ImagineThis
//
//  Created by Aleksey Kabishau on 11/28/23.
//

import Foundation

enum Topic: String, Hashable, CaseIterable {
	case urban
	case magic
	case horror
	case random
	
	var index: Int {
		Topic.allCases.firstIndex(of: self) ?? 0
	}
	
	var imageName: String {
		self.rawValue.lowercased()
	}
	
	var label: String {
		"\(self.rawValue)Label"
	}
	
	
	var categories: [WordCategory] {
		switch self {
			case .random:
				return WordCategory.allCases
			default:
				if let category = WordCategory(rawValue: self.rawValue) {
					return [category, .general]
				} else {
					return [.general]
				}
		}
	}
}
