//
//  NoteTableViewCell.swift
//  Notes
//
//  Created by Павел Яковенко on 22.12.2022.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    private let titleNoteLabel = UILabel(text: "title", font: .robotoMedium12(), textColor: .specialBlack)
    
    private let textNoteLabel = UILabel(text: "text", font: .robotoMedium12(), textColor: .specialBlack)

    
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
        addSubview(titleNoteLabel)
        addSubview(textNoteLabel)
    }
    
    public func configure(model: NoteModel) {
        titleNoteLabel.text = model.noteName
        textNoteLabel.text = model.noteDetail
    }
}

//MARK: - setConstraints

extension NoteTableViewCell {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            titleNoteLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleNoteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            textNoteLabel.topAnchor.constraint(equalTo: titleNoteLabel.bottomAnchor, constant: 15),
            textNoteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
        
        ])

    }
}
