//
//  HomeViewModel.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 21/02/22.
//

import Foundation

class HomeViewModel {
    
    var model: HomeModel?
//    var modelCountComment: CommentModel?
    var resultData: (() -> Void)?
    
    let provider: ProviderAPI
    
    
    init(provider: ProviderAPI) {
        self.provider = provider
    }
    
    func fetchData(limit: Int) {
        provider.fetchDataHome(limit: limit, completion: { [weak self] modelData in
            switch modelData {
            case .success(let model):
                self?.model = model
                self?.resultData?()
            case let .failed(error):
                print(error)
            }
            
        })
        return
    }
    
    func fetchCountComment(id: Int, completion: @escaping (Int) -> Void) {
        provider.fetchDataComment(id: id, completion: { [weak self] modelData in
            switch modelData {
            case let .success(model):
                completion(model.count)
            case let .failed(error):
                completion(0)
                print(error)
            }
        })
    }
    
}
