//
//  AddAcount.swift
//  Domain
//
//  Created by william torres dias dos santos on 10/02/23.
//

import Foundation

public protocol AddAcount {
   // recebe alguns dados do cadastros
   func add(addAcountModel: AddAccountModel,
            completion: @escaping(Result<AccountModel, Error>) -> ())
}

public struct AddAccountModel: Model {

   public  var name: String
   public  var email: String
   public  var password: String
   public  var passwordConfirmation: String

   public init(
      name: String,
      email: String,
      password: String,
      passwordConfirmation: String
   ) {
      self.name = name
      self.email = email
      self.password = password
      self.passwordConfirmation = passwordConfirmation
   }
}

