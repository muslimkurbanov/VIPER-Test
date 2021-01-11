//
//  GalleryEntity.swift
//  VIPERtestProject
//
//  Created by Муслим Курбанов on 11.01.2021.
//

import Foundation

struct Images: Decodable {
    let urls: [URLKing.RawValue:String]
    let description: String?
    let alt_description: String?
}
enum URLKing: String {
    case raw
    case full
    case regular
    case small
    case thumb
}

