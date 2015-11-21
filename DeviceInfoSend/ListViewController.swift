//
//  ViewController.swift
//  DeviceInfoSend
//
//  Created by Michelle Rutherford on 11/1/15.
//  Copyright © 2015 Michelle Rutherford. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
   var items: [ChecklistItem]
    @IBAction func sendData(){
        
        let sampleArray = allInfoArray
        let activityViewController = UIActivityViewController(activityItems: sampleArray, applicationActivities: nil)
        presentViewController(activityViewController, animated: true, completion: nil)
        
    }
    
    
    let allInfoDictionary = SystemServices().allSystemInformation as NSDictionary
    var allInfoArray:Array<String> = []
    
    required init?(coder aDecoder: NSCoder) {
     items = [ChecklistItem]()
    let row0item = ChecklistItem()
    row0item.text = "Walk the dog"
    row0item.checked = false
    items.append(row0item)
    
    let row1item = ChecklistItem()
    row1item.text = "Brush my teeth"
    row1item.checked = true
    items.append(row1item)
    
    
    let row2item = ChecklistItem()
    row2item.text = "Learn iOS development"
    row2item.checked = true
    items.append(row2item)
    
    let row3item = ChecklistItem()
    row3item.text = "Soccer practice"
    row3item.checked = false
    items.append(row3item)
    
    let row4item = ChecklistItem()
    row4item.text = "Eat ice cream"
    
    row4item.checked = true
    items.append(row4item)

    super.init(coder: aDecoder)
    
    }
override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let allInfoDictionary = SystemServices().allSystemInformation
        print(allInfoDictionary)
        
        for (key, value) in allInfoDictionary {
           allInfoArray.append("\(key): \(value)")
        }
    
//
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allInfoDictionary.count
    }
    
    
   

    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier( "ChecklistItem", forIndexPath: indexPath)
        
      //  let item = allInfoArray[indexPath.row]
            let label = cell.viewWithTag(1000) as! UILabel
            label.text = allInfoArray[indexPath.row]
    
        
            
    //        configureTextForCell(cell, withChecklistItem: item)
            
            
    //        configureCheckmarkForCell(cell, indexPath: indexPath)
            return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            let item = items[indexPath.row]
        
            item.toggleChecked()
            configureCheckmarkForCell(cell, indexPath: indexPath)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    func configureCheckmarkForCell(cell: UITableViewCell, indexPath: NSIndexPath) {
        
            
        let item = items[indexPath.row]
        if item.checked {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
}
    func configureTextForCell(cell: UITableViewCell,
        withChecklistItem item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text }
}


