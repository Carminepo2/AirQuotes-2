//
//  Array.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 02/02/22.
//

import Foundation


extension Array {
    /// Splits an array in subarrays given their size
    /// - Parameter size: Desired size of the subarrays
    /// - Returns: The array splitted in subarrays of n (`size`) elements
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)]) }
    }
    func notNull() -> [Element] {
        var notNullArray = Array(self)
        let canBeNullArray = Array(self)

        for element in canBeNullArray{
            if(element != nil)
            {
                notNullArray.append(element)
            }
        }
        
      return notNullArray
    }
}
