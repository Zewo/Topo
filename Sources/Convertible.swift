//
//  Convertible.swift
//  Topo
//
//  Created by Oleg Dreyman on 27.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation
#if os(Linux)
    import InterchangeData
#endif

public protocol Convertible {
    associatedtype ConvertedTo = Self
    static func from(customInterchangeData value: InterchangeData) -> ConvertedTo?
}

public enum ConvertibleError: ErrorProtocol {
    case cantBindToNeededType
}

extension Int: Convertible {
    public static func from(customInterchangeData value: InterchangeData) -> Int? {
        switch value {
        case .numberValue(let number):
            return Int(number)
        default:
            return nil
        }
    }
}