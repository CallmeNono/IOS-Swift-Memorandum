//
//  todoModel.swift
//  i5
//
//  Created by 罗懿 on 15/10/10.
//  Copyright © 2015年 罗懿. All rights reserved.
//

import UIKit

class todoModel: NSObject {
    
    var id : String
    var image : String
    var title : String
    var date : NSDate
    
    init(id:String,image:String,title:String,date:NSDate) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
    
}
