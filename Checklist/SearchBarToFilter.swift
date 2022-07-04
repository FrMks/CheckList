//
//  SearchBarToFilter.swift
//  Checklist
//
//  Created by Максим Французов on 24.11.2021.
//

import SwiftUI

struct SearchBarToFilter: View {
    @State var searchTask = ""
    var body: some View {
        NavigationView {
            Text("Searching for \(searchTask)")
                .searchable(text: $searchTask)
        }
        
    }
}

struct SearchBarToFilter_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarToFilter()
    }
}
