//
//  Functions.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 01/02/22.
//

import Foundation
import UIKit

/// Hides actual showed keyboard
func hideKeyboard() {
    let resign = #selector(UIResponder.resignFirstResponder)
    UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
}

