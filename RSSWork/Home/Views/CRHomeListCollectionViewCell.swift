//
//  CRHomeListCollectionViewCell.swift
//  RSSWork
//
//  Created by weihao on 2021/10/18.
//

import UIKit
import SnapKit
import Kingfisher

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
        iconImageView.backgroundColor = .yellow
        contentView.addSubview(iconImageView)
        
        titleLabel = UILabel()
        contentView.addSubview(titleLabel)
        
        detailLabel = UILabel()
        contentView.addSubview(detailLabel)
        
        
        iconImageView.snp.makeConstraints { (make) in
            make.left.top.equalTo(contentView).offset(w_ratio(10))
            make.bottom.equalTo(contentView).offset(w_ratio(-10))
            make.width.equalTo(iconImageView.snp.height)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconImageView.snp.right).offset(w_ratio(10))
            make.top.equalTo(iconImageView).offset(w_ratio(5))
            make.right.equalTo(contentView).offset(w_ratio(-10))
            make.height.equalTo(w_ratio(15))
        }
        
        
        detailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(w_ratio(10))
            make.bottom.equalTo(iconImageView).offset(w_ratio(-5))
            make.left.right.equalTo(titleLabel)
        }
    }
    
    
    func fillData(withStoreModel storeModel : CRFeedStoreModel) {
        titleLabel.text = storeModel.title
        detailLabel.text = storeModel.desc
        iconImageView.kf.setImage(with: URL(string: storeModel.iconUrl))
    }
    
    
    
}
