//
//  ViewController.swift
//  DeviceInfoSend
//
//  Created by Michelle Rutherford on 11/1/15.
//  Copyright © 2015 Michelle Rutherford. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let allInfoDictionary = SystemServices().allSystemInformation
        print(allInfoDictionary)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

