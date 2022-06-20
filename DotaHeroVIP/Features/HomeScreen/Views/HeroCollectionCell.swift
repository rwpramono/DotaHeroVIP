//
//  HeroCollectionCell.swift
//  DotaHeroVIP
//
//  Created by Rachmat Wahyu Pramono on 20/06/22.
//

import Foundation
import UIKit
import Kingfisher

class HeroCollectionCell: UICollectionViewCell {
    
    static let reuseId = "HeroCollectionCell"

    private var heroImageView: UIImageView = {
       let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 24
        view.kf.indicatorType = .activity
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var heroNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        contentView.addSubview(heroImageView)
        contentView.addSubview(heroNameLabel)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        heroImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        heroImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        heroImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        heroImageView.heightAnchor.constraint(equalToConstant: 85).isActive = true
        heroImageView.widthAnchor.constraint(equalToConstant: 115).isActive = true
        
        heroNameLabel.topAnchor.constraint(equalTo: heroImageView.bottomAnchor, constant: 8).isActive = true
        heroNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        heroNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        heroNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    }
    
    func set(data: DotaHeroResponse) {
        let url = URL(string: "https://api.opendota.com\(data.img)")
        heroImageView.kf.setImage(with: url)
        heroNameLabel.text = data.localizedName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
