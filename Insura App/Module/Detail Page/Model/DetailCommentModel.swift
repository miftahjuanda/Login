//
//  DetailCommentModel.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 26/02/22.
//

import Foundation


struct DetailCommentModelElement: Codable {
    let postID, id: Int?
    let name, email, body: String?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}

typealias DetailCommentModel = [DetailCommentModelElement]
