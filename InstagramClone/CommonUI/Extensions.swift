//
//  Extensions.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 24/04/2021.
//

import Foundation
import UIKit

extension String {
    func safeDatabaseKey() -> String {
        let result = self.replacingOccurrences(of: "@", with: "-")
        return result.replacingOccurrences(of: ".", with: "-")
    }
}

