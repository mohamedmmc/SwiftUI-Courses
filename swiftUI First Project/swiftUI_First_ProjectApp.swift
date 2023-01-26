//
//  swiftUI_First_ProjectApp.swift
//  swiftUI First Project
//
//  Created by Mohamed Melek Chtourou on 21/1/2023.
//

import SwiftUI

@main
struct swiftUI_First_ProjectApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            Start()
                .environmentObject(modelData)
        }
    }
}
