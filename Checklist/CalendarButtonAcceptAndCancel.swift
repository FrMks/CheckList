//
//  CalendarButtonAcceptAndCancel.swift
//  Checklist
//
//  Created by Максим Французов on 20.11.2021.
//

import SwiftUI

struct CalendarButtonAcceptAndCancel: View {
    @Binding var calendarScreen: Bool
    @Binding var filterIsSelected: Bool
    var body: some View {
        HStack {
            Button(action: {
                calendarScreen.toggle()
                filterIsSelected = false
            }) {
                Text("Cancel").foregroundColor(.white)
            }.frame(width: 120, height: 40).background(Color.red).cornerRadius(10).offset(x: 15)
            
            Spacer()
            
            Button(action: {
                calendarScreen.toggle()
                filterIsSelected = true
            }) {
                Text("Accept").foregroundColor(.white)
            }.frame(width: 120, height: 40).background(Color.green).cornerRadius(10).offset(x: -15)
        }
    }
}

struct CalendarButtonAcceptAndCancel_Previews: PreviewProvider {
    static var previews: some View {
        CalendarButtonAcceptAndCancel(calendarScreen: .constant(false), filterIsSelected: .constant(false))
    }
}
