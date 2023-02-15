//
//  Model.swift
//  Domain
//
//  Created by william torres dias dos santos on 15/02/23.
//

import Foundation

//Generic JSONEncoder

public protocol Model: Encodable { }

public extension Model {
   func toData() -> Data? {
      return  try? JSONEncoder().encode(self)
   }
}
