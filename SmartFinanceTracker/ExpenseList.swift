//
//  ExpenseList.swift
//  SmartFinanceTracker
//
//  Created by Greg Kabakian on 3/14/25.
//

import SwiftUI

struct ExpenseListView: View {
    @StateObject var expenseManager = ExpenseManager()

    var body: some View {
        NavigationView {
            List {
                ForEach(expenseManager.expenses) { expense in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(expense.name)
                                .font(.headline)
                            Text("\(expense.date, formatter: dateFormatter)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text("$\(expense.amount.isFinite ? expense.amount : 0, specifier: "%.2f")")
                            .bold()
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        let expense = expenseManager.expenses[index]
                        if let id = expense.id {
                            expenseManager.deleteExpense(id: id)
                        }
                    }
                }
            }
            .navigationTitle("Expenses")
            .toolbar {
                NavigationLink(destination: AddExpenseView()) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

// Date Formatter
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()
