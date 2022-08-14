//
//  SearchMusicPresenterTests.swift
//  iTunesMusicAppTests
//
//  Created by Suchita Bohra on 13/08/22.
//

@testable import iTunesMusicApp
import Quick
import Nimble

class SearchMusicPresenterTests: QuickSpec {
    var presenter: SearchMusicPresenterImplementation? = SearchMusicPresenterImplementation()
    var mockSearchViewController = SearchMusicViewControllerMock()
    
    override func spec() {
        describe("SearchMusicViewController Tests") {
            beforeEach {
                self.presenter?.viewController = self.mockSearchViewController
            }
            
            context("when interactor retrieve selected media items") {
                beforeEach {
                    self.presenter?.interactor(didRetrieveMediaSelectedItems: EntityType.allCases)
                }
                it("should ask viewcontroler to show selected items") {
                   expect(self.mockSearchViewController.didRetrieveMediaItems) == true
                }
            }
            
            context("when interactor retrieve search items") {
                beforeEach {
                    self.presenter?.interactor(didRetrieveSearchResults: ["foo": ["bar"]])
                }
                it("should ask viewcontroler to show search items") {
                   expect(self.mockSearchViewController.retrievedSearchResults) == true
                }
            }
            
            context("when interactor retrieve fail to search items") {
                beforeEach {
                    self.presenter?.interactor(didFailToRetrieveSearchResults: "foo")
                }
                it("should ask viewcontroler to show error message") {
                   expect(self.mockSearchViewController.failedToReteriveResults) == true
                }
            }
        }
    }
}
