//
//  HttpPostClient.swift
//  Data
//
//  Created by william torres dias dos santos on 15/02/23.
//

import Foundation

public protocol HttpPosstClient {
   func post(to url: URL, with data: Data?)
}
