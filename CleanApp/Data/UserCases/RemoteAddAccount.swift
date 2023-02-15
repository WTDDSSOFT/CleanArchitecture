//
//  RemoteAddAccount.swift
//  Data
//
//  Created by william torres dias dos santos on 15/02/23.
//

import Foundation
import Domain

public final class RemoteAddAccount {

   private let url: URL
   private let httpClient: HttpPosstClient

  public init(
      url: URL,
      httpClient: HttpPosstClient
   ) {
      self.url = url
      self.httpClient = httpClient
   }

   public func add(addAcountModel: AddAccountModel) {
      httpClient.post(to: url, with: addAcountModel.toData())
   }

}
