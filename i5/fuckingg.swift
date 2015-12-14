//
//  fuckingg.swift
//  i5
//
//  Created by 罗懿 on 15/10/10.
//  Copyright © 2015年 罗懿. All rights reserved.
//

import UIKit

class fuckingg: UIViewController {
    var todo : todoModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        if(todo != nil){
            if(todo?.image == "child-selected"){ren.selected = true}
            else if(todo?.image == "phone-selected"){dian.selected = true}
            else if(todo?.image == "shopping-cart-selected"){che.selected = true}
            else if(todo?.image == "travel-selected"){fei.selected = true}
            
            textt.text = todo?.title
            datep.date = (todo?.date)!
            
            
        }
        else {
            ren.selected = true
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //重置
    func reset(){
        ren.selected = false
        dian.selected = false
        che.selected = false
        fei.selected = false
    }

    @IBOutlet weak var ren: UIButton!
    @IBOutlet weak var dian: UIButton!
    @IBOutlet weak var che: UIButton!
    
    @IBOutlet weak var fei: UIButton!

    @IBAction func renb(sender: AnyObject) {
        reset()
        ren.selected = true
    }
    @IBAction func dianb(sender: AnyObject) {
        reset()
        dian.selected = true
    }
    @IBAction func cheb(sender: AnyObject) {
        reset()
        che.selected = true
    }
    @IBAction func feib(sender: AnyObject) {
        reset()
        fei.selected = true
    }
    @IBAction func queb(sender: AnyObject) {
        
        var image = ""
        if(ren.selected == true){image = "child-selected"}
        if(fei.selected == true){image = "travel-selected"}
        if(che.selected == true){image = "shopping-cart-selected"}
        if(dian.selected == true){image = "phone-selected"}
        
        
        if(todo==nil){
        let uuid = NSUUID().UUIDString
        todo = todoModel(id: uuid, image: image, title: textt.text!, date: datep.date)
        todos.append(todo!)
        }
        else{
            todo?.title = textt.text!
            todo?.image = image
            todo?.date = datep.date
        }
        
        
        
        
    }
    @IBOutlet weak var datep: UIDatePicker!
    @IBOutlet weak var textt: UITextField!
    
    
    func dateFormString(dateStr:String)->NSDate?{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.dateFromString(dateStr)
        return date
    
    }
}
