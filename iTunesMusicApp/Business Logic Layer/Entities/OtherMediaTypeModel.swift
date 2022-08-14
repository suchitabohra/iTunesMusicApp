//
//  MediaResponseModel.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 10/08/22.
//

import Foundation

struct OtherMediaTypeResult: Codable {
    let resultCount: Int
    let results: [OtherMediaTypeModel]
}

struct OtherMediaTypeModel: Codable {
     let wrapperType: String?
     let trackName: String?
     let artistName: String
     let artistViewUrl: URL?
     let artworkUrl100: URL?
     let collectionName: String?
     let kind: String?
     let collectionPrice: Double?
     let copyright: String?
     let country: String?
     let currency: String?
     let releaseDate: String?
     let previewUrl: URL?
     let collectionViewUrl: URL?
}
