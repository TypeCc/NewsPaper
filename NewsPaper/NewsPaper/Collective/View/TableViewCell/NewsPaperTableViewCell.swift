//
//  NewsPaperTableViewCell.swift
//  NewsPaper
//
//  Created by serif mete on 16.03.2023.
//

import UIKit
import SnapKit

final class NewsPaperTableViewCell: UITableViewCell {
    //MARK: - My Variable
    private let imagesView: UIImageView = UIImageView()
    private let label: UILabel = UILabel()
    enum Identifer: String {
        case Id = "cell"
    }

    //MARK: - İNİT
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - My Func
    
    func Label(model: Article) {
        label.text = model.title
        imagesView.image = UIImage(named: "egg")
    }
    
    private func configure() {
        addSubview(imagesView)
        addSubview(label)
        label.font = .boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        makelabel()
        makeİmage()
        
    }
}

//MARK: - SnapKit Make Variable
extension NewsPaperTableViewCell {
    
    private func makelabel() {
        label.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.80)
            make.height.equalTo(80)
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview()
            make.left.equalToSuperview().offset(70)
            
        }
    }
    
    private func makeİmage() {
        imagesView.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.10)
            make.height.equalTo(50)
            make.left.equalToSuperview().offset(5)
            make.top.equalToSuperview().offset(25)
            make.leading.equalToSuperview()
        }
    }
}
