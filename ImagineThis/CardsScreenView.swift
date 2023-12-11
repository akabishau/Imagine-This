//
//  CardsScreenView.swift
//  ImagineThis
//
//  Created by Aleksey Kabishau on 11/27/23.
//

import SwiftUI

struct CardsScreenView: View {
	
	@State private var rotations: [Double] = [3, -3, 0]
	@State private var sentences: [String] = []
	
	@ObservedObject var userSelections: UserSelections
	@State private var dragOffset = CGSize.zero
	
	
	// optimize it
	private let promptManager = PromptManager()
	let wordSet: [WordType: [Word]]
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
		.onAppear {
			generateSentences()
		}
	}
	
	private func moveTopCardToEnd() {
		dragOffset = .zero
		if let lastSentence = sentences.last, let rotation = rotations.last {
			print(lastSentence)
			rotations.removeLast()
			sentences.removeLast()
			rotations.insert(rotation, at: 0)
			sentences.insert(lastSentence, at: 0)
		}
		
		
		// temp fix for now - otherwise card disappears before moving to the bottom of the deck because sentences is a state object
		// to consider having a cards array as State and only update the sentence on the card after moving to the bottom of the deck
		
		let sentence = promptManager.generateSentence(from: wordSet, complexity: userSelections.complexity)
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
			withAnimation {
				sentences[0] = sentence
			}
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
			Image(userSelections.topic.label)
				.resizable()
				.scaledToFit()
				.frame(width: 100)
			Image("divider")
			Image(userSelections.complexity.label)
				.resizable()
				.scaledToFit()
				.frame(width: 100)
		}
	}
	
	private func generateSentences() {
		sentences = (0..<3).map({ _ in
			promptManager.generateSentence(from: wordSet, complexity: userSelections.complexity)
		})
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
		CardsScreenView(userSelections: UserSelections(), wordSet: [:], onBack: {
			print("back button tapped")
		})
	}
}

