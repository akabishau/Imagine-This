//
//  SelectionScreenView.swift
//  ImagineThis
//
//  Created by Aleksey Kabishau on 11/27/23.
//

import SwiftUI

struct HomeScreenView: View {
	
	@State private var selectedLevel: DifficultyLevel = .easy
	
	var onStart: () -> Void
	
	var body: some View {
		VStack {
			Spacer()
			HStack(spacing: 10) {
				ForEach(DifficultyLevel.allCases, id: \.self) { level in
					LevelButton(level: level, selectedLevel: $selectedLevel)
				}
			}
			Spacer()
			Button(action: onStart) {
				Text("Start")
			}
		}
	}
}

#Preview {
	HomeScreenView {
		print("start button clicked")
	}
}
