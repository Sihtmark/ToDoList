//
//  ListVeiw.swift
//  ToDoList
//
//  Created by Sergei Poluboiarinov on 19.03.2023.
//

import SwiftUI
import SwiftData

struct ListView: View {
    
    @Query var items: [ItemModel]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        ZStack {
            if items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(items) { item in
                        ListRowView(item: item)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button(role: .destructive) {
                                    modelContext.delete(item)
                                } label: {
                                    Image(systemName: "delete.left")
                                }
                            }
                    }
                }
            }
        }
        .navigationTitle("ToDo List 📝")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
    }
}

