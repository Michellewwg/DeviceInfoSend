//
//  ViewController.swift
//  DeviceInfoSend
//
//  Created by Michelle Rutherford on 11/1/15.
//  Copyright © 2015 Michelle Rutherford. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {



    override func viewDidAppear(animated: Bool) {
        if NSUserDefaults.standardUserDefaults().boolForKey("TermsAccepted") {
            // Terms have been accepted, proceed as normal
        } else {
 //           performSegueWithIdentifier("TermsViewController", sender: nil)
            
 //           let viewController = (self.storyboard?.instantiateViewControllerWithIdentifier("TermsViewController"))! as UIViewController
   //         self.navigationController?.setViewControllers([viewController], animated: false)
//            let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            self.performSegueWithIdentifier("TermsViewController", sender: nil)
           // self.presentViewController(vc, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func sendData(){
        
        var emailText:String = ""
        
        for detailLine in allInfoArray {
            if detailLine == " " {
                emailText = emailText + "\n"
            } else {
                emailText = emailText + detailLine + "\n"
            }
        }
        
        //let activityViewController = UIActivityViewController(activityItems: allInfoArray, applicationActivities: nil)
        let activityViewController = UIActivityViewController(activityItems: [emailText], applicationActivities: nil)
        activityViewController.setValue("Device Information Report [\(SystemServices().systemDeviceTypeFormatted)]", forKey: "Subject")
        
        
        // self.presentViewController(activityViewController, animated:true, completion:nil)
   
        
        //
        //  NOTE (mrutherf) I decided NOT to block UIActivityTypeMessage,UIActivityTypePrint,
        //
        activityViewController.excludedActivityTypes = [UIActivityTypeAirDrop,
            UIActivityTypeAddToReadingList,
            UIActivityTypeAssignToContact,
            UIActivityTypePostToTwitter,
            UIActivityTypePostToFacebook,
            UIActivityTypeOpenInIBooks,
            UIActivityTypePostToFlickr,
            UIActivityTypePostToTencentWeibo,
            UIActivityTypePostToVimeo,
            UIActivityTypeSaveToCameraRoll,
            UIActivityTypeCopyToPasteboard]
        
        
        presentViewController(activityViewController, animated: true, completion: nil)
        
        
    //    if #available(iOS 8.0, *) {
            let presentationController = activityViewController.popoverPresentationController
            presentationController?.sourceView = view
   //     }
    }
    
    
    let allInfoDictionary = SystemServices().allSystemInformation as NSDictionary
    var allInfoArray:Array<String> = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        let allInfoDictionary = SystemServices().allSystemInformation
        
        //   print(allInfoDictionary)
        
        
        
        //    for (key, value) in allInfoDictionary {
        //       allInfoArray.append("\(key): \(value)")
        //    }
        
        self.navigationItem.hidesBackButton = true;

        let ss = SystemServices()

        
        allInfoArray.append("*** HARDWARE ***")
        allInfoArray.append("System Name: \(ss.systemName)")
        allInfoArray.append("Device Type: \(ss.systemDeviceTypeFormatted)")
        allInfoArray.append("Device Model: \(ss.deviceModel)")
        allInfoArray.append("Systems Version: \(ss.systemsVersion)")
        allInfoArray.append("Uptime: \(ss.systemsUptime)")
        allInfoArray.append("Screen: \(ss.screenHeight) X \(ss.screenWidth)")
        allInfoArray.append("Brightness: \(ss.screenBrightness)")
        allInfoArray.append("Multitasking Enabled: \(ss.multitaskingEnabled)")
        allInfoArray.append("ProximitySensor Enabled: \(ss.proximitySensorEnabled)")
        allInfoArray.append("Debugger Attached: \(ss.debuggerAttached)")
        allInfoArray.append("PluggedIn: \(ss.pluggedIn)")
        allInfoArray.append("Jailbroken: \(ss.jailbroken)")
        
        
        
        allInfoArray.append(" ")
        allInfoArray.append("*** NETWORK ***")
        allInfoArray.append("Current IP Address: \(ss.currentIPAddress)")
        allInfoArray.append("Current MAC Address: \(ss.currentMACAddress)")
        allInfoArray.append("External IP Address: \(ss.externalIPAddress)")
        allInfoArray.append("Cell IP Address: \(ss.cellIPAddress)")
        allInfoArray.append("Cell MAC Address: \(ss.cellMACAddress)")
        allInfoArray.append("Cell Netmask Address: \(ss.cellNetmaskAddress)")
        allInfoArray.append("Cell Netmask Address: \(ss.cellNetmaskAddress)")
        allInfoArray.append("Cell Broadcast Addr: \(ss.cellBroadcastAddress)")
        allInfoArray.append("WiFi IP Address: \(ss.wiFiIPAddress)")
        allInfoArray.append("WiFi MAC Address: \(ss.wiFiMACAddress)")
        allInfoArray.append("WiFi Netmask Address: \(ss.wiFiNetmaskAddress)")
        allInfoArray.append("WiFi Broadcast Address: \(ss.wiFiBroadcastAddress)")
        allInfoArray.append("WiFi Router Address: \(ss.wiFiRouterAddress)")
        allInfoArray.append("Connected To WiFi: \(ss.connectedToWiFi)")
        allInfoArray.append("Connected To Cell Network: \(ss.connectedToCellNetwork)")
        
        
        allInfoArray.append(" ")
        allInfoArray.append("*** LOCALIZATION ***")
        allInfoArray.append("Country: \(ss.country)")
        allInfoArray.append("Language: \(ss.language)")
        allInfoArray.append("TimeZoneSS: \(ss.timeZoneSS)")
        allInfoArray.append("Currency: \(ss.currency) ")
        
        
        allInfoArray.append(" ")
        allInfoArray.append("*** CARRIER ***")
        allInfoArray.append("Name: \(ss.carrierName)")
        allInfoArray.append("Country: \(ss.carrierCountry)")
        allInfoArray.append("MobileCountryCode: \(ss.carrierMobileCountryCode)")
        allInfoArray.append("ISOCountryCode: \(ss.carrierISOCountryCode)")
        allInfoArray.append("MobileNetworkCode: \(ss.carrierMobileNetworkCode)")
        allInfoArray.append("AllowsVOIP: \(ss.carrierAllowsVOIP)")
        
        
        allInfoArray.append(" ")
        allInfoArray.append("*** BATTERY ***")
        allInfoArray.append("Level: \(ss.batteryLevel)")
        allInfoArray.append("Charging: \(ss.charging)")
        allInfoArray.append("Fully Charged: \(ss.fullyCharged)")
        
        
        
        allInfoArray.append(" ")
        allInfoArray.append("*** DISK ***")
        allInfoArray.append("Disk Space: \(ss.diskSpace)")
        allInfoArray.append("Free Disk Space Raw: \(ss.freeDiskSpaceinRaw)")
        allInfoArray.append("Free Disk Space Percent: \(ss.freeDiskSpaceinPercent)")
        allInfoArray.append("Used Disk Space Raw: \(ss.usedDiskSpaceinRaw)")
        allInfoArray.append("Used Disk Space Percent: \(ss.usedDiskSpaceinPercent)")
        // allInfoArray.append("longDiskSpace: \(ss.longDiskSpace)")
        //  allInfoArray.append("longFreeDiskSpace: \(ss.longFreeDiskSpace)")
        
        
        allInfoArray.append(" ")
        allInfoArray.append("*** MEMORY ***")
        allInfoArray.append("Total Memory: \(ss.totalMemory)")
        allInfoArray.append("Free Memory Raw: \(ss.freeMemoryinRaw)")
        var pct = NSString(format: "%.2f",ss.freeMemoryinPercent)
        allInfoArray.append("Free Memory Percent: \(pct)%")
        
        allInfoArray.append("Used Memory Raw: \(ss.usedMemoryinRaw)")
       // allInfoArray.append("Used Memory Percent: \(ss.usedMemoryinPercent)")
       pct = NSString(format: "%.2f",ss.usedMemoryinPercent)
         allInfoArray.append("Used Memory Percent: \(pct)%")
        allInfoArray.append("Active Memory Raw: \(ss.activeMemoryinRaw)")
        
        pct = NSString(format: "%.2f",ss.activeMemoryinPercent)
        allInfoArray.append("Active Memory Percent: \(pct)%")
        
        allInfoArray.append("Inactive Memory Raw: \(ss.inactiveMemoryinRaw)")
        pct = NSString(format: "%.2f",ss.inactiveMemoryinPercent)
        allInfoArray.append("Inactive Memory Percent: \(pct)%")
        
        allInfoArray.append("Wired Memory Raw: \(ss.wiredMemoryinRaw)")
        
        pct = NSString(format: "%.2f",ss.wiredMemoryinPercent)
        allInfoArray.append("Wired Memory Percent: \(pct)%")
        allInfoArray.append("Purgable Memory Raw: \(ss.purgableMemoryinRaw)")
        
        pct = NSString(format: "%.2f",ss.purgableMemoryinPercent)
        allInfoArray.append("Purgable Memory Percent: \(pct)% ")
        
        
        allInfoArray.append(" ")
        allInfoArray.append("*** ACCESSORY ***")
        allInfoArray.append("Accessories Attached: \(ss.accessoriesAttached)")
        allInfoArray.append("Headphones Attached: \(ss.headphonesAttached)")
        allInfoArray.append("Number Attached Accessories: \(ss.numberAttachedAccessories)")
        allInfoArray.append("Name Attached Accessories: \(ss.nameAttachedAccessories)")
        
        
        allInfoArray.append(" ")
        
        allInfoArray.append("*** PROCESSOR ***")
        allInfoArray.append("Number Processors: \(ss.numberProcessors)")
        allInfoArray.append("Number Active: \(ss.numberActiveProcessors)")
        allInfoArray.append("Speed: \(ss.processorSpeed)")
        allInfoArray.append("Bus Speed: \(ss.processorBusSpeed)")
        
        
        
        
        allInfoArray.append(" ")
        allInfoArray.append("*** UUID's ***")
        allInfoArray.append("Unique ID: \(ss.uniqueID)")
        allInfoArray.append("Device Signature: \(ss.deviceSignature)")
        allInfoArray.append("cfuuid: \(ss.cfuuid)")
        
        
        allInfoArray.append(" ")
        allInfoArray.append("*** APPLICATION ***")
        allInfoArray.append("ApplicationVVersion: \(ss.applicationVersion)")
        allInfoArray.append("ClipboardVContent: \(ss.clipboardContent)")
        
        if let procInfo = ss.processesInformation
        {
            allInfoArray.append(" ")
            allInfoArray.append("*** PROCESSES ***")
            
            for row in procInfo
            {
                let rowDict = row as! NSDictionary
                var pName = "NoName"
                var pPri = "?"
                let dateFormatter = NSDateFormatter()
                dateFormatter.calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
                dateFormatter.timeZone = NSTimeZone(name: "UTC")
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
                // let dateString = dateFormatter.stringFromDate(date)
                var pStart = "??"
                if  let name = rowDict["Name"] {
                    pName = name as! String
                }
                
                if let priority  = rowDict["Priority"] {
                    pPri = priority as! String
                }
                
                if let startDate = rowDict["StartDate"] {
                    pStart    = dateFormatter.stringFromDate(startDate as! NSDate)
                }
                
                allInfoArray.append("\(pName) Started: \(pStart) \nPri: \(pPri)")
                
                
            }
        }
        
        
        //
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allInfoArray.count
    }
    
    
    
    
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCellWithIdentifier( "ChecklistItem", forIndexPath: indexPath)
            
            
            let label = cell.viewWithTag(1000) as! UILabel
            label.text = allInfoArray[indexPath.row]
            
            
            return cell
    }
    
    //    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    //
    //        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
    //            let item = items[indexPath.row]
    //        
    //            item.toggleChecked()
    //            configureCheckmarkForCell(cell, indexPath: indexPath)
    //        }
    //        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    //    }
    
    //    
    //    func configureCheckmarkForCell(cell: UITableViewCell, indexPath: NSIndexPath) {
    //        
    //            
    //        let item = items[indexPath.row]
    //        if item.checked {
    //            cell.accessoryType = .Checkmark
    //        } else {
    //            cell.accessoryType = .None
    //        }
    //}
    //    func configureTextForCell(cell: UITableViewCell,
    //        withChecklistItem item: ChecklistItem) {
    //        let label = cell.viewWithTag(1000) as! UILabel
    //        label.text = item.text }
    //
}


