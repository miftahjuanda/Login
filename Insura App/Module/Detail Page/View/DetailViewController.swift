//
//  DetailViewController.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 21/02/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var detailView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        return view
    }()
    
    private var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Label"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private var contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Label"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        return label
    }()
    
    private var comentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "All Coment"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private var comentTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.estimatedRowHeight = 100
        table.rowHeight = UITableView.automaticDimension
        table.backgroundColor = .white
        table.register(ComentTableViewCell.self, forCellReuseIdentifier: ComentTableViewCell.identifier)
        return table
    }()
    
    var detailViewModel: DetailViewModel?
    var detailCoordinator: DetailCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail Post"
        view.backgroundColor = .white
        
        comentTableView.delegate = self
        comentTableView.dataSource = self
        // Do any additional setup after loading the view.
        setItemUI()
        self.setDataItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setItemUI() {
        view.addSubview(detailView)
        detailView.addSubview(authorLabel)
        detailView.addSubview(contentLabel)
        
        view.addSubview(comentLabel)
        view.addSubview(comentTableView)
        
        let margin = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: margin.topAnchor, constant: 20),
            detailView.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: 20),
            detailView.trailingAnchor.constraint(equalTo: margin.trailingAnchor, constant: -20),
            
            authorLabel.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 15),
            authorLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 15),
            authorLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -15),
            
            contentLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 15),
            contentLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 15),
            contentLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -15),
            contentLabel.bottomAnchor.constraint(equalTo: detailView.bottomAnchor, constant: -15),
            
            
            comentLabel.topAnchor.constraint(equalTo: detailView.bottomAnchor, constant: 20),
            comentLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: 30),
            comentLabel.trailingAnchor.constraint(equalTo: margin.trailingAnchor, constant: -20),
            
            comentTableView.topAnchor.constraint(equalTo: comentLabel.bottomAnchor, constant: 15),
            comentTableView.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: 35),
            comentTableView.trailingAnchor.constraint(equalTo: margin.trailingAnchor, constant: -35),
            comentTableView.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -15),
            
        ])
    }
    
    private func setDataItem() {
        detailViewModel?.resultDetail = { [weak self] in
            DispatchQueue.main.async {
                let data = self?.detailViewModel?.model
                self?.authorLabel.text = data?.title
                self?.contentLabel.text = data?.body
            }
        }
        
        
        detailViewModel?.resultComment = {
            DispatchQueue.main.async {
                self.comentTableView.reloadData()
            }
        }
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailViewModel?.modelComment?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ComentTableViewCell.identifier, for: indexPath) as! ComentTableViewCell
        if let data = detailViewModel?.modelComment?[indexPath.row] {
            cell.setData(data: data)
        }
        return cell
    }
    
    
}
