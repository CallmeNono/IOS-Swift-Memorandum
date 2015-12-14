//
//  ViewController.swift
//  i5
//
//  Created by 罗懿 on 15/10/9.
//  Copyright © 2015年 罗懿. All rights reserved.
//

import UIKit
var todo : todoModel?
var todos : [todoModel] = []
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()

        todos = [todoModel(id: "1", image: "child-selected", title: "游乐园", date: dateFormString("2015-02-09")!),todoModel(id: "2", image: "phone-selected", title: "拍照", date: dateFormString("2013-4-5")!),todoModel(id: "3", image: "travel-selected", title: "旅游", date: dateFormString("2016-3-2")!),todoModel(id: "4", image: "shopping-cart-selected", title: "gouwu", date: dateFormString("2017-3-2")!),todoModel(id: "5", image: "child-selected", title: "fsd", date: dateFormString("2313-12-22")!)]
        
        navigationItem.leftBarButtonItem = editButtonItem()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    //转换日期格式
    func dateFormString(dateStr : String)-> NSDate?
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.dateFromString(dateStr)
        return date
    }
    //tableview的
    @available(iOS 2.0, *)
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return todos.count
    
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    @available(iOS 2.0, *)
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("todoCell") as UITableViewCell?
        
        var todo = todos[indexPath.row] as todoModel
        
        var image = cell?.viewWithTag(101) as! UIImageView
        
        var title = cell?.viewWithTag(102) as! UILabel
        
        var date = cell?.viewWithTag(103) as! UILabel
        
        image.image = UIImage(named: todo.image)
        
        title.text = todo.title
        
        let locale = NSLocale.currentLocale()
        let dateFormat = NSDateFormatter.dateFormatFromTemplate("yyyy-MM-dd", options: 0, locale: locale)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFormat
        date.text = dateFormatter.stringFromDate(todo.date)

        return cell!
    }
    //调整高度
    @available(iOS 2.0, *)
    internal func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 80
    }
    //重新内容
    @IBAction func close(segue: UIStoryboardSegue){
        print("close")
        tableView.reloadData()
    }

    //桥梁
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toCheck"{
        let vc = segue.destinationViewController as! fuckingg
        let indexPath = tableView.indexPathForSelectedRow
        if let index = indexPath{
            vc.todo = todos[index.row]
            }
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return editing
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let todo = todos.removeAtIndex(sourceIndexPath.row)
        todos.insert(todo, atIndex: destinationIndexPath.row)
        
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        todos.removeAtIndex(indexPath.row)
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
 
}

