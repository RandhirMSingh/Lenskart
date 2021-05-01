//
//  Bundle+Extension.swift
//  Lenskart
//
//  Created by Kumar Singh, Randhir on 01/05/21.
//

import Foundation

extension Bundle {
    static func read(contentsOf fileName: String, ofType type: String) -> Data? {
        if let path = Bundle.main.path(forResource: fileName, ofType: type) {
            do {
                return try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            } catch {
                // handle error
                return nil
            }
        }
        return nil
    }
}
