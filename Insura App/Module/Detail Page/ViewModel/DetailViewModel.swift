//
//  DetailViewModel.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 21/02/22.
//

import Foundation

class DetailViewModel {
    var model: DetailModel?
    var modelComment: DetailCommentModel?
    var provider: ProviderAPI?
    
    var resultDetail: (() -> Void)?
    var resultComment: (() -> Void)?
    
    init(provider: ProviderAPI) {
        self.provider = provider
    }
    
    
    func fetcDetailData(id: Int) {
        provider?.fetchDataDetail(id: id, completion: { [weak self] dataModel in
            switch dataModel {
            case let .success(model):
                self?.model = model
                self?.resultDetail?()
            case let .failed(error):
                print(error)
            }
        })
    }
    
    func fetchDetailComment(id: Int) {
        provider?.fetchDataCommentDetail(id: id, completion: { [weak self] dataModel in
            switch dataModel {
            case let .success(model):
                self?.modelComment = model
                self?.resultComment?()
            case let .failed(error):
                print(error)
            }
        })
    }
    
}
