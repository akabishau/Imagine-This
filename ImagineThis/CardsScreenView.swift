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
				// TODO: - redo hardcoded numbers
				selectionsView()
					.padding(.top, 150)
					.padding(.bottom, 24)
				Rectangle()
					.frame(width: 300, height: 180)
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
	
	
	@ViewBuilder
	private func selectionsView() -> some View {
		HStack {
			
			Image(userSelections.category.label)
				.resizable()
				.scaledToFit()
				.frame(width: 100)
			Image("divider")
			Image(userSelections.level.label)
				.resizable()
				.scaledToFit()
				.frame(width: 100)
			
		}
	}
}

#Preview {
	CardsScreenView(userSelections: UserSelections()) {
		print("back button tapped")
	}
}
