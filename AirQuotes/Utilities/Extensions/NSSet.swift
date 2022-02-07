//
//  NSSet.swift
//  AirQuotes
//
//  Created by riccardo ruocco on 07/02/22.
//

import Foundation

extension NSSet {
  func toArray<T>() -> [T] {
    let array = self.map({ $0 as! T})
    return array
  }
}
