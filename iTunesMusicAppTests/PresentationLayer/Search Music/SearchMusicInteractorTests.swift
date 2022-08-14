//
//  SearchMusicInteractorTests.swift
//  iTunesMusicAppTests
//
//  Created by Suchita Bohra on 13/08/22.
//

@testable import iTunesMusicApp
import Quick
import Nimble

class SearchMusicInteractorTests: QuickSpec {
    var interactor: SearchMusicInteractorImplentation?
    
    override func spec() {
        describe("SearchMusicInteractor Tests") {
            context("when search itunes library called for album") {
                beforeEach {
                    self.interactor = SearchMusicInteractorImplentation()
                    self.interactor?.selectedMediaTypes = [.album]
                    let dataStore = ItunesDataStoreMock()
                    dataStore.data = JSONHelper.readLocalJSONFile(forName: "AlbumResponse")
                    self.interactor?.searchService = ItunesSearchService(itunesDataStore: dataStore)
                    self.interactor?.presenter = SearchMusicPresenterImplementationMock()
                    self.interactor?.searchItunesLibrary(with: "foo")
                }
                it("should fetch results") {
                    expect((self.interactor?.presenter as? SearchMusicPresenterImplementationMock)?.retrievedSearchResults).toEventually(beTrue())
                }
            }
            
            context("when search itunes library called for song") {
                beforeEach {
                    self.interactor = SearchMusicInteractorImplentation()
                    self.interactor?.selectedMediaTypes = [.song]
                    let dataStore = ItunesDataStoreMock()
                    dataStore.data = JSONHelper.readLocalJSONFile(forName: "SongResponse")
                    self.interactor?.searchService = ItunesSearchService(itunesDataStore: dataStore)
                    self.interactor?.presenter = SearchMusicPresenterImplementationMock()
                    self.interactor?.searchItunesLibrary(with: "foo")
                }
                it("should fetch results") {
                    expect((self.interactor?.presenter as? SearchMusicPresenterImplementationMock)?.retrievedSearchResults).toEventually(beTrue())
                }
            }
            
            context("when search itunes library called for movies") {
                beforeEach {
                    self.interactor = SearchMusicInteractorImplentation()
                    self.interactor?.selectedMediaTypes = [.movie]
                    let dataStore = ItunesDataStoreMock()
                    dataStore.data = JSONHelper.readLocalJSONFile(forName: "MovieResponse")
                    self.interactor?.searchService = ItunesSearchService(itunesDataStore: dataStore)
                    self.interactor?.presenter = SearchMusicPresenterImplementationMock()
                    self.interactor?.searchItunesLibrary(with: "foo")
                }
                it("should fetch results") {
                    expect((self.interactor?.presenter as? SearchMusicPresenterImplementationMock)?.retrievedSearchResults).toEventually(beTrue())
                }
            }
            
            context("when search itunes library called for otherMediaTyp") {
                beforeEach {
                    self.interactor = SearchMusicInteractorImplentation()
                    self.interactor?.selectedMediaTypes = [.allArtist]
                    let dataStore = ItunesDataStoreMock()
                    dataStore.data = JSONHelper.readLocalJSONFile(forName: "OtherMediaTypeResponse")
                    self.interactor?.searchService = ItunesSearchService(itunesDataStore: dataStore)
                    self.interactor?.presenter = SearchMusicPresenterImplementationMock()
                    self.interactor?.searchItunesLibrary(with: "foo")
                }
                it("should fetch results") {
                    expect((self.interactor?.presenter as? SearchMusicPresenterImplementationMock)?.retrievedSearchResults).toEventually(beTrue())
                }
            }
            
            context("when search itunes failed to reterive album items") {
                beforeEach {
                    self.interactor = SearchMusicInteractorImplentation()
                    self.interactor?.selectedMediaTypes = [.album]
                    let dataStore = ItunesDataStoreMock()
                    dataStore.isError = true
                    self.interactor?.searchService = ItunesSearchService(itunesDataStore: dataStore)
                    self.interactor?.presenter = SearchMusicPresenterImplementationMock()
                    self.interactor?.searchItunesLibrary(with: "foo")
                }
                it("should not fetch results") {
                    expect((self.interactor?.presenter as? SearchMusicPresenterImplementationMock)?.failedToReteriveResults).toEventually(beTrue())
                }
            }
            
            context("when search itunes failed to reterive song items") {
                beforeEach {
                    self.interactor = SearchMusicInteractorImplentation()
                    self.interactor?.selectedMediaTypes = [.song]
                    let dataStore = ItunesDataStoreMock()
                    dataStore.isError = true
                    self.interactor?.searchService = ItunesSearchService(itunesDataStore: dataStore)
                    self.interactor?.presenter = SearchMusicPresenterImplementationMock()
                    self.interactor?.searchItunesLibrary(with: "foo")
                }
                it("should not fetch results") {
                    expect((self.interactor?.presenter as? SearchMusicPresenterImplementationMock)?.failedToReteriveResults).toEventually(beTrue())
                }
            }
            
            context("when search itunes failed to reterive movies items") {
                beforeEach {
                    self.interactor = SearchMusicInteractorImplentation()
                    self.interactor?.selectedMediaTypes = [.movie]
                    let dataStore = ItunesDataStoreMock()
                    dataStore.isError = true
                    self.interactor?.searchService = ItunesSearchService(itunesDataStore: dataStore)
                    self.interactor?.presenter = SearchMusicPresenterImplementationMock()
                    self.interactor?.searchItunesLibrary(with: "foo")
                }
                it("should not fetch results") {
                    expect((self.interactor?.presenter as? SearchMusicPresenterImplementationMock)?.failedToReteriveResults).toEventually(beTrue())
                }
            }
            
            context("when search itunes failed to reterive otherMedia items") {
                beforeEach {
                    self.interactor = SearchMusicInteractorImplentation()
                    self.interactor?.selectedMediaTypes = [.allArtist]
                    let dataStore = ItunesDataStoreMock()
                    dataStore.isError = true
                    self.interactor?.searchService = ItunesSearchService(itunesDataStore: dataStore)
                    self.interactor?.presenter = SearchMusicPresenterImplementationMock()
                    self.interactor?.searchItunesLibrary(with: "foo")
                }
                it("should not fetch results") {
                    expect((self.interactor?.presenter as? SearchMusicPresenterImplementationMock)?.failedToReteriveResults).toEventually(beTrue())
                }
            }
            
            context("when selected media items are empty") {
                beforeEach {
                    self.interactor = SearchMusicInteractorImplentation()
                    self.interactor?.selectedMediaTypes = nil
                    self.interactor?.presenter = SearchMusicPresenterImplementationMock()
                    self.interactor?.searchItunesLibrary(with: "foo")
                }
                it("should not fetch results") {
                    expect((self.interactor?.presenter as? SearchMusicPresenterImplementationMock)?.failedToReteriveResults).toEventually(beTrue())
                }
            }
        }
    }
}

