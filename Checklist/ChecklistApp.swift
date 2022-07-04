//
//  ChecklistApp.swift
//  Checklist
//
//  Created by Максим Французов on 19.10.2021.
//

import SwiftUI

@main
struct ChecklistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ChecklistViewModel())
        }
    }
}
