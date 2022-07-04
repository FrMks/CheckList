//
//  CalendarScreen.swift
//  Checklist
//
//  Created by Максим Французов on 10.11.2021.
//

import SwiftUI

struct CalendarScreen: View {
    @ObservedObject var viewModel: ChecklistViewModel
    @Binding var newWord: String
    @Binding var selectedDate: Date
    @Binding var screenItemTextField: Bool
    @Binding var calendarScreen: Bool
    @Binding var filterIsSelected: Bool
    
    private var dateProxy:Binding<Date> {
        Binding<Date>(get: {viewModel.filterDate ?? Date()}, set: {
            viewModel.filterDate = $0
            //print(viewModel.filterDate)
            })
        }
    
    var body: some View {
        VStack {
            DatePicker("", selection: dateProxy, in: Date()...).datePickerStyle(.graphical)
            Spacer()
//            List {
//                ForEach(viewModel.getFilterTasks(), id: \.self.id) { task in
//                    TaskListItem(viewModel: self.viewModel, task: task)
//                }
//            }
//            if screenItemTextField {
//                TextFieldButtonAddSecondScreen(viewModel: viewModel, newWord: $newWord, screenItemTextField: $screenItemTextField, selectedDate: $selectedDate)
//            }
//            HStack {
//                Spacer()
//                ButtonAdd(screenItemTextField: $screenItemTextField).offset(x: -15)
//            }
            //
            CalendarButtonAcceptAndCancel(calendarScreen: $calendarScreen, filterIsSelected: $filterIsSelected)
        }
    }
}

//struct TextFieldButtonAddSecondScreen: View {
//    var viewModel: ChecklistViewModel
//    @Binding var newWord: String
//    @Binding var screenItemTextField: Bool
//    @Binding var selectedDate: Date
//    let myBlue = Color(#colorLiteral(red: 0.2169678464, green: 0.6299954805, blue: 0.9168193021, alpha: 1))
//    var body: some View {
//        HStack {
//            TextField("Enter your task", text: $newWord)
//
//            Button(action: {
//                if newWord != "" {
//                    viewModel.addTask(taskName: newWord, dateUserTask: self.selectedDate)
//                    screenItemTextField.toggle()
//                    newWord = ""
//                }
//            }) {
//                Image(systemName: "chevron.right.circle.fill")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//            }
//            .frame(width: 40, height: 40)
//            .offset(x: -10)
//            .foregroundColor(myBlue)
//        }
//    }
//}

struct CalendarScreen_Previews: PreviewProvider {
    static var previews: some View {
        CalendarScreen(viewModel: ChecklistViewModel(userTasks: [Task(title: "hello"), Task(title: "by"), Task(title: "Pizza")]), newWord: .constant(""), selectedDate: .constant(Date()), screenItemTextField: .constant(true), calendarScreen: .constant(false), filterIsSelected: .constant(false))
    }
}
