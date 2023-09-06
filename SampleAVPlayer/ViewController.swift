//
//  ViewController.swift
//  SampleAVPlayer
//
//  Created by PT Phincon on 04/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    let simplePieChartView = SimplePieChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        simplePieChartView.frame = CGRect(
            x: view.frame.size.width / 2, y: view.frame.size.width / 2,
            width: 50, height: 50
        )
        simplePieChartView.setValue(value: 80)
        view.addSubview(simplePieChartView)
    }
    
   
}
