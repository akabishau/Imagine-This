//
//  ContentView.swift
//  ImagineThis
//
//  Created by Aleksey Kabishau on 11/21/23.
//

import SwiftUI

struct MainView: View {
	
	@State private var showCardsView = false
	
    var body: some View {
		ZStack {
			if showCardsView {
				CardsScreenView {
					withAnimation {
						showCardsView = false
					}
				}
			} else {
				HomeScreenView {
					withAnimation {
						showCardsView = true
					}
				}
			}
		}
		.transition(.asymmetric(insertion: .opacity, removal: .opacity))
    }
}

#Preview {
    MainView()
}
