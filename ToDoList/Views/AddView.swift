//
//  AddView.swift
//  ToDoList
//
//  Created by Sergei Poluboiarinov on 19.03.2023.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var text = ""
    @State private var alertTitle = ""
    @State private var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $text)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(10)
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }
            .padding(14)
        }
        .navigationTitle("Add an item ✍️")
        .alert(isPresented: $showAlert, content: getAlert) 
    }
    func saveButtonPressed() {
        if textIsAppropriate() {
            let newItem = ItemModel(title: text, isCompleted: false)
            modelContext.insert(newItem)
            dismiss()
        }
    }
    func textIsAppropriate() -> Bool {
        if text.count < 3 {
            alertTitle = "Your new todo item must be at least three characters long!!! 😨😱"
            showAlert.toggle()
            return false
        } else {
            return true
        }
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView()
        }
    }
}
