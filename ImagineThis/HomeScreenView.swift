//
//  SelectionScreenView.swift
//  ImagineThis
//
//  Created by Aleksey Kabishau on 11/27/23.
//

import SwiftUI

struct HomeScreenView: View {
	
	@StateObject var userSelections = UserSelections()
	@State private var showCardsView = false
	
	
	var body: some View {
		ZStack {
			Image("background")
				.resizable()
				.scaledToFill()
				.ignoresSafeArea(.all)
			
			if showCardsView {
				CardsScreenView(userSelections: userSelections) {
					withAnimation {
						showCardsView = false
					}
				}
			} else {
				VStack {
					Spacer()
					HStack(spacing: 10) {
						ForEach(Complexity.allCases, id: \.self) { level in
							LevelButton(level: level, selectedLevel: $userSelections.level)
						}
					}
					Spacer()
					CategoryView(selectedCategory: $userSelections.category)
					Spacer()
					startButton()
				}
			}
		}
		.transition(.asymmetric(insertion: .opacity, removal: .opacity))
	}
	
	@ViewBuilder
	private func startButton() -> some View {
		Button {
			withAnimation {
				showCardsView = true
			}
		} label: {
			Image("start")
				.resizable()
				.scaledToFit()
				.frame(height: 80)
		}
	}
}

// TODO: - Move to the separate file when complete
struct CategoryView: View {
	
	@Binding var selectedCategory: Topic
	
	var body: some View {
		VStack {
			Image("\(selectedCategory.rawValue)Label")
				.resizable()
				.scaledToFit()
				.frame(width: 150)
			
			TabView(selection: $selectedCategory) {
				ForEach(Topic.allCases, id: \.self) { category in
					Image(category.imageName)
						.resizable()
						.scaledToFit()
						.tag(category)
				}
			}
			.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
			.frame(height: 350)

			
			CategoryIndicatorView(numberOfPages: Topic.allCases.count, currentPageIndex: selectedCategory.index)
			
		}
	}
}


struct CategoryIndicatorView: View {
	
	let numberOfPages: Int
	var currentPageIndex: Int
	
	var body: some View {
		HStack {
			ForEach(0..<numberOfPages, id: \.self) { index in
				Image(currentPageIndex == index ? "active" : "inactive")
					.resizable()
					.frame(width: 24, height: 24)
			}
		}
		.padding(.vertical)
	}
}


#Preview {
	HomeScreenView()
}
