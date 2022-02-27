//
//  DetailModel.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 21/02/22.
//

import Foundation

struct DetailModel: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
