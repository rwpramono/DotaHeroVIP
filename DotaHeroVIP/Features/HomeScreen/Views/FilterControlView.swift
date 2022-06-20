//
//  FilterControlView.swift
//  DotaHeroVIP
//
//  Created by Rachmat Wahyu Pramono on 20/06/22.
//

import Foundation
import UIKit

class FilterControlView: UIView {
    private lazy var sortControl: UIButton = {
        let view = UIButton()
        view.setTitle("Sort", for: .normal)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var filterControl: UIButton = {
        let view = UIButton()
        view.setTitle("Filter", for: .normal)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        layer.cornerRadius = 16
        addSubview(sortControl)
        addSubview(filterControl)
        
        sortControl.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        sortControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        sortControl.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        sortControl.contentHuggingPriority(for: .horizontal)
        
        filterControl.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        filterControl.leadingAnchor.constraint(equalTo: sortControl.trailingAnchor, constant: 8).isActive = true
        filterControl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        filterControl.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        filterControl.contentHuggingPriority(for: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
