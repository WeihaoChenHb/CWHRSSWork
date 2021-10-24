//
//  CRFeedNetProvider.swift
//  RSSWork
//
//  Created by weihao on 2021/10/23.
//

import Foundation
import Alamofire
import SWXMLHash

func requestRSSList(rssUrl url: String ,_ responseClouse : @escaping (Data) -> Void) {
    Alamofire.AF.request(url)
        .responseData { response in
            switch response.result {
            case .success(_):
                responseClouse(response.data ?? Data())
                analysisXML(xmlData: response.data ?? Data())
            case .failure(_):
                print(response.error)
            }
        }
}


func analysisXML(xmlData data : Data) -> Array<Any> {
    let xml = XMLHash.parse(data)
    
    let feedModel = CRFeedStoreModel()
    
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
                    
                }
            }
        }
        
    }
    
    return [1]
}
