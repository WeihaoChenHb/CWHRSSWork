//
//  CRFeedStore.swift
//  RSSWork
//
//  Created by weihao on 2021/10/19.
//

import Foundation

/**
 获取默认的列表数据
 */
func defaultFeeds() -> [CRFeedStoreModel]? {
    
    guard let plistPath = Bundle.main.url(forResource: "DefaultRssList", withExtension: "plist") else {
        return nil
    }
    
    guard let data = try? Data(contentsOf: plistPath) else {
        return nil
    }
    
    let dic = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! [String : Array<[String : String]>]
    if dic != nil {
        guard let array = dic!["AllList"] else {
            return nil
        }
        var res = [CRFeedStoreModel]()
        for item in array {
            let storeModel = CRFeedStoreModel()
            storeModel.title = item["title"]
            storeModel.desc = item["desc"]
            storeModel.iconUrl = item["iconUrl"]
            storeModel.xmlLink = item["xmlLink"]
            storeModel.webLink = item["webLink"]
            res.append(storeModel)
        }
        return res

    } else {
        return nil
    }
    return nil
}
