//
//  CRRSSListCollectionViewCellModel.swift
//  RSSWork
//
//  Created by weihao on 2021/10/23.
//

import Foundation

class CRRSSListCollectionViewCellModel {
    var model : CRFeedStoreItemModel!
    
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
    
    
}
