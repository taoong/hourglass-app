//
//  ActivityTrackerViewController.swift
//  Hourglass
//
//  Created by Caroline Zhou and Tao Ong on 11/30/17.
//  Copyright © 2017 Caroline Zhou and Tao Ong. All rights reserved.
//

import UIKit

class ActivityTrackerViewController: UIViewController {

//    var pieChartView: PieChartView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//
//        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
//        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0]
//
//        pieChartView = PieChartView(frame: self.view.bounds)
//        self.view.addSubview(pieChartView!)
//        setChart(dataPoints: months, values: unitsSold)
//    }
//
//    func setChart(dataPoints: [String], values: [Double]) {
//
//        var dataEntries: [ChartDataEntry] = []
//
//        for i in 0..<dataPoints.count {
//            let dataEntry1 = PieChartDataEntry(value: values[i], label: dataPoints[i])
//            dataEntries.append(dataEntry1)
//        }
//
//        let pieChartDataSet = PieChartDataSet(values: dataEntries, label: "Units Sold")
//        let pieChartData = PieChartData(dataSet: pieChartDataSet)
//        pieChartView.data = pieChartData
//
//        var colors: [UIColor] = []
//
//        for _ in 0..<dataPoints.count {
//            let red = Double(arc4random_uniform(256))
//            let green = Double(arc4random_uniform(256))
//            let blue = Double(arc4random_uniform(256))
//
//            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
//            colors.append(color)
//        }
//
//        pieChartDataSet.colors = colors
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
