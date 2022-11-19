//
//  WorkdayTableViewController.swift
//  NineTillFive
//
//  Created by Björn Viehmann on 19.11.22.
//

import UIKit

class WorkdayTableViewController: UITableViewController {
    
    @IBOutlet var endsAtTimeDetailLabel: UILabel!
    @IBOutlet var endsAtDayDetailLabel: UILabel!
    
    @IBOutlet var startedAtDetailLabel: UILabel!
    @IBOutlet var countdownDetailLabel: UILabel!
    
    @IBOutlet var workingHoursDetailLabel: UILabel!
    @IBOutlet var breaksDurationDetailLabel: UILabel!
    
    var workday: Workday
    
    required init?(coder: NSCoder, workday: Workday) {
        self.workday = workday
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareStaticTableView()
    }
    
    private func prepareStaticTableView() {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "EEEE, MMM d, yyyy"
        
        endsAtDayDetailLabel.text = "\(dateformatter.string(from: workday.endsAt))"
        countdownDetailLabel.text = " - \(workday.remainingTimeUntilEnd)"
        
        dateformatter.dateFormat = "hh:mm"
        endsAtTimeDetailLabel.text = "\(dateformatter.string(from: workday.endsAt))"
        
        
        dateformatter.dateFormat = "EEEE, MMM d, yyyy hh:mm"
        startedAtDetailLabel.text = "\(dateformatter.string(from: workday.startedAt))"
        workingHoursDetailLabel.text = "\(workday.workingHours)"
        breaksDurationDetailLabel.text = "\(workday.breaksDuration)"
    }    
}
