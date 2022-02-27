//
//  NetworkProvider.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 21/02/22.
//

import Foundation

protocol ProviderAPI {
    func login(username: String, completion: @escaping ((NetworkHelper<LoginModel>)) -> Void)
    func fetchDataHome(limit: Int, completion: @escaping ((NetworkHelper<HomeModel>)) -> Void)
    func fetchDataComment(id: Int, completion: @escaping ((NetworkHelper<CommentModel>)) -> Void)
    func fetchDataProfile(id: Int, completion: @escaping ((NetworkHelper<ProfileModel>)) -> Void)
    func fetchDataDetail(id: Int, completion: @escaping ((NetworkHelper<DetailModel>)) -> Void)
    func fetchDataCommentDetail(id: Int, completion: @escaping ((NetworkHelper<DetailCommentModel>)) -> Void)
    
}

class NetworkProvider:  ProviderAPI{
    
    func login(username: String, completion: @escaping ((NetworkHelper<LoginModel>)) -> Void) {
        var url = URLComponents(string: "\(url_login)")
        url?.queryItems = [ URLQueryItem(name: "username", value: "\(username)") ]
        
        guard let urlComp = url?.url else { return }
        
        let request = URLRequest(url: urlComp)
        do {
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.failed(error.localizedDescription))
                } else {
                    if let result = try? JSONDecoder().decode(LoginModel.self, from: data!) {
                        completion(.success(result))
                    } else {
                        completion(.failed("Failed when decoding"))
                    }
                }
            }.resume()
        } catch {
            completion(.failed("Error url tidak ditemukan"))
        }
    }
    
    func fetchDataHome(limit: Int, completion: @escaping ((NetworkHelper<HomeModel>)) -> Void) {
        var url = URLComponents(string: "\(url_posts)")
        url?.queryItems = [ URLQueryItem(name: "_limit", value: "\(limit)") ]
        
        guard let urlComp = url?.url else { return }
        let request = URLRequest(url: urlComp)
        
        do {
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.failed(error.localizedDescription))
                } else {
                    if let result = try? JSONDecoder().decode(HomeModel.self, from: data!) {
                        completion(.success(result))
                    } else {
                        completion(.failed("Failed when decoding"))
                    }
                }
            }.resume()
        } catch {
            completion(.failed("Error url tidak ditemukan"))
        }
    }
    
    func fetchDataComment(id: Int, completion: @escaping ((NetworkHelper<CommentModel>)) -> Void) {
        guard let url = URL(string: "\(url_posts)/\(id)/comments") else {return}
        let request = URLRequest(url: url)
        do {
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.failed(error.localizedDescription))
                } else {
                    if let result = try? JSONDecoder().decode(CommentModel.self, from: data!) {
                        completion(.success(result))
                    } else {
                        completion(.failed("Failed when decoding"))
                    }
                }
            }.resume()
        } catch {
            completion(.failed("Error url tidak ditemukan"))
        }
    }
    
    func fetchDataProfile(id: Int, completion: @escaping ((NetworkHelper<ProfileModel>)) -> Void) {
        guard let url = URL(string: "\(url_profile)/\(id)") else {return}
        let request = URLRequest(url: url)
        do {
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.failed(error.localizedDescription))
                } else {
                    if let result = try? JSONDecoder().decode(ProfileModel.self, from: data!) {
                        completion(.success(result))
                    } else {
                        completion(.failed("Failed when decoding"))
                    }
                }
            }.resume()
        } catch {
            completion(.failed("Error url tidak ditemukan"))
        }
    }
    
    func fetchDataDetail(id: Int, completion: @escaping ((NetworkHelper<DetailModel>)) -> Void) {
        guard let url = URL(string: "\(url_posts)/\(id)") else {return}
        let request = URLRequest(url: url)
        do {
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.failed(error.localizedDescription))
                } else {
                    if let result = try? JSONDecoder().decode(DetailModel.self, from: data!) {
                        completion(.success(result))
                    } else {
                        completion(.failed("Failed when decoding"))
                    }
                }
            }.resume()
        } catch {
            completion(.failed("Error url tidak ditemukan"))
        }
    }
    
    func fetchDataCommentDetail(id: Int, completion: @escaping ((NetworkHelper<DetailCommentModel>)) -> Void) {
        guard let url = URL(string: "\(url_posts)/\(id)/comments") else {return}
        let request = URLRequest(url: url)
        do {
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.failed(error.localizedDescription))
                } else {
                    if let result = try? JSONDecoder().decode(DetailCommentModel.self, from: data!) {
                        completion(.success(result))
                    } else {
                        completion(.failed("Failed when decoding"))
                    }
                }
            }.resume()
        } catch {
            completion(.failed("Error url tidak ditemukan"))
        }
    }
}
