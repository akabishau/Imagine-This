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
			if showCardsView {
				CardsScreenView(userSelections: userSelections) {
					withAnimation {
						showCardsView = false
					}
				}
			} else {
				VStack {
					HStack(spacing: 10) {
						ForEach(DifficultyLevel.allCases, id: \.self) { level in
							LevelButton(level: level, selectedLevel: $userSelections.level)
						}
					}
					Spacer()
					CategoryView(selectedCategory: $userSelections.category)
					Spacer()
					Button("Start") {
						withAnimation {
							showCardsView = true
						}
					}
				}
			}
		}
		.transition(.asymmetric(insertion: .opacity, removal: .opacity))
	}
}

// TODO: - Move to the separate file when complete
struct CategoryView: View {
	
	@Binding var selectedCategory: Category
	
	var body: some View {
		VStack {
			Image("\(selectedCategory.rawValue)Label")
				.resizable()
				.scaledToFit()
				.frame(width: 150)
			
			TabView(selection: $selectedCategory) {
				ForEach(Category.allCases, id: \.self) { category in
					Image(category.imageName)
						.resizable()
						.scaledToFit()
						.tag(category)
				}
			}
			.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
			.frame(width: 300, height: 400)
			.background(Color.blue)
			
			CategoryIndicatorView(numberOfPages: Category.allCases.count, currentPageIndex: selectedCategory.index)
			
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

#Preview {
	CategoryIndicatorView(numberOfPages: 4, currentPageIndex: 2)
}
