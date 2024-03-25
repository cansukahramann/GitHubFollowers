//
//  Date+Ext.swift
//  GitHubFollowers
//
//  Created by Cansu Kahraman on 21.03.2024.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
