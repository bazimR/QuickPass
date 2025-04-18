//
//  PasswordOptions.swift
//  QuickPass
//
//  Created by Rishal Bazim on 16/04/25.
//

import Foundation

enum PasswordOption {
    case lowerCase, upperCase, numbers, symbols, excludeDuplicates,
        includeSpace

    var title: String {
        switch self {
        case .lowerCase:
            return "LowerCase (a-z)"
        case .upperCase:
            return "UpperCase (A-Z)"
        case .numbers:
            return "Numbers (0-9)"
        case .symbols:
            return "Symbols (!-$+)"
        case .excludeDuplicates:
            return "Exclude Duplicates"
        case .includeSpace:
            return "Include spaces"
        }
    }
}
