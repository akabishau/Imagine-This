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
		ZStack(alignment: .bottom) {
			Image("grass")
				.resizable()
				.scaledToFit()
			VStack {
				HStack {
					backButton()
					Spacer()
				}
				Spacer()
				
				Text("Level: \(String(userSelections.level.imageName))")
				Text("Category: \(userSelections.category.rawValue)")
				
				Spacer()
			}
			.padding()
		}
		.edgesIgnoringSafeArea(.bottom)
	}
	
	@ViewBuilder
	private func backButton() -> some View {
		Button(action: onBack) {
			Image("back")
				.resizable()
				.scaledToFit()
		}
		.frame(width: 150)
	}
}

#Preview {
	CardsScreenView(userSelections: UserSelections()) {
		print("back button tapped")
	}
}
