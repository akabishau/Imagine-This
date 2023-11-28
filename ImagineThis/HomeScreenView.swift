//
//  SelectionScreenView.swift
//  ImagineThis
//
//  Created by Aleksey Kabishau on 11/27/23.
//

import SwiftUI

struct HomeScreenView: View {
	
	var onStart: () -> ()
	
	var body: some View {
		Button(action: onStart) {
			Text("Start")
		}
	}
}

#Preview {
	HomeScreenView {
		print("start button clicked")
	}
}
