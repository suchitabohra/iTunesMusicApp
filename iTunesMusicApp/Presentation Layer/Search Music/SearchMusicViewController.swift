//
//  SearchVC.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 09/08/22.
//

import UIKit
import Kingfisher
import MBProgressHUD

protocol SearchMusicPresenterOutput: AnyObject {
    func presenter(didRetrieveMediaSelectedItems items: [EntityType])
    func presenter(didFailToRetrieveSearchResults error: String)
    func presenter(didRetrieveSearchResults results: [String: [Any]])
}

class SearchMusicViewController: UIViewController {
    @IBOutlet private (set) weak var mediaTypeContainer: UIControl!
    @IBOutlet private (set) weak var searchTextField: UITextField!
    @IBOutlet private (set) weak var submitButton: UIButton?
    @IBOutlet private (set) weak var mediaTypeCollectionView: UICollectionView!
    var selectedMediaTypeItems: [EntityType] = []
    var interactor: SearchMusicInteractor?
    var router: SearchMusicRouter?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        interactor?.viewDidAppear()
    }

    private func configureUI() {
        submitButton?.layer.cornerRadius = 22
        mediaTypeContainer.layer.cornerRadius = 10
    }

    // MARK: - Actions
    public func reloadMediaCollectionView() {
        mediaTypeCollectionView.reloadData()
    }
}

// MARK: - IBActions
extension SearchMusicViewController {
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        MBProgressHUD.showAdded(to: view, animated: true)
        interactor?.searchItunesLibrary(with: searchTextField.text ?? "")
    }

    @IBAction func mediaTypeViewTapped(_ sender: UIControl) {
        router?.routeToMediaTypeSelection()
    }
}

extension SearchMusicViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.endEditing(false)
    }
}

extension SearchMusicViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedMediaTypeItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MediaTypCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.lblText?.text = selectedMediaTypeItems[indexPath.item].name()
        return cell
    }
}

extension SearchMusicViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as? UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 3 - lay!.minimumInteritemSpacing
        return CGSize(width: widthPerItem - 8, height: 50)
    }
}

extension SearchMusicViewController: SearchMusicPresenterOutput {
    func presenter(didFailToRetrieveSearchResults error: String) {
        MBProgressHUD.hide(for: view, animated: true)
        showError(with: error)
    }

    func presenter(didRetrieveSearchResults results: [String: [Any]]) {
        MBProgressHUD.hide(for: view, animated: true)
        router?.routeToSearchResults(with: results)
    }

    func presenter(didRetrieveMediaSelectedItems items: [EntityType]) {
        selectedMediaTypeItems = items
        reloadMediaCollectionView()
    }
}

class MediaTypCollectionViewCell: UICollectionViewCell {
    @IBOutlet private (set) weak var lblText: UILabel?
}
