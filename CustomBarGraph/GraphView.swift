//
//  GraphView.swift
//  CustomBarGraph
//
//  Created by Kenny on 4/16/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import UIKit

@IBDesignable
class GraphView: UIView {
    
    var dataArray: [DataSet] {
        didSet {
            setupSubviews()
        }
    }

    private var barGraphArray: [BarView] = []

    init(frame: CGRect, dataArray: [DataSet] = []) {
        self.dataArray = dataArray
        super.init(frame: frame)
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        dataArray = []
        super.init(coder: coder)
        setupSubviews()
    }

    private func setupSubviews() {
        backgroundColor = .clear

        var barXOffset: CGFloat {
            let padding:CGFloat = 8
            let offset = bounds.width / CGFloat(dataArray.count) + padding
            switch offset {
            case let x where x>40:
                return 40 + padding
            default: return offset
            }
        }

        var barYOffset: CGFloat {
            switch bounds.height {
            case 0..<150:
                return bounds.height
            default: return 150
            }
        }
        for (index, dataSet) in dataArray.enumerated() {
            let rect = CGRect(x: barXOffset * CGFloat(index),
                              y: barYOffset,
                              width: bounds.width / CGFloat(dataArray.count),
                              height: bounds.height)
            let barView = BarView(frame: rect,
                                  dataSet: dataSet)
            barGraphArray.append(barView)
            addSubview(barView)
        }

    }

    ///remove the BarView associated with the corresponding DataSet
    func removeBarGraph(dataSet: DataSet) {
        guard let index = dataArray.firstIndex(of: dataSet) else { return }
        //remove all barGraphs from the superview
        for barGraph in barGraphArray {
            barGraph.removeFromSuperview()
        }
        barGraphArray = []
        //redraw bargraphs
        dataArray.remove(at: index)
    }

}
