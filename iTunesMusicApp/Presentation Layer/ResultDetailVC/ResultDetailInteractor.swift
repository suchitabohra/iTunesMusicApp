//
//  ResultDetailInteractor.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 10/08/22.
//

import UIKit

protocol ResultDetailInteractor {
    var selectedMediaObject: Any! { get set }
    var entityType: EntityType! { get set }
    func viewDidAppear()
}

class ResultDetailInteractorImplementation: ResultDetailInteractor {
    var selectedMediaObject: Any!
    var entityType: EntityType!
    var presenter: ResultDetailPresenter?
    func viewDidAppear() {
        presenter?.present(selectedMediaObject: selectedMediaObject as Any, with: entityType)
    }
}
