//
//  ViewController.swift
//  CustomBarGraph
//
//  Created by Kenny on 4/16/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var graphView: GraphView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let dataArray = [
            DataSet(maxVal: 100, value: 90, color: .blue),
            DataSet(maxVal: 100, value: 45, color: .green),
            DataSet(maxVal: 100, value: 90, color: .red)
        ]
        graphView.dataArray = dataArray

        //uncomment to remove a barGraph and see how it redraws
        //graphView.removeBarGraph(dataSet: dataArray[0])
    }
}
