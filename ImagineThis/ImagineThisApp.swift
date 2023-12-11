//
//  ImagineThisApp.swift
//  ImagineThis
//
//  Created by Aleksey Kabishau on 11/21/23.
//

import SwiftUI

@main
struct ImagineThisApp: App {
	
	let libraryManager = LibraryManager()
	
    var body: some Scene {
        WindowGroup {
            HomeScreenView(libraryManager: libraryManager)
        }
    }
}
