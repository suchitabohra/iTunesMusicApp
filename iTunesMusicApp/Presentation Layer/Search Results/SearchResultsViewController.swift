//
//  ResultVC.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 09/08/22.
//

import UIKit
import Kingfisher

protocol SearchResultsPresenterOutput: AnyObject {
    func presenter(didRetrieveResult results: [String: [Any]])
}

class SearchResultsViewController: UIViewController {
    @IBOutlet private (set) weak var segmentedButton: UISegmentedControl!
    @IBOutlet private (set) weak var collectionView: UICollectionView!
    private var isGrid: Bool = true
    private var results: [String: [Any]] = [:]
    private var headers: [String] = []
    var interactor: SearchResultsInteractor?
    var router: SearchResultsRouter?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Result"
        segmentedButton?.selectedSegmentIndex = isGrid ? 0 : 1
        collectionView?.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        isGrid ? setUpCollectionViewForGrid() : setUpCollectionViewForList()
        interactor?.viewDidLoad()
    }

    private func setUpCollectionViewForList() {
        collectionView.register(UINib(nibName: "ListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ListCollectionViewCell")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 4
        collectionView
            .setCollectionViewLayout(layout, animated: true)
    }

    private func setUpCollectionViewForGrid() {
        collectionView.register(UINib(nibName: "GridCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GridCollectionViewCell")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 4
        collectionView
            .setCollectionViewLayout(layout, animated: true)
    }

    @IBAction func segmentedValueChanged(_ sender: UISegmentedControl!) {
        print("Selected Segment Index is : \(sender.selectedSegmentIndex)")
        isGrid = sender.selectedSegmentIndex == 0
        isGrid ? setUpCollectionViewForGrid() : setUpCollectionViewForList()
    }
}

extension SearchResultsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return headers.count
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? SectionHeader else {
                return UICollectionReusableView()
            }
            sectionHeader.backgroundColor = UIColor.black
            let entity = EntityType.init(rawValue: headers[indexPath.section])
            sectionHeader.label.text = entity?.name()
            return sectionHeader
        } else {
            return UICollectionReusableView()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results[headers[section]]?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let entity = EntityType.init(rawValue: headers[indexPath.section])
        let content = results[headers[indexPath.section]]?[indexPath.item]

        if isGrid {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCollectionViewCell", for: indexPath) as? GridCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(data: content, with: entity!)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as? ListCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(data: content, with: entity!)
            return cell
        }
    }
}

extension SearchResultsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let entity = EntityType.init(rawValue: headers[indexPath.section])!
                let content = results[headers[indexPath.section]]?[indexPath.item]
        router?.routeToDetail(selectedMediaObject: content!, with: entity)

    }
}

extension SearchResultsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as? UICollectionViewFlowLayout
        let widthPerItem = isGrid ? collectionView.frame.width / 2 - lay!.minimumInteritemSpacing : collectionView.frame.width - lay!.minimumInteritemSpacing
        return CGSize(width: widthPerItem - 8, height: isGrid ? 250 : 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
}

extension SearchResultsViewController: SearchResultsPresenterOutput {
    func presenter(didRetrieveResult results: [String: [Any]]) {
        self.results = results
        headers = Array(self.results.keys)
        collectionView.reloadData()
    }
}
