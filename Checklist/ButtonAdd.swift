//
//  ButtonAdd.swift
//  Checklist
//
//  Created by Максим Французов on 20.10.2021.
//

import SwiftUI

struct ButtonAdd: View {
    @Binding var screenItemTextField: Bool
    let myBlue = Color(#colorLiteral(red: 0.2169678464, green: 0.6299954805, blue: 0.9168193021, alpha: 1))
    var body: some View {
        Button(action: {
            screenItemTextField.toggle()
        }) {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: 60, height: 60)
        .foregroundColor(myBlue)
    }
}

struct ButtonAdd_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAdd(screenItemTextField: .constant(false))
    }
}
