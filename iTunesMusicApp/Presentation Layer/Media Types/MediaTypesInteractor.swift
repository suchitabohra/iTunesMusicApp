//
//  MediaTypeInteractor.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 10/08/22.
//

import UIKit

protocol MediaTypeInteractor {
    func viewDidLoad()
}

class MediaTypeInteractorImplementation: MediaTypeInteractor {
    private var allMediaTypes: [EntityType] = EntityType.allCases
    var presenter: MediaTypesPresenter?
    func viewDidLoad() {
        presenter?.interactor(didRetrieveItems: allMediaTypes)
    }
}
