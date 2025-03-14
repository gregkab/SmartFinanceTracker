//
//  ExpenseManager.swift
//  SmartFinanceTracker
//
//  Created by Greg Kabakian on 3/14/25.
//

import FirebaseFirestore
import FirebaseAuth

class ExpenseManager: ObservableObject {
    @Published var expenses: [Expense] = []
    private let db = Firestore.firestore()

    init() {
        fetchExpenses()
    }

    func fetchExpenses() {
        guard let userId = Auth.auth().currentUser?.uid else { return }

        db.collection("expenses")
            .whereField("userId", isEqualTo: userId)
            .order(by: "date", descending: true)
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error fetching expenses: \(error)")
                    return
                }
                self.expenses = snapshot?.documents.compactMap { document in
                    try? document.data(as: Expense.self)
                } ?? []
            }
    }

    func addExpense(name: String, amount: Double) {
        guard let userId = Auth.auth().currentUser?.uid else { return }

        let newExpense = Expense(name: name, amount: amount, date: Date())
        do {
            _ = try db.collection("expenses").addDocument(from: newExpense)
        } catch {
            print("Error adding expense: \(error)")
        }
    }

    func deleteExpense(id: String) {
        db.collection("expenses").document(id).delete { error in
            if let error = error {
                print("Error deleting expense: \(error)")
            }
        }
    }
}
