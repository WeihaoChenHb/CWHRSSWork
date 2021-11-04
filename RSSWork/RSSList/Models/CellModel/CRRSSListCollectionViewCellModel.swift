//
//  CRRSSListCollectionViewCellModel.swift
//  RSSWork
//
//  Created by weihao on 2021/10/23.
//

import UIKit

class CRRSSListCollectionViewCellModel {
    var model : CRFeedStoreItemModel! {
        didSet {
            titleHeight = Double((oldValue.title as NSString).boundingRect(with: CGSize(width: kScreenWidth - w_ratio(10 * 2), height: Double(Int.max)),
                                                                           options: NSStringDrawingOptions.truncatesLastVisibleLine,
                                                                           attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: CGFloat( w_ratio(15)))],
                                                                           context: nil).height)
            
            descHeight = Double((oldValue.description as NSString).boundingRect(with: CGSize(width: kScreenWidth - w_ratio(10 * 2), height: Double(Int.max)),
                                                                                options: NSStringDrawingOptions.truncatesLastVisibleLine,
                                                                                attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: CGFloat(10))],
                                                                                context:nil).height)
            
            lessHeight = titleHeight + 5 + 10 + w_ratio(5) + w_ratio(10) + w_ratio(5)
            
            greatHeight = titleHeight + 5 + descHeight + w_ratio(5) + w_ratio(10) + w_ratio(5)

        }
    }
    
    var titleHeight     : Double!,
        descHeight      : Double!,
        lessHeight      : Double!,
        greatHeight     : Double!,
        iconUrl         : String!
    
    
    var cellId : String {
        
        get {
            return "CRRSSListCollectioinViewCell"
        }
        
    }
    
//    
    
    
}
