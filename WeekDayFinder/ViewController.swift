//
//  ViewController.swift
//  WeekDayFinder
//
//  Created by Renat Mukhametov on 07.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func findDay(_ sender: UIButton) {
        let day = dateTF.text
        let month = monthTF.text
        let year = yearTF.text
        if (day == "") || (month == "") || (year == "") {
            resultLabel.text = "Заполните все поля"
            return
        }
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day!)
        dateComponents.month = Int(month!)
        dateComponents.year = Int(year!)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        dateFormatter.dateFormat = "EEEE"
        guard let date = calendar.date(from: dateComponents) else {return}
        let weekDay = dateFormatter.string(from: date)
        let capWeekDay = weekDay.capitalized
        resultLabel.text = capWeekDay
        self.view.endEditing(true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

