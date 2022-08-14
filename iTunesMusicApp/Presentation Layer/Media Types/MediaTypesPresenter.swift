//
//  MediaTypePresenter.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 10/08/22.
//

import UIKit

protocol MediaTypesPresenter {
    func interactor(didRetrieveItems items: [EntityType])
}

class MediaTypesPresenterImplementation: MediaTypesPresenter {
    func interactor(didRetrieveItems items: [EntityType]) {
        viewController?.presenter(didRetrieveItems: items)
    }

    weak var viewController: MediaTypesPresenterOutput?

}
