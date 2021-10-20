//
//  UIConstants.swift
//  RSSWork
//
//  Created by CWH on 2021/10/14.
//

import UIKit

let kScreenWidth    = Double(UIScreen.main.bounds.size.width)
let kScreenHeight   = Double(UIScreen.main.bounds.size.height)

let kIPhone5_Width              = 320.0
let kIPhone5_Height             = 568.0
let kIPhone4_Height             = 480.0
let kIPhone6_Width              = 375.0
let kIPhone6_Height             = 667.0
let kIPhoneX_Width              = 375.0
let kIPhoneX_Height             = 812.0
let kIPhone11_Pro_MAX_Width     = 414.0
let kIPhone11_Pro_MAX_Height    = 896.0
let kIPhone12_Width             = 390.0
let kIPhone12_Height            = 844.0
let kIPhone12_Min_Width         = 360.0
let kIPhone12_Min_Height        = 780.0
let kIPhone12_Pro_MAX_Width     = 428.0
let kIPhone12_Pro_MAX_Height    = 926.0

let kNormalWidthRatio           = kScreenWidth / kIPhone6_Width
let kNormalHeightRatio          = kScreenHeight / kIPhone6_Height

func w_ratio(_ width : Double) -> Double {
    return width * kNormalWidthRatio
}

func h_ratio(_ height : Double) -> Double {
    return height * kNormalHeightRatio
}

