//
//  ResultDetailViewController.swift
//  iTunesMusicAppTests
//
//  Created by Suchita Bohra on 13/08/22.
//

@testable import iTunesMusicApp
import Quick
import Nimble

class ResultDetailViewControllerTests: QuickSpec {
    var viewController: ResultDetailViewController!
    override func spec() {
        describe("SearchResultsViewController Tests") {
            context("when view is loaded") {
                beforeEach {
                    self.viewController = ResultDetailViewController.stub()
                }
                
                it("should have proper outlets") {
                    expect(self.viewController.lblMediaTitle) != nil
                    expect(self.viewController.lblTrackTitle) != nil
                }
                
                it("should show details") {
                    expect(self.viewController.selectedMediaTypeModel) != nil
                }
                
                afterEach {
                    self.viewController = nil
                }
            }
            
            context("when view selected media is song") {
                beforeEach {
                    self.viewController = ResultDetailViewController.stub(with: HelperFunctions.getSongArray(), entity: .song)
                }
                
                it("should show details") {
                    expect(self.viewController.selectedMediaTypeModel) != nil
                }
                
                afterEach {
                    self.viewController = nil
                }
            }
            
            context("when view selected media is movies") {
                beforeEach {
                    self.viewController = ResultDetailViewController.stub(with: HelperFunctions.getMovieArray(), entity: .movie)
                }
                
                it("should show details") {
                    expect(self.viewController.selectedMediaTypeModel) != nil
                }
                
                afterEach {
                    self.viewController = nil
                }
            }
            
            context("when view selected media is otherMediaType") {
                beforeEach {
                    self.viewController = ResultDetailViewController.stub(with: HelperFunctions.getOtherMediaArray(), entity: .audiobook)
                }
                
                it("should show details") {
                    expect(self.viewController.selectedMediaTypeModel) != nil
                }
                
                afterEach {
                    self.viewController = nil
                }
            }
            
        }
    }
}
