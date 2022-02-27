//
//  HomeTableViewCell.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 21/02/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    static let identifier = "HomeTableViewCell"
    
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
    
    private var iconImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "message")
        image.tintColor = .blue
        return image
    }()
    
    private var comentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .blue
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUICell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30))
        contentView.clipsToBounds = false
    }
    
    func setData(data: HomeModelElement) {
        authorLabel.text = data.title
        contentLabel.text = data.body
    }
    
    func setDataComment(data: Int?) {
        comentLabel.text = "\(data ?? 0)"
    }
    
    private func setUICell() {
        
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.borderWidth = 0.5
        contentView.backgroundColor = .white
        
        contentView.addSubview(authorLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(iconImage)
        contentView.addSubview(comentLabel)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 15),
            authorLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 15),
            authorLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -15),
            
            contentLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 15),
            contentLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 15),
            contentLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -15),
            
            iconImage.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 15),
            iconImage.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 15),
            iconImage.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: -15),
            iconImage.heightAnchor.constraint(equalToConstant: 20),
            iconImage.widthAnchor.constraint(equalToConstant: 20),
            
            comentLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -15),
            comentLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 15),
            comentLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: -15),
        ])
    }

}
