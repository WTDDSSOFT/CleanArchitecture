//
//  DataTests.swift
//  DataTests
//
//  Created by william torres dias dos santos on 10/02/23.
//

import XCTest

class RemoteAddAccount {

   private let url: URL
   private let httpClient: HttpPosstClient

   init(url: URL, httpClient: HttpPosstClient) {
      self.url = url
      self.httpClient = httpClient
   }

   func add () {
      httpClient.post(url: url)
   }
}

protocol HttpPosstClient {
   func post(url: URL)
}



final class RemoteAddAccountTests: XCTestCase {

   func test_add_should_call_httpClient_with_correct_url() throws {
      let url = URL(string: "https://any-url.com")!
      let httpClientSpy = HttpClientSpy()
      //class instance.
      let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
      sut.add()
      XCTAssertEqual(httpClientSpy.url, url)
   }

   //fake implemt
   class HttpClientSpy: HttpPosstClient {
      var url: URL?

      // versão mockada!
      func post(url: URL) {
         self.url = url
      }
   }

}
