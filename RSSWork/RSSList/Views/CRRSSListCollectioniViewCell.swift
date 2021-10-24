//
//  CRRSSListCollectioniviewCell.swift
//  RSSWork
//
//  Created by weihao on 2021/10/23.
//

import UIKit
import SnapKit
import Kingfisher

class CRRSSListCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    private var titleLabel      : UILabel!,
                descLabel       : UILabel!,
                logoImageView   : UIImageView!,
                dateLabel       : UILabel!,
                authorLabel     : UILabel!,
                descMoreBtn     : UIButton!,
                cellModel       : CRRSSListCollectionViewCellModel!
    
    
    // MARK: Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup UI
    private func setupUI() {
        titleLabel = UILabel()
        contentView.addSubview(titleLabel)
        
        descLabel = UILabel()
        descLabel.numberOfLines = 0
        descLabel.font = UIFont.systemFont(ofSize: 10)
        contentView.addSubview(descLabel)
        
        logoImageView = UIImageView()
        contentView.addSubview(logoImageView)
        
        dateLabel = UILabel()
        contentView.addSubview(dateLabel)
        
        authorLabel = UILabel()
        contentView.addSubview(authorLabel)
        
        descMoreBtn = UIButton(type: .custom)
        contentView.addSubview(descMoreBtn)
        descMoreBtn.addTarget(self, action: #selector(self.descShowMoreAction), for: .touchUpInside)
        
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.top.equalTo(contentView).offset(w_ratio(10))
            make.right.equalTo(contentView).offset(w_ratio(-10))
            make.height.equalTo(0)
        }
        
        descLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo((titleLabel))
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.height.equalTo(w_ratio(10))
        }
        
        logoImageView.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.top.equalTo(descLabel.snp.bottom).offset(w_ratio(10))
            make.size.equalTo(CGSize(width: w_ratio(10), height: w_ratio(10)))
        }
        
        authorLabel.snp.makeConstraints { (make) in
            make.left.equalTo(logoImageView.snp.right).offset(w_ratio(5))
            make.top.equalTo(logoImageView)
            make.height.equalTo(w_ratio(10))
            make.right.equalTo(dateLabel.snp.left)
        }
                
        dateLabel.snp.makeConstraints { (make) in
            make.left.equalTo(authorLabel.snp.right).offset(w_ratio(5))
            make.top.height.equalTo(authorLabel)
            make.right.equalTo(contentView).offset(w_ratio(-5))
        }
        
    }
    
    override func updateConstraints() {
        titleLabel.snp.updateConstraints { (make) in
            make.height.equalTo(cellModel.titleHeight)
        }
        
        descLabel.snp.updateConstraints { (make) in
            make.height.equalTo(self.descMoreBtn.isSelected ? cellModel.descHeight : w_ratio(10))
        }
    }
    
    // MARK: Public
    func fillData(cellData data : CRRSSListCollectionViewCellModel) {
        cellModel = data
        
        titleLabel.text = cellModel.model.title
        descLabel.text = cellModel.model.description
        
        let placeHoldImage = UIImage(named: logoPlaceHoldImageName)
        logoImageView.kf.setImage(with: URL(string: cellModel.iconUrl), placeholder: placeHoldImage, options: nil, completionHandler: nil)
        
        authorLabel.text = cellModel.model.author
        dateLabel.text = cellModel.model.pubDate
        
        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()
        
    }
    
    // MARK: Target
    @objc private func descShowMoreAction() {
        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()
    }
    
    static var cellId : String {
        
        get {
            return "CRRSSListCollectionViewCell"
        }
        
    }
    
    
    
}
