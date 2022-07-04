//
//  ButtonsFromBellow.swift
//  Checklist
//
//  Created by Максим Французов on 19.10.2021.
//

import SwiftUI

struct ButtonsFromBellow: View {
    @State var changeBlueColorToMyGray = false
    @Binding var calendarScreen: Bool
    @Binding var screenItemTextField: Bool
    @Binding var filterIsSelected: Bool
    var body: some View {
        
        //let myGray = Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        let myBlue = Color(#colorLiteral(red: 0.2169678464, green: 0.6299954805, blue: 0.9168193021, alpha: 1))
        
        VStack {
            HStack(alignment: .center) {
//                Button(action: {
//                    if changeBlueColorToMyGray == true {
//                        changeBlueColorToMyGray.toggle()
//                    }
//                    if calendarScreen == true {
//                        calendarScreen.toggle()
//                    }
//                }) {
//                    Image(systemName: "checkmark.circle.fill")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//
//                }
//                .frame(width: 60, height: 60)
//                .foregroundColor(changeBlueColorToMyGray ? myGray : myBlue)
//                .offset(x: 30)
//                Button(action: {
//                    filterIsSelected = false
//                }) {
//                    Text("Cancel Filter").foregroundColor(.white).font(.system(size: 20))
//                }.frame(width: 120, height: 60).background(myBlue).cornerRadius(30).offset(x: 30)
                
                
                    
                
                
                Spacer()
                
                ButtonAdd(screenItemTextField: $screenItemTextField).offset(x: -30)
                
//                Button(action: {
//                    if changeBlueColorToMyGray == false {
//                        changeBlueColorToMyGray.toggle()
//                    }
//                    if calendarScreen == false {
//                        calendarScreen.toggle()
//                    }
//                }) {
//                    Image(systemName: "calendar.circle.fill")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//
//                }
//                .frame(width: 60, height: 60)
//                .foregroundColor(changeBlueColorToMyGray ? myBlue : myGray)
//                .offset(x: -30)
            }
        }
    }
}

struct ButtonsFromBellow_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsFromBellow(calendarScreen: .constant(false), screenItemTextField: .constant(false), filterIsSelected: .constant(false))
    }
}
