//
//  CardsScreenView.swift
//  ImagineThis
//
//  Created by Aleksey Kabishau on 11/27/23.
//

import SwiftUI

import SwiftUI

struct CardsScreenView: View {
	@State private var rotations: [Double] = [3, -3, 0]
	@State private var sentences = ["A brave unicorn is teaching a group of kittens the art of flying.",
					 "An adventurous penguin is discovering hidden treasures in a mystical forest.",
					 "A wise owl is solving ancient riddles with a band of friendly ghosts."]
	
	@ObservedObject var userSelections: UserSelections
	@State private var dragOffset = CGSize.zero
	
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
				
				ZStack {
					ForEach(Array(sentences.enumerated()), id: \.element) { index, sentence in
						CardView(sentence: sentence)
							.rotationEffect(.degrees(rotations[index]))
							.offset(sentence == sentences.last ? dragOffset : CGSize.zero)
							.gesture(
								DragGesture()
									.onChanged({ gesture in
										dragOffset = gesture.translation
									})
									.onEnded({ _ in
										withAnimation {
											moveTopCardToEnd()
										}
									})
							)
					}
				}
				
				Spacer()
			}
			.padding()
		}
		.edgesIgnoringSafeArea(.bottom)
	}
	
	private func moveTopCardToEnd() {
		dragOffset = .zero
		if let lastSentence = sentences.last, let rotation = rotations.last {
			rotations.removeLast()
			sentences.removeLast()
			rotations.insert(rotation, at: 0)
			sentences.insert(lastSentence, at: 0)
		}
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

struct CardView: View {
	let sentence: String
	
	var body: some View {
		ZStack {
			Image("card")
				.resizable()
				.scaledToFit()
				.shadow(radius: 3)
			Text(sentence)
				.multilineTextAlignment(.center)
				.padding()
		}
		.frame(width: 300, height: 200)
	}
}

// Preview
struct CardsScreenView_Previews: PreviewProvider {
	static var previews: some View {
		CardsScreenView(userSelections: UserSelections(), onBack: {
			print("back button tapped")
		})
	}
}

