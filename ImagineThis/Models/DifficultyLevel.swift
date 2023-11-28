//
//  DifficultyLevel.swift
//  ImagineThis
//
//  Created by Aleksey Kabishau on 11/28/23.
//

import Foundation

enum DifficultyLevel: CaseIterable {
	case easy
	case normal
	case hard
	
	
	var imageName: String {
		switch self {
			case .easy: "easy"
			case .normal: "normal"
			case .hard: "hard"
		}
	}
	
	var selectedImageName: String {
		"\(imageName)Selected"
	}
}
