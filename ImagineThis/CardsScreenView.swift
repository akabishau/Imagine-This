//
//  CardsScreenView.swift
//  ImagineThis
//
//  Created by Aleksey Kabishau on 11/27/23.
//

import SwiftUI

struct CardsScreenView: View {
	
	var onBack: () -> Void
	
	var body: some View {
		Button(action: onBack) {
			Text("Back")
		}
	}
}

#Preview {
	CardsScreenView {
		print("back button tapped")
	}
}
