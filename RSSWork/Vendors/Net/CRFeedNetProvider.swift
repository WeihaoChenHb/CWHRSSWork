//
//  CRFeedNetProvider.swift
//  RSSWork
//
//  Created by weihao on 2021/10/23.
//

import Foundation
import Alamofire
import SWXMLHash

func requestRSSList(rssUrl url: String ,_ responseClouse : @escaping (CRFeedStoreModel?) -> Void) {
    Alamofire.AF.request(url)
        .responseData { response in
            switch response.result {
            case .success(_):
                let storeModel = analysisXML(xmlData: response.data)
                responseClouse(storeModel)
              
            case .failure(_):
                print(response.error)
            }
        }
}


func analysisXML(xmlData data : Data?) -> CRFeedStoreModel? {
    if data == nil {
        return nil
    }
    let xml = XMLHash.parse(data!)
    
    let feedModel = CRFeedStoreModel()
    
    var itemArray = [CRFeedStoreItemModel]()
    
    for element in xml.children {
        let channel = element["channel"]
        if channel.element != nil {
            for channelChild in channel.children {
                guard let channelElement = channelChild.element else {
                    continue
                }
                if channelElement.name == "title" {
                    feedModel.title = channelElement.text
                }
                if channelElement.name == "link" {
                    feedModel.webLink = channelElement.text
                }
                if channelElement.name == "description" {
                    feedModel.desc = channelElement.text
                }
                if channelElement.name == "image" {
                    for channelImage in channelChild.children {
                        guard let elementImage = channelImage.element else {
                            continue
                        }
                        if elementImage.name == "url" {
                            feedModel.iconUrl = elementImage.text
                        }
                    }
                }
                
                if channelElement.name == "item" {
                    let itemModel = CRFeedStoreItemModel()
                    
                    for channelItem in channelChild.children {
                        guard let elementItem = channelItem.element else {
                            continue
                        }
                        if elementItem.name == "title" {
                            itemModel.title = elementItem.text
                        }
                        if elementItem.name == "link" {
                            itemModel.link = elementItem.text
                        }
                        if elementItem.name == "author" {
                            itemModel.author = elementItem.text
                        }
                        if elementItem.name == "pubdate" {
                            itemModel.pubDate = elementItem.text
                        }
                        if elementItem.name == "description" {
                            itemModel.description = elementItem.text
                        }
                    }
                    itemArray.append(itemModel)
                }
                
            }
        }
        
        let title = element["title"]
        if title.element != nil {
            feedModel.title = title.element!.text
        }
        
        let subTitle = element["subTitle"]
        if subTitle.element != nil {
            feedModel.desc = subTitle.element!.text
        }
        
        let link = element["link"]
        if link.element != nil {
            feedModel.webLink = subTitle.element!.value(ofAttribute: "href")
        }
        
        let idLink = element["id"]
        if idLink.element != nil {
            feedModel.webLink = idLink.element!.text
        }
        
        let entrys = element["entry"]
        if entrys.element != nil {
            let itemModel = CRFeedStoreItemModel()
            for entryChild in entrys.children {
                guard let entryElemnt = entryChild.element else {
                    continue
                }
                if entryElemnt.name == "link" {
                    itemModel.link = entryElemnt.text
                }
                if entryElemnt.name == "title" {
                    itemModel.title = entryElemnt.text
                }
                if entryElemnt.name == "author" {
                    for authorChild in entryChild.children {
                        guard let authorElement = authorChild.element else {
                            continue
                        }
                        if authorElement.name == "name" {
                            itemModel.author = authorElement.text
                        }
                    }
                }
                if entryElemnt.name == "updated" {
                    itemModel.pubDate = entryElemnt.text
                }
                if entryElemnt.name == "content" {
                    itemModel.description = entryElemnt.text
                }
            }
            itemArray.append(itemModel)
        }
        
    }
    
    feedModel.items = itemArray
    
    return feedModel
}
