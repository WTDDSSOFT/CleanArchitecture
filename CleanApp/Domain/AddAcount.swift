//
//  AddAcount.swift
//  Domain
//
//  Created by william torres dias dos santos on 10/02/23.
//

import Foundation

protocol AddAcount {
   // recebe alguns dados do cadastros
   func add(addAccountModel: addAccountModel, completion: @escaping(Result<AccountModel, Error>) -> ())
}

struct AccountModel {
   var name: String
   var email: String
   var password: String
   var passwordConfirmation: String
}

