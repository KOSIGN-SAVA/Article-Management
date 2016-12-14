//
//  ApiProtocol.swift
//  MVP
//
//  Created by Vansa Pha on 12/13/16.
//  Copyright © 2016 Vansa Pha. All rights reserved.
//

import Foundation

@objc protocol ApiProtocol {
    @objc optional func success(data:[String:AnyObject])
    @objc optional func error(data:NSError)
    @objc optional func response(data:HTTPURLResponse)
}
