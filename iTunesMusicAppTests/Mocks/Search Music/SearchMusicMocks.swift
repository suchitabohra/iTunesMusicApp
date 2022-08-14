//
//  SearchMusicMocks.swift
//  iTunesMusicAppTests
//
//  Created by Suchita Bohra on 13/08/22.
//

@testable import iTunesMusicApp
import Quick
import Nimble

extension SearchMusicConfigurator {
    static func configureMockModule(with selectedMediaTypes: [EntityType] = [], viewController: SearchMusicViewController) {
        let router = SearchMusicRouterImplementationMock()
        let interactor = SearchMusicInteractorImplentationMock()
        let presenter = SearchMusicPresenterImplementation()
        interactor.selectedMediaTypes = selectedMediaTypes
        viewController.router = router
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.navigationController = viewController.navigationController
    }

}

class SearchMusicInteractorImplentationMock: SearchMusicInteractor {
    var selectedMediaTypes: [EntityType]?
    var presenter: SearchMusicPresenter?
    var isTryingToFetchResults = false
    var isError: Bool = false
    func viewDidAppear() {
        presenter?.interactor(didRetrieveMediaSelectedItems: selectedMediaTypes)
    }
    
    func searchItunesLibrary(with searchTerm: String) {
        if isError == true {
            isTryingToFetchResults = false
            presenter?.interactor(didFailToRetrieveSearchResults: "Fail to retrieve results")
        } else {
            isTryingToFetchResults = true
            presenter?.interactor(didRetrieveSearchResults: ["foo": ["bar"]])
        }
    }
}

class SearchMusicPresenterImplementationMock: SearchMusicPresenter {
    weak var viewController: SearchMusicPresenterOutput?
    var didRetrieveMediaItems = false
    var failedToReteriveResults = false
    var retrievedSearchResults = false
    
    func interactor(didRetrieveMediaSelectedItems items: [EntityType]?) {
        didRetrieveMediaItems = true
        viewController?.presenter(didRetrieveMediaSelectedItems: items!)
    }
    
    func interactor(didFailToRetrieveSearchResults error: String) {
        failedToReteriveResults = true
    }
    
    func interactor(didRetrieveSearchResults results: [String : [Any]]) {
        retrievedSearchResults=true
        viewController?.presenter(didRetrieveSearchResults: results)
    }
    
    
}

class SearchMusicViewControllerMock: SearchMusicPresenterOutput {
    var didRetrieveMediaItems = false
    var failedToReteriveResults = false
    var retrievedSearchResults = false
    
    func presenter(didRetrieveMediaSelectedItems items: [EntityType]) {
        didRetrieveMediaItems = true
    }
    
    func presenter(didFailToRetrieveSearchResults error: String) {
        failedToReteriveResults = true
    }
    
    func presenter(didRetrieveSearchResults results: [String : [Any]]) {
        retrievedSearchResults = true
    }
}

class SearchMusicRouterImplementationMock: SearchMusicRouter {
    var navigationController: UINavigationController?
    var isMovedToMedia = false
    var isMovedToSearchResults = false
    func routeToMediaTypeSelection() {
        isMovedToMedia = true
    }
    func routeToSearchResults(with results: [String : [Any]]) {
        isMovedToSearchResults = true
    }
}

class SearchResultsRouterImplementationMock: SearchResultsRouter {
    var navigationController: UINavigationController?
    var moveToDetails: Bool = false
    func routeToDetail(selectedMediaObject: Any, with entity: EntityType) {
        moveToDetails = true
    }
}
