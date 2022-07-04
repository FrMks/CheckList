//
//  ContentView.swift
//  Checklist
//
//  Created by Максим Французов on 19.10.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ChecklistViewModel
    @State var rootWord = ""
    @State var newWord = ""
    @State var screenItemTextField = false
    @State var calendarScreen = false
    @State var filterIsSelected = false
    @State var selectedDate = Date()
    var body: some View {
        if calendarScreen == false {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                ScreenWhereYouCanAddYourTasks(viewModel: viewModel, rootWord: $rootWord, newWord: $newWord, screenItemTextField: $screenItemTextField, calendarScreen: $calendarScreen, filterIsSelected: $filterIsSelected, selectedDate: $selectedDate)
            }
        } else {
            CalendarScreen(viewModel: viewModel, newWord: $newWord, selectedDate: $selectedDate, screenItemTextField: $screenItemTextField,calendarScreen: $calendarScreen, filterIsSelected: $filterIsSelected)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ChecklistViewModel())
    }
}
