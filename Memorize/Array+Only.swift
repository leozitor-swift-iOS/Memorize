//
//  Array+Only.swift
//  Memorize
//
//  Created by Leozítor Floro on 29/06/20.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
