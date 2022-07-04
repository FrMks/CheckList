//
//  ScreenWhereYouCanAddYourTasks.swift
//  Checklist
//
//  Created by Максим Французов on 20.10.2021.
//

import SwiftUI



struct ScreenWhereYouCanAddYourTasks: View {
    @ObservedObject var viewModel: ChecklistViewModel
    @Binding var rootWord: String
    @Binding var newWord: String
    @Binding var screenItemTextField: Bool
    @Binding var calendarScreen: Bool
    @Binding var filterIsSelected: Bool
    @Binding var selectedDate: Date
    
    @State var changeColorButtonAddToModelView = false
    @State var searchTask = ""
    var body: some View {
        //NavigationView {
            VStack {
                ZStack {
                    VStack {
                        HStack {
                            Spacer()
                            FilterTasks(calendarScreen: $calendarScreen).offset(x: -30)
                        }
                        //NavigationView {
                            if filterIsSelected == false {
                                List {
                                    ForEach(viewModel.userTasks, id: \.self.id) { task in
                                        TaskListItem(viewModel: self.viewModel, task: task)
                                    }.onMove(perform: self.move).onDelete(perform: self.delete)
                                }
                            } else {
                                List {
                                    ForEach(viewModel.getFilterTasks(), id: \.self.id) { task in
                                        TaskListItem(viewModel: self.viewModel, task: task)
                                    }
                                }
                            }
                        //}.searchable(text: $searchTask)
                
                        
                        
                        //                    .navigationBarTitle("Tasks")
                        //                    .navigationBarItems(trailing: EditButton())
                        //                    List(viewModel.userTasks, id: \.self.id, rowContent: {
                        //                        Text($0.title)
                        //                    })
                        Spacer()
                        HStack {
                            Spacer()
                            //ButtonAdd(screenItemTextField: $screenItemTextField).offset(x: -15)
                        }
                        Spacer()
                        TextFieldButtonAddCalendar(viewModel: viewModel, newWord: $newWord, screenItemTextField: $screenItemTextField, selectedDate: $selectedDate)
                        //                    ButtonsFromBellow(calendarScreen: $calendarScreen, screenItemTextField: $screenItemTextField, filterIsSelected: $filterIsSelected)
                    }
                    .opacity(screenItemTextField ? 0.08 : 1)
                    //                if screenItemTextFiel {
                    //                    TextFieldButtonAddCalendar(viewModel: viewModel, newWord: $newWord, screenItemTextField: $screenItemTextField, selectedDate: $selectedDate)
                    //                }
                }
            }
        }
    //}
    func move(from source: IndexSet, to destination: Int) {
        print("move UI")
        viewModel.userTasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at indexSet: IndexSet) {
        print("delete UI")
        viewModel.deleteTask(indexSet: indexSet)
    }
}

struct TaskListItem: View {
    var viewModel: ChecklistViewModel
    var task: Task
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "circle")
                Text(task.title)
                Spacer()
                Text(String(task.date.getFormattedDate(format: "yyyy-MM-dd HH:mm:ss")))
            }
            ForEach(task.tags, id: \.self.id) { tag in
                Text(tag.name)
            }
        }
    }
    
}

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}


struct TextFieldButtonAddCalendar: View {
    var viewModel: ChecklistViewModel
    @Binding var newWord: String
    @Binding var screenItemTextField: Bool
    @Binding var selectedDate: Date
    
    let myBlue = Color(#colorLiteral(red: 0.2169678464, green: 0.6299954805, blue: 0.9168193021, alpha: 1))
    var body: some View {
        VStack {
                TextField("Enter your task", text: $newWord)
                    .offset(x: 20)
                
                HStack {
                    HStack {
                        Image(systemName: "calendar.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .offset(x: 10)
                            .foregroundColor(myBlue)
                        
                        DatePicker("", selection: $selectedDate, in: Date()..., displayedComponents: .date).fixedSize()
                        
                        Button(action: {
                            newWord += "#"
                        }) {
                            Image(systemName: "tag.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .offset(x: 10)
                                .foregroundColor(myBlue)
                        }
                    }
                    
//                    HStack(spacing: 30) {
//                        Button(action: {
//
//                        }) {
//                            Image(systemName: "calendar.circle.fill")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                        }
//                        .frame(width: 40, height: 40)
//                        .offset(x: 10)
//                        .foregroundColor(myBlue)
//
//                        Text(dateUserTask)
//                            .lineLimit(1)
//                            .foregroundColor(myBlue)
//                            .font(.system(size: 20))
//                    }
                
                
                
                Spacer()
                
                Button(action: {
                    if newWord != "" {
                        viewModel.addTask(taskName: newWord, dateUserTask: self.selectedDate)
                        //screenItemTextField.toggle()
                        newWord = ""
                    }
                }) {
                    Image(systemName: "chevron.right.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 40, height: 40)
                .offset(x: -10)
                .foregroundColor(myBlue)
            }
        }
    }
}


struct ScreenWhereYouCanAddYourTasks_Previews: PreviewProvider {
    static var previews: some View {
        ScreenWhereYouCanAddYourTasks(viewModel: ChecklistViewModel(userTasks: [Task(title: "hello"), Task(title: "by"), Task(title: "Pizza")]), rootWord: .constant(""), newWord: .constant(""), screenItemTextField: .constant(true), calendarScreen: .constant(false), filterIsSelected: .constant(false), selectedDate: .constant(Date()))
    }
}
