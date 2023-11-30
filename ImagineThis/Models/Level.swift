//
//  DifficultyLevel.swift
//  ImagineThis
//
//  Created by Aleksey Kabishau on 11/28/23.
//

import Foundation

enum Level: String, CaseIterable {
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
}
