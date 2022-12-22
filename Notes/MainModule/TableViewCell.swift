//
//  TableViewCell.swift
//  Notes
//
//  Created by Павел Яковенко on 22.12.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
//        backgroundColor = .red
    }
}

//MARK: - setConstraints

extension TableViewCell {
    
    private func setConstraints() {
        
    }
}
