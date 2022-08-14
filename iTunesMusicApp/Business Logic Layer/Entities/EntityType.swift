//
//  EntityType.swift
//  ItunesSearchApp
//
//  Created by Suchita Bohra on 26.07.22.
//

import Foundation

enum EntityType: String, Identifiable, CaseIterable {
    case album
    case song
    case movie
    case allArtist
    case audiobook
    case musicVideo
    case podcast

    var id: String {
        self.rawValue
    }

    var key: String {
        switch self {
        case .album:
            return "album"
        case .allArtist:
            return "allArtist"
        case .audiobook:
            return "audiobook"
        case .movie:
            return "movie"
        case .musicVideo:
            return "musicVideo"
        case .podcast:
            return "podcast"
        case .song:
            return "song"
        }
    }

    func name() -> String {
        switch self {
        case .album:
            return "Albums"
        case .song:
            return "Songs"
        case .movie:
            return "Movie"
        case .allArtist:
            return "Artist"
        case .audiobook:
            return "Audio Book"
        case .musicVideo:
            return "Music Video"
        case .podcast:
            return "Podcast"

        }
    }
}
