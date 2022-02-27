//
//  NetworkHelper.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 21/02/22.
//

import Foundation

enum NetworkHelper<T> {
    case success(T)
    case failed(String)
}
