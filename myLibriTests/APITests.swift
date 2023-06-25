//
//  APITests.swift
//  APITests
//
//  Created by Daniil Konashenko on 16.06.2023.
//

import XCTest
@testable import myLibri

final class APITests: XCTestCase {
    var sut: BooksMarket!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = BooksMarket()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetGenres() async throws {
        // GIVEN
        var result: Genres?
        
        // WHEN
        result = try await sut.getGeners()

        // THEN
        switch result {
        case .none:
            XCTFail("Test failed")
        case .some(let data):
            print(data)
            XCTAssertNotNil(data)
        }
    }
    
    func testGetBooks() async throws {
        // GIVEN
        var result: Books?
        
        // WHEN
        result = try await sut.getBooks(with: 1)

        // THEN
        switch result {
        case .none:
            XCTFail("Test failed")
        case .some(let data):
            print(data)
            XCTAssertNotNil(data)
        }
    }
    
    func testGetImage() async throws {
        // GIVEN
        var result: UIImage?
        
        // WHEN
        result = try await sut.getImage(idBook: 2)
        
        // THEN
        switch result {
        case .none:
            XCTFail("Test failed")
        case .some(let data):
            print(data)
            XCTAssertNotNil(data)
        }
    }
    
    func testDownloadBook() async throws {
        // GIVEN
        var result: Data?
        
        // WHEN
        result = try await sut.dowloadBook(idBook: 2)

        // THEN
        switch result {
        case .none:
            XCTFail("Test failed")
        case .some(let data):
            print(data)
            XCTAssertNotNil(data)
        }
    }
    
}
