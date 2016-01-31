//
//  TermsViewController.swift
//  DeviceInfoSend
//
//  Created by Michelle Rutherford on 1/26/16.
//  Copyright © 2016 Michelle Rutherford. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func termsAccepted(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "TermsAccepted")
        self.performSegueWithIdentifier("ListViewController", sender: nil)
    }
    
    @IBAction func termsNotAccepted(sender: UIButton) {
        let quitAlert = UIAlertController(title: "Accept Terms", message: "You must agree to the terms and conditions before you can use this application.", preferredStyle: UIAlertControllerStyle.Alert)
        
        quitAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
           // abort()
        }))
        
//        quitAlert.addAction(UIAlertAction(title: "No Wait", style: .Default, handler: nil))
//        
        presentViewController(quitAlert, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
