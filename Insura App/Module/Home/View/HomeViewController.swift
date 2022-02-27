//
//  HomeViewController.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 21/02/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var postTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.estimatedRowHeight = 100
        table.rowHeight = UITableView.automaticDimension
        table.backgroundColor = .white
        table.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        return table
    }()
    
    private var limit = 10
    var homeCoordinator: HomeCoordinator?
    var homeViewModel = HomeViewModel(provider: NetworkProvider())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .white
        
        postTableView.delegate = self
        postTableView.dataSource = self
        
        setItemUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tabBarController?.tabBar.isHidden = false
    }
    
    private func setItemUI() {
        view.addSubview(postTableView)
        NSLayoutConstraint.activate([
            postTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            postTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            postTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        homeViewModel.resultData = {
            DispatchQueue.main.async {
                self.postTableView.reloadData()
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        if let data = homeViewModel.model?[indexPath.row] {
            cell.setData(data: data)
            
            homeViewModel.fetchCountComment(id: data.id ?? 0, completion: { id in
                DispatchQueue.main.async {
                    cell.setDataComment(data: id)
                }
            })
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        homeCoordinator?.startToDetail(id: homeViewModel.model?[indexPath.row].id ?? 0)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastIndex = (homeViewModel.model?.count ?? 0) - 1
        
        if indexPath.row == lastIndex {
            limit += 10
            
            homeViewModel.fetchData(limit: limit)
        }
    }
    
}
