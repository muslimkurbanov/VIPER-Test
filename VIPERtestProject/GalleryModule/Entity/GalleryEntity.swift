//
//  GalleryEntity.swift
//  VIPERtestProject
//
//  Created by Муслим Курбанов on 11.01.2021.
//

import Foundation

struct Images: Decodable {
    let urls: [ImageSize.RawValue:String]
    let description: String?
    let alt_description: String?
}
enum ImageSize: String {
    case raw
    case full
    case regular
    case small
    case thumb
}
