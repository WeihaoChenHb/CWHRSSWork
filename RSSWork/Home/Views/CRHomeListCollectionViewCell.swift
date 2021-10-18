//
//  CRHomeListCollectionViewCell.swift
//  RSSWork
//
//  Created by weihao on 2021/10/18.
//

import UIKit
import SnapKit

class CRHomeListCollectionViewCell: UICollectionViewCell {
    
    private var iconImageView   : UIImageView!,
                titleLabel      : UILabel!,
                detailLabel     : UILabel!
    
    // MARK: Initialize
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    // MARK: Setup UI
    private func setupUI() {
        iconImageView = UIImageView()
        contentView.addSubview(iconImageView)
        
        titleLabel = UILabel()
        contentView.addSubview(titleLabel)
        
        detailLabel = UILabel()
        contentView.addSubview(detailLabel)
    }
    
    
    
}
