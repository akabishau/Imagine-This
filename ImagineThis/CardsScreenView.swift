//
//  CardsScreenView.swift
//  ImagineThis
//
//  Created by Aleksey Kabishau on 11/27/23.
//

import SwiftUI

struct CardsScreenView: View {
	
	@ObservedObject var userSelections: UserSelections
	
	var onBack: () -> Void
	
	var body: some View {
		VStack {
			Button(action: onBack) {
				Text("Back")
			}
			Spacer()
			Text("Level: \(String(userSelections.level.imageName))")
			Text("Category: \(userSelections.category.rawValue)")
			Spacer()
			
		}
	}
}

#Preview {
	CardsScreenView(userSelections: UserSelections()) {
		print("back button tapped")
	}
}
