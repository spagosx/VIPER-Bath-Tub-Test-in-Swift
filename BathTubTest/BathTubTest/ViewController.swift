//
//  ViewController.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 18/12/14.
//  Copyright (c) 2014 spagosx. All rights reserved.
//

import UIKit

class ViewController: UIViewController, View {
    
    var presenter: Presenter! = nil
    @IBOutlet var waterLevelLabel: UILabel?
    @IBOutlet var coldTapButton: UIButton?
    @IBOutlet var hotTapButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    func updateWaterLevel(level: String) {
        waterLevelLabel?.text = level
    }
    
    @IBAction func coldTapButtonDidReceiveTap() {
        presenter.coldWaterTapDidReceiveTap()
    }
    
    @IBAction func hotTapButtonDidReceiveTap() {
        presenter.hotWaterTapDidReceiveTap()
    }
    
}


