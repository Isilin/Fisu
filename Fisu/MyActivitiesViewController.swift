//
//  MyActivitiesViewController.swift
//  Fisu
//
//  Created by vm mac on 21/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import UIKit
import CoreData

class MyActivitiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        //Adjust TableView to the top of the screen
        self.automaticallyAdjustsScrollViewInsets = false
        // Do any additional setup after loading the view.

        self.myActivities = Event.fetchMyActivities()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var myTableView: UITableView!

    var myActivities: [Event] = [Event]()

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myActivities.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myActivityCell", forIndexPath: indexPath) as! MyActivityTableViewCell
        cell.activity = self.myActivities[indexPath.row]
        cell.myTitle.text = cell.activity.name
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextView = segue.destinationViewController as! ActivityDetailViewController
        let activityCell = sender as! ActivityTableViewCell
        nextView.activity = activityCell.activity
    }

    override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
    }

}
