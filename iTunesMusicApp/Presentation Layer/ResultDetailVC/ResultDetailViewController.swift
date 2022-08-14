//
//  ResultDetailVC.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 09/08/22.
//

import UIKit
import AVKit

struct SelectedMediaTypeModel {
    var previewUrl: URL?
    var trackName: String?
    var artistName: String?
    var collectionName: String?
    var collectionPrice: Double?
    var copyright: String?
    var collectionViewUrl: URL?
    var artworkUrl100: URL?
    var currency: String?
}

protocol ResultDetailPresenterOutput: Any {
    func displayInfo(selectedMediaObject: Any, with entity: EntityType)
}

class ResultDetailViewController: UIViewController {
    var interactor: ResultDetailInteractor?
    var router: ResultDetailRouter?
    var selectedMediaTypeModel: SelectedMediaTypeModel?
    @IBOutlet private (set) weak var lblMediaTitle: UILabel?
    @IBOutlet private (set) weak var lblTrackTitle: UILabel?
    @IBOutlet private (set) weak var btnPlay: UIButton?
    @IBOutlet private (set) weak var imageView: UIImageView?
    @IBOutlet private (set) weak var lblPrice: UILabel?

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        interactor?.viewDidAppear()
    }
    @IBAction func playButtonTapped(_ sender: UIButton) {
        if let videoURL = selectedMediaTypeModel?.previewUrl {
            let player = AVPlayer(url: videoURL)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            self.present(playerViewController, animated: true) {
                playerViewController.player!.play()
            }
        }
    }
    func mapSelectedMedia(data: Any?, with entity: EntityType) {
        switch entity {
        case .album:
            mapSelectedMedia(with: data as? Album)
        case .song:
            mapSelectedMedia(with: data as? Song)
        case .movie:
            mapSelectedMedia(with: data as? Movie)
        default:
            mapSelectedMedia(with: data as? OtherMediaTypeModel)
        }
    }
    func mapSelectedMedia(with album: Album?) {
        let model = SelectedMediaTypeModel(previewUrl: nil, trackName: album?.collectionName,
                                           artistName: album?.artistName,
                                           collectionName: album?.collectionName,
                                           collectionPrice: album?.collectionPrice,
                                           copyright: album?.copyright,
                                           collectionViewUrl: URL(string: album?.collectionViewURL ?? ""),
                                           artworkUrl100: URL(string: album?.artworkUrl100 ?? ""),
                                           currency: album?.currency)
        selectedMediaTypeModel = model
    }
    func mapSelectedMedia(with song: Song?) {
        let model = SelectedMediaTypeModel(previewUrl: URL(string: song?.previewURL ?? ""),
                                           trackName: song?.trackName,
                                           artistName: song?.artistName,
                                           collectionName: song?.collectionName,
                                           collectionPrice: song?.collectionPrice,
                                           copyright: nil,
                                           collectionViewUrl: URL(string: song?.collectionViewURL ?? ""),
                                           artworkUrl100: URL(string: song?.artworkUrl100 ?? ""),
                                           currency: song?.currency)
        selectedMediaTypeModel = model
    }
    func mapSelectedMedia(with movie: Movie?) {
        let model = SelectedMediaTypeModel(previewUrl: URL(string: movie?.previewURL ?? ""),
                                           trackName: movie?.trackName,
                                           artistName: movie?.artistName,
                                           collectionName: nil,
                                           collectionPrice: movie?.collectionPrice,
                                           copyright: nil,
                                           collectionViewUrl: nil,
                                           artworkUrl100: URL(string: movie?.artworkUrl100 ?? ""),
                                           currency: movie?.currency)
        selectedMediaTypeModel = model
    }
    func mapSelectedMedia(with model: OtherMediaTypeModel?) {
        let model = SelectedMediaTypeModel(previewUrl: model?.previewUrl,
                                           trackName: model?.trackName,
                                           artistName: model?.artistName,
                                           collectionName: model?.collectionName,
                                           collectionPrice: model?.collectionPrice,
                                           copyright: nil,
                                           collectionViewUrl: model?.collectionViewUrl,
                                           artworkUrl100: model?.artworkUrl100,
                                           currency: model?.currency)
        selectedMediaTypeModel = model
    }
}

extension ResultDetailViewController: ResultDetailPresenterOutput {
    func displayInfo(selectedMediaObject: Any, with entity: EntityType) {
        mapSelectedMedia(data: selectedMediaObject, with: entity)
        lblMediaTitle?.text = selectedMediaTypeModel?.trackName ?? selectedMediaTypeModel?.collectionName
        lblTrackTitle?.text = selectedMediaTypeModel?.artistName == nil ? "" : "(\(String(describing: selectedMediaTypeModel?.artistName)))"
        imageView?.kf.setImage(with: selectedMediaTypeModel?.artworkUrl100, placeholder: UIImage(), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: nil)
        btnPlay?.isHidden = !(selectedMediaTypeModel?.previewUrl != nil)
    }
}
