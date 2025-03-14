//
//  Expense.swift
//  SmartFinanceTracker
//
//  Created by Greg Kabakian on 3/14/25.
//

import Foundation
import FirebaseFirestore

struct Expense: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var amount: Double
    var date: Date
}
