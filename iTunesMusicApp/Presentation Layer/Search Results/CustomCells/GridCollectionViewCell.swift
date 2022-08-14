//
//  GridCollectionViewCell.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 09/08/22.
//

import UIKit
import Kingfisher

class GridCollectionViewCell: UICollectionViewCell {
    @IBOutlet private (set) weak var imgViewMedia: UIImageView?
    @IBOutlet private (set) weak var lblTitle: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(data: Any?, with entity: EntityType) {
        switch entity {
        case .album:
            configureCell(with: data as? Album)
        case .song:
            configureCell(with: data as? Song)
        case .movie:
            configureCell(with: data as? Movie)
        default:
            configureCell(with: data as? OtherMediaTypeModel)
        }
    }

    func configureCell(with album: Album?) {
        lblTitle?.text = album?.artistName
        imgViewMedia?.kf.setImage(with: URL(string: album?.artworkUrl100 ??
                                           ""), placeholder: UIImage(), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: nil)
    }

    func configureCell(with song: Song?) {
        lblTitle?.text = song?.trackName
        imgViewMedia?.kf.setImage(with: URL(string: song?.artworkUrl100 ??
                                            ""), placeholder: UIImage(), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: nil)
    }

    func configureCell(with movies: Movie?) {
        lblTitle?.text = movies?.artistName
        imgViewMedia?.kf.setImage(with: URL(string: movies?.artworkUrl100 ??
                                            ""), placeholder: UIImage(), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: nil)
    }

    func configureCell(with otherMedia: OtherMediaTypeModel?) {
        lblTitle?.text = otherMedia?.artistName
        imgViewMedia?.kf.setImage(with: otherMedia?.artworkUrl100, placeholder: UIImage(), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: nil)
    }

}
