//
//  MediaTypeViewControllerTests.swift
//  iTunesMusicAppTests
//
//  Created by Suchita Bohra on 13/08/22.
//

@testable import iTunesMusicApp
import Quick
import Nimble

class MediaTypeViewControllerTests: QuickSpec {
    var viewController: MediaTypesViewController!
    override func spec() {
        describe("MediaType Tests") {
            context("when view is loaded") {
                beforeEach {
                    self.viewController = MediaTypesViewController.stub()
                }
                
                it("should have proper outlets") {
                    expect(self.viewController.tableView) != nil
                }
                
                it("should list all entity type") {
                    expect(self.viewController.tableView.numberOfRows(inSection: 0)) == EntityType.allCases.count
                }
                
                it("should have entity name in cell") {
                    let cell = self.viewController.tableView.dataSource?.tableView(self.viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
                    expect(cell?.textLabel?.text) == EntityType.album.name()
                }
                
                it("should have accessory checkmark on tapping cell") {
                   let _ = self.viewController.tableView.delegate?.tableView!(self.viewController.tableView, willSelectRowAt: IndexPath(row: 0, section: 0))
                    let cell = self.viewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
                    expect(cell?.accessoryType) == .checkmark
                }
                
                it("should have not accessory checkmark on deselecting cell") {
                   let _ = self.viewController.tableView.delegate?.tableView!(self.viewController.tableView, willDeselectRowAt: IndexPath(row: 0, section: 0))
                    let cell = self.viewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
                    expect(cell?.accessoryType) == UITableViewCell.AccessoryType.none
                }
                
                it("should move back to search screen on done button pressed") {
                    self.viewController.router = MediaTypesRouterImplementationMock()
                    self.viewController.doneButtonPressed(UIBarButtonItem())
                    expect((self.viewController.router as! MediaTypesRouterImplementationMock).isRouteBackToSearchScreen).toEventually(beTrue())
                }
            }
            afterEach {
                self.viewController = nil
            }
        }
    }
}
