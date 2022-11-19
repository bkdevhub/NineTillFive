//
//  ViewController.swift
//  NineTillFive
//
//  Created by Björn Viehmann on 05.10.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var startTimePicker: UIDatePicker!
    @IBOutlet var workingHoursPicker: UIDatePicker!
    @IBOutlet var breaksDurationPicker: UIDatePicker!
    
    
    @IBAction func setStartTimeButtonPressed(_ sender: Any) {
        setStartTime()
    }
    
    @IBAction func setWorkingHoursButtonPressed(_ sender: Any) {
        setWorkingHours()
    }
    
    @IBSegueAction func startWorkdaySegue(_ coder: NSCoder, sender: Any?) -> WorkdayTableViewController? {
        setBreakTime()
        return WorkdayTableViewController(coder: coder, workday: startWorkday())
    }
    
    
    var workdayBuilder: WorkdayBuilder = ConcreteWorkdayBuilder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setStartTime() {
        workdayBuilder.startedAt = startTimePicker.date
    }
    
    private func setWorkingHours() {
        let hour = Calendar.current.component(.hour, from: workingHoursPicker.date)
        let minute = Calendar.current.component(.minute, from: workingHoursPicker.date)
        
        workdayBuilder.workingHours = TimePart(hours: hour, minutes: minute)
    }
    
    private func setBreakTime() {
        let hour = Calendar.current.component(.hour, from: breaksDurationPicker.date)
        let minute = Calendar.current.component(.minute, from: breaksDurationPicker.date)
        
        workdayBuilder.breaksDuration = TimePart(hours: hour, minutes: minute)
    }
    
    private func startWorkday() -> Workday {
        return workdayBuilder.build()!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Next" {
            let controller = segue.destination as! ViewController
            controller.workdayBuilder = self.workdayBuilder
        }
    }
}

