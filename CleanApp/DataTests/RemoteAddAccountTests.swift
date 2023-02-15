//
//  DataTests.swift
//  DataTests
//
//  Created by william torres dias dos santos on 10/02/23.
//

import XCTest
import Domain
import Data

class RemoteAddAccountTests: XCTestCase {

   func test_add_should_call_httpClient_with_correct_url() throws {
      let url = URL(string: "https://any-url.com")!
      let (sut, httpClientSpy) = makeSut(url: url)
      //mock data
      let addAccountModel = makeAddAccountModel()

      sut.add(addAcountModel: addAccountModel)
      XCTAssertEqual(httpClientSpy.url, url)
   }

   func test_add_should_call_httpClient_with_correct_data() throws {
      let (sut, httpClientSpy) = makeSut()
      //mock data
      let addAccountModel = makeAddAccountModel()
      sut.add(addAcountModel: addAccountModel)

      XCTAssertEqual(httpClientSpy.data, addAccountModel.toData())
   }

}

extension RemoteAddAccountTests {
   // Factory  Design Pattern
   func makeSut(url:URL = URL(string: "https://any-url.com")!) -> (sut:RemoteAddAccount, httpClientSpy: HttpClientSpy) {
      let httpClientSpy = HttpClientSpy()
      //class instance.

      let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
      return (sut, httpClientSpy)// tupla
   }

   // Refactor reduce duplicate initialize
   func makeAddAccountModel() -> AddAccountModel { //factory pattern
      return AddAccountModel(name: "william",
                            email: "willaimTest@gmail.com",
                            password: "123456789",
                            passwordConfirmation: "123456789")
   }

   //fake implemt
   class HttpClientSpy: HttpPosstClient {
      // this is a generec client, so only generec data
      var url: URL?
      var data: Data?

      // versão mockada!
      func post(to url: URL, with data: Data?) {
         self.url = url
         self.data = data
      }
   }

}
