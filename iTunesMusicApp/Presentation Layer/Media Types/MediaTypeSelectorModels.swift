//
//  MediaTypeSelectorModels.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 10/08/22.
//

import UIKit

enum MediaTypeSelector {
    struct Request {
        var mediaTypes: [String]
        var item: String?
    }
    struct Response {
        var mediaTypes: [String]
    }
    struct ViewModel {
        var mediaTypes: [String]
  }
}
