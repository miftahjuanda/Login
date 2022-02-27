//
//  ItemProfileComponent.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 21/02/22.
//

import UIKit

class ItemProfileComponent: UIView {
    
    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()
    
    private var colonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ": "
        label.numberOfLines = 1
        label.textColor = .black
        return label
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Label"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    var contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Labell"
        label.numberOfLines = 0
        label.textColor = .lightGray
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(colonLabel)
        stackView.addArrangedSubview(contentLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalToConstant: 90),
            colonLabel.widthAnchor.constraint(equalToConstant: 20),
            
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
}
