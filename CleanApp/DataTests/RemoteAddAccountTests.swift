//
//  DataTests.swift
//  DataTests
//
//  Created by william torres dias dos santos on 10/02/23.
//

import XCTest

class RemoteAddAccount {

   private let url: URL
   private let httpClient: HttpClient

   init(url: URL, httpClient: HttpClient) {
      self.url = url
      self.httpClient = httpClient
   }

   func add () {
      httpClient.post(url: url)
   }
}

protocol HttpClient {
   func post(url: URL)
}

final class RemoteAddAccountTests: XCTestCase {

   func test_() throws {
      let url = URL(string: "https://any-url.com")!
      let httpClientSpy = HttpClientSpy()
      //class instance.
      let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
      sut.add()
      XCTAssertEqual(httpClientSpy.url, url)
   }

   //fake implemt
   class HttpClientSpy: HttpClient {
      var url: URL?

      // versão mockada!
      func post(url: URL) {
         self.url = url
      }
   }

}
