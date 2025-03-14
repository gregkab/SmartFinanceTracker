//
//  AddExpenseView.swift
//  SmartFinanceTracker
//
//  Created by Greg Kabakian on 3/14/25.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var expenseManager = ExpenseManager()
    @State private var name = ""
    @State private var amount = ""

    var body: some View {
        VStack {
            TextField("Expense Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Amount", text: $amount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()

            Button("Add Expense") {
                if let amountDouble = Double(amount) {
                    expenseManager.addExpense(name: name, amount: amountDouble)
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()

            Spacer()
        }
        .navigationTitle("Add Expense")
    }
}
