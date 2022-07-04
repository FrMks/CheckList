//
//  FilterTasks.swift
//  Checklist
//
//  Created by Максим Французов on 20.11.2021.
//

import SwiftUI

struct FilterTasks: View {
    let myBlue = Color(#colorLiteral(red: 0.2169678464, green: 0.6299954805, blue: 0.9168193021, alpha: 1))
    @Binding var calendarScreen: Bool
    var body: some View {
        Button(action: {
            calendarScreen.toggle()
        }) {
            Image(systemName: "line.3.horizontal.decrease.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: 45, height: 45)
        .foregroundColor(myBlue)
    }
}

struct FilterTasks_Previews: PreviewProvider {
    static var previews: some View {
        FilterTasks(calendarScreen: .constant(false))
    }
}
