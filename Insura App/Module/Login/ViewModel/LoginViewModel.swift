//
//  LoginViewModel.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 21/02/22.
//

import Foundation

class LoginViewModel {
    var model: LoginModel?
    let provider: ProviderAPI
    
    init(provider: ProviderAPI) {
        self.provider = provider
    }
    
    func login(nama: String, completion: @escaping (String) -> Void) {
        provider.login(username: nama, completion: { [weak self] modelData in
            
            switch modelData {
            case let .success(model):
                UserDefaults.standard.set( model.first?.id, forKey: "id_user")
                completion("\(model.first?.username ?? "")")
            case let .failed(error):
                completion(error)
            }
        })
    }
    
}
