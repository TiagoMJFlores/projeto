//
//  PokemonListPresenterTest.swift
//  PokemonAppTests
//
//  Created by Tiago Flores on 07/02/2021.
//

import XCTest
@testable import PokemonApp

class PokemonListPresenterTest: XCTestCase {

    var sut: PokemonListPresenter?
    
    override func setUpWithError() throws {
       
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testApiReturningDataShouldPopulateDataSet() throws {
        let pokemonListCoordinatorMock = PokemonListCoordinatorMock()
        let apiServiceStub = PokemonAPIServiceMock()
        apiServiceStub.data = PokemonResultContainer(count: 0, next: "", results: [PokemonFactory.makePokemonEntry(name: "", url: "")])
        
        sut = PokemonListPresenter(coordinator: pokemonListCoordinatorMock, apiService: apiServiceStub)
        sut!.viewLayerLoaded()
        guard let data = sut?.data else {
            XCTAssert(false)
            return
        }
        
        XCTAssert(data.count > 0)
    }
    
    func testDidSelectRowShouldCallPresentDetail() throws {
        let expectation = self.expectation(description: "check if present detail method was called")
        let pokemonListCoordinatorMock = PokemonListCoordinatorMock()
        pokemonListCoordinatorMock.presentDetailCallback = {
            expectation.fulfill()
        }
        
        let apiServiceStub = PokemonAPIServiceMock()
        apiServiceStub.data = PokemonResultContainer(count: 0, next: "", results: [PokemonFactory.makePokemonEntry(name: "", url: "")])
        
        sut = PokemonListPresenter(coordinator: pokemonListCoordinatorMock, apiService: apiServiceStub)
        sut?.viewLayerLoaded()
        sut?.didSelectRow(at: IndexPath(row: 0, section: 0))
        waitForExpectations(timeout: 5, handler: nil)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
