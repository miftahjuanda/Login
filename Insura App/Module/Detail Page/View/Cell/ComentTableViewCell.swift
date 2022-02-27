//
//  ComentTableViewCell.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 21/02/22.
//

import UIKit

class ComentTableViewCell: UITableViewCell {

    static let identifier = "ComentTableViewCell"
    
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
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUICell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(data: DetailCommentModelElement?) {
        authorLabel.text = data?.name
        contentLabel.text = data?.body
    }
    
    private func setUICell() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(authorLabel)
        contentView.addSubview(contentLabel)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),
            
            contentLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor),
            contentLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor),
            
        ])
    }


}
