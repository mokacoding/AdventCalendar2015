//
//  PieViewController.swift
//  PiesAndBars
//
//  Created by Giovanni on 23/11/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import Charts

class PieViewController: UIViewController {

    // Using implicitly unwrapped optional just becasue I'm lazy
    var chartView: PieChartView!
    let pizzaSales = PizzaSales.sales()

    override func viewDidLoad() {
        super.viewDidLoad()

        chartView = PieChartView(frame: view.frame)
        chartView.descriptionText = ""
        view.addSubview(chartView)

        let xValues = pizzaSales.enumerate().map { index, element in
            return element.pizzaName
        }

        let yValues = pizzaSales.enumerate().map { index, element in
            return ChartDataEntry(value: Double(element.soldQuantity), xIndex: index)
        }

        let dataSet = PieChartDataSet(yVals: yValues, label: "Pizza Sales")
        dataSet.sliceSpace = 2.0
        dataSet.colors = ChartColorTemplates.colorful()

        let data = PieChartData(xVals: xValues, dataSet: dataSet)

        chartView.data = data
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        chartView.animate(yAxisDuration: 1, easingOption: ChartEasingOption.EaseOutSine)
    }
}