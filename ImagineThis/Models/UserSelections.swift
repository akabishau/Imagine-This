//
//  UserSelections.swift
//  ImagineThis
//
//  Created by Aleksey Kabishau on 11/28/23.
//

import Foundation

final class UserSelections: ObservableObject {
	
	@Published var complexity: Complexity = .normal
	@Published var topic: Topic = .random
}
