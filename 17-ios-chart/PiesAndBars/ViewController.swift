//
//  ViewController.swift
//  PiesAndBars
//
//  Created by Giovanni on 19/11/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    // Using implicitly unwrapped optional just becasue I'm lazy
    var chartView: BarChartView!

    let pizzaSales = PizzaSales.sales()

    override func viewDidLoad() {
        super.viewDidLoad()

        chartView = BarChartView(frame: view.frame)
        chartView.drawValueAboveBarEnabled = false
        chartView.drawGridBackgroundEnabled = false
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.rightAxis.enabled = false
        chartView.descriptionText = ""

        view.addSubview(chartView)

        let xValues = pizzaSales.enumerate().map { index, element in
            return element.pizzaName
        }

        let yValues = pizzaSales.enumerate().map { index, element in
            return BarChartDataEntry(value: Double(element.soldQuantity), xIndex: index)
        }

        let dataSet = BarChartDataSet(yVals: yValues, label: "Pizzas Sales")
        dataSet.colors = ChartColorTemplates.colorful()
        dataSet.drawValuesEnabled = false

        let data = BarChartData(xVals: xValues, dataSet: dataSet)

        chartView.data = data
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        chartView.animate(yAxisDuration: 1, easingOption: ChartEasingOption.EaseOutSine)
    }
}
