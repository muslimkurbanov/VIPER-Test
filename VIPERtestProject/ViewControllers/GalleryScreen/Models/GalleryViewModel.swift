//
//  GalleryViewModel.swift
//  VIPERtestProject
//
//  Created by Муслим Курбанов on 29.01.2021.
//

import Foundation

struct ImagesViewModel: Decodable {
    let urls: [ImageSizeViewModel.RawValue:String]
    let description: String?
}

enum ImageSizeViewModel: String {
    case raw
    case small
}
