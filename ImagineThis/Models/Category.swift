//
//  Category.swift
//  ImagineThis
//
//  Created by Aleksey Kabishau on 11/28/23.
//

import Foundation

enum Category: String, CaseIterable {
	case urban
	case magic
	case horror
	case random
	
	var index: Int {
		Category.allCases.firstIndex(of: self) ?? 0
	}
	
	var imageName: String {
		self.rawValue.lowercased()
	}
}
