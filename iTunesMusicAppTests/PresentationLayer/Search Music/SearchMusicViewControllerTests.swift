//
//  SearchMusicViewControllerTests.swift
//  iTunesMusicAppTests
//
//  Created by Suchita Bohra on 13/08/22.
//

@testable import iTunesMusicApp
import Quick
import Nimble

class SearchMusicViewControllerTests: QuickSpec {
    var viewController: SearchMusicViewController!
    override func spec() {
        describe("SearchMusicViewController Tests") {
            context("when view is loaded") {
                beforeEach {
                    self.viewController = SearchMusicViewController.stub()
                }
                
                it("should have proper outlets") {
                    expect(self.viewController.searchTextField) != nil
                    expect(self.viewController.mediaTypeContainer) != nil
                    expect(self.viewController.mediaTypeCollectionView) != nil
                }
                
                it("should have selected media types in media type collection view") {
                    expect(self.viewController.mediaTypeCollectionView.numberOfItems(inSection: 0)) == 2
                }
                
                it("should have collection view cell with correct label") {
                    expect(self.viewController.mediaTypeCollectionView.dataSource?.collectionView(self.viewController.mediaTypeCollectionView, cellForItemAt: IndexPath(item: 0, section: 0))).to(beAKindOf(MediaTypCollectionViewCell.self))
                }
            }
            context("when media typebutton pressed") {
                beforeEach {
                    self.viewController = SearchMusicViewController.stub(isMock: true)
                    self.viewController.mediaTypeContainer.sendActions(for: .touchUpInside)
                }
                
                it("should move to media selector") {
                    expect((self.viewController.router as! SearchMusicRouterImplementationMock).isMovedToMedia) == true
                }
            }
            
            context("when search button pressed and response is available") {
                beforeEach {
                    self.viewController = SearchMusicViewController.stub(isMock: true)
                    self.viewController.submitButton?.sendActions(for: .touchUpInside)
                }
                
                it("should fetch search results") {
                    expect((self.viewController.interactor as! SearchMusicInteractorImplentationMock).isTryingToFetchResults) == true
                }
                
                it("should move to search results") {
                    expect((self.viewController.router as! SearchMusicRouterImplementationMock).isMovedToSearchResults) == true
                }
            }
            
            context("when search button pressed and response is not available") {
                beforeEach {
                    self.viewController = SearchMusicViewController.stub(isMock: true)
                    let interactor = self.viewController.interactor as! SearchMusicInteractorImplentationMock
                    interactor.isError = true
                    self.viewController.submitButton?.sendActions(for: .touchUpInside)
                }
                
                it("should not fetch search results") {
                    expect((self.viewController.interactor as! SearchMusicInteractorImplentationMock).isTryingToFetchResults) == false
                }
            }
            
            afterEach {
                self.viewController = nil
            }
        }
    }
}
