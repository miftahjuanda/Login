//
//  ProfileViewModel.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 21/02/22.
//

import Foundation

class ProfileViewModel {
    
    var model: ProfileModel?
    var provider: ProviderAPI?
    
    init(provider: ProviderAPI) {
        self.provider = provider
    }
    
    func fetchProfile(id: Int) {
        provider?.fetchDataProfile(id: id, completion: { [weak self] modelData in
            switch modelData {
            case let .success(model):
                self?.model = model
            case let .failed(error):
                print(error)
            }
        })
    }
}
