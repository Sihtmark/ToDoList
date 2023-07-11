//
//  ListRowView.swift
//  ToDoList
//
//  Created by Sergei Poluboiarinov on 19.03.2023.
//

import SwiftUI
import SwiftData

struct ListRowView: View {

    @Environment(\.modelContext) private var modelContext
    @Bindable var item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .onTapGesture {
            item.isCompleted.toggle()
        }
    }
}


struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "non completed item", isCompleted: false)
    static var item2 = ItemModel(title: "completed item", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
