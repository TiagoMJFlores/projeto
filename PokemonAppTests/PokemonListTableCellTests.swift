//
//  PokemonAppTests.swift
//  PokemonAppTests
//
//  Created by Tiago Flores on 06/02/2021.
//

import XCTest
@testable import PokemonApp

class PokemonAppTests: XCTestCase {

    var sut: PokemonListTableViewCell?

    override func setUpWithError() throws {
  
        sut = PokemonListTableViewCell()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTitleLabelAssignValue() throws {
        guard let sut = sut else { return }
        let pokemonDetailInfo = PokemonFactory.makePokemonDetailInfo()
        let pokemonEntry = PokemonFactory.makePokemonEntry(name: "test")
        let detailPresenterMock = PokemonDetailPresenterStub(pokemonEntry: pokemonEntry, pokemonDetailInfo: pokemonDetailInfo)
        sut.configure(with: detailPresenterMock)
        XCTAssertEqual(sut.titleTextLabel.text, "test")
    }
    
    func testImageAssignValue() throws {
        guard let sut = sut else { return }
        let pokemonDetailInfo = PokemonFactory.makePokemonDetailInfo()
        let pokemonEntry = PokemonFactory.makePokemonEntry()
        
        let imageDownloaderMock = ImageDownloaderStub()
        imageDownloaderMock.image = UIImage()
        sut.imageDownloader = imageDownloaderMock
        
        let detailPresenterMock = PokemonDetailPresenterStub(pokemonEntry: pokemonEntry, pokemonDetailInfo: pokemonDetailInfo)
        sut.configure(with: detailPresenterMock)
        XCTAssertNotNil(sut.pokemonImageView.image)
    }
    
   

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
