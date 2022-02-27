//
//  LoginModel.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 21/02/22.
//

import Foundation

typealias LoginModel = [LoginModelElement]

// MARK: - LoginModelElement
struct LoginModelElement: Codable {
    let id: Int?
    let name, username, email: String?
}
