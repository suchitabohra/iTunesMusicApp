//
//  MediaTypeVC.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 09/08/22.
//

import UIKit

protocol MediaTypesPresenterOutput: AnyObject {
    func presenter(didRetrieveItems items: [EntityType])
}

class MediaTypesViewController: UIViewController {
    @IBOutlet private (set) weak var tableView: UITableView!
    var interactor: MediaTypeInteractor?
    var router: MediaTypesRouter?
    private var mediaTypeItems: [EntityType] = []

    // MARK: Object lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.viewDidLoad()
    }

    private func reloadTableView() {
        tableView.reloadData()
    }

    private func getSelectedItems() -> [EntityType] {
        return tableView.indexPathsForSelectedRows?.map({ indexpath in
            return EntityType.allCases[indexpath.row]
        }) ?? []
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        router?.routeBackToSearchMusic(with: getSelectedItems())
    }
}

extension MediaTypesViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: TableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaTypeItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MediaTypeCell") else {
            return UITableViewCell()
        }
        let mediaType = mediaTypeItems[indexPath.row]
        cell.textLabel?.text = mediaType.name()
        cell.textLabel?.textColor = .white
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
       return indexPath
   }

    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        return indexPath
    }
}

extension MediaTypesViewController: MediaTypesPresenterOutput {
    func presenter(didRetrieveItems items: [EntityType]) {
        mediaTypeItems = items
        reloadTableView()
    }
}
