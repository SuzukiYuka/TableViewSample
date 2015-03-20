//
//  ViewController.swift
//  TableViewSample
//
//  Created by nagata on 3/20/15.
//  Copyright (c) 2015 nagata. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView : UITableView!
    var nameArray = [String]()
    var imageArray = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        nameArray = ["a","b","c","d","e"]
        imageArray.append(UIImage(named: "a.png")!)
        imageArray.append(UIImage(named: "b.png")!)
        imageArray.append(UIImage(named: "c.png")!)
        imageArray.append(UIImage(named: "d.png")!)
        imageArray.append(UIImage(named: "e.png")!)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel!.text = nameArray[indexPath.row]
        cell.imageView!.image = imageArray[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {

        // deleteボタン.
        var myArchiveButton: UITableViewRowAction = UITableViewRowAction(style: .Normal, title: "delete") { (action, index) -> Void in
            tableView.editing = false
        }
        myArchiveButton.backgroundColor = UIColor.redColor()
        
        return [myArchiveButton]
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        NSLog("%d",indexPath.row)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

