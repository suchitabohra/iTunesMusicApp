//
//  SearchResultViewControllerTests.swift
//  iTunesMusicAppTests
//
//  Created by Suchita Bohra on 13/08/22.
//

@testable import iTunesMusicApp
import Quick
import Nimble

class SearchResultViewControllerTests: QuickSpec {
    var viewController: SearchResultsViewController!
    override func spec() {
        describe("SearchResultsViewController Tests") {
            context("when view is loaded") {
                beforeEach {
                    self.viewController = SearchResultsViewController.stub()
                }
                
                it("should have proper outlets") {
                    expect(self.viewController.segmentedButton) != nil
                    expect(self.viewController.collectionView) != nil
                }
                
                it("should list results") {
                    expect(self.viewController.collectionView.numberOfSections) == 4
                }
                
                it("should switch grid on tapping grid button") {
                    self.viewController.segmentedButton.selectedSegmentIndex = 0
                    self.viewController.segmentedValueChanged(self.viewController.segmentedButton)
                    expect(self.viewController.collectionView.dataSource?.collectionView(self.viewController.collectionView, cellForItemAt: IndexPath(item: 0, section: 1))).toEventually(beAKindOf(GridCollectionViewCell.self))
                }
                
                it("should switch list on tapping list button") {
                    self.viewController.segmentedButton.selectedSegmentIndex = 1
                    self.viewController.segmentedValueChanged(self.viewController.segmentedButton)
                    expect(self.viewController.collectionView.dataSource?.collectionView(self.viewController.collectionView, cellForItemAt: IndexPath(item: 0, section: 1))).toEventually(beAKindOf(ListCollectionViewCell.self))
                }
                
                context("when item tapped") {
                    beforeEach {
                        let mockRouter = SearchResultsRouterImplementationMock()
                        self.viewController.router = mockRouter
                        self.viewController.collectionView.delegate?.collectionView?(self.viewController.collectionView, didSelectItemAt: IndexPath(item: 0, section: 0))
                    }
                    it("should move to detail screen") {
                        expect((self.viewController.router as! SearchResultsRouterImplementationMock).moveToDetails) == true
                    }
                }
            }
            afterEach {
                self.viewController = nil
            }
        }
    }
}
