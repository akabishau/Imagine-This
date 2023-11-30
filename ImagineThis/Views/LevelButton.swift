//
//  LevelButton.swift
//  ImagineThis
//
//  Created by Aleksey Kabishau on 11/28/23.
//

import SwiftUI

struct LevelButton: View {
	
	let level: Level
	@Binding var selectedLevel: Level
	
	
	var body: some View {
		Button(action: {
			print("level button tapped")
			self.selectedLevel = level
		}) {
			Image(level == selectedLevel ? level.selectedImageName : level.imageName)
				.resizable()
				.scaledToFit()
				.frame(width: 100, height: 50)
				.padding(10)
		}
	}
}


#Preview {
	LevelButton(level: .normal, selectedLevel: .constant(.easy))
}
