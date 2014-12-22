//
//  FoldTableViewController.swift
//  UITableViewDemo
//
//  Created by ruby on 14-12-22.
//  Copyright (c) 2014年 ruby. All rights reserved.
//

import UIKit

class FoldTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    // table view 数据
    var tableViewData: Dictionary<String, [String]> = ["Section01": ["Section01-01", "Section01-02", "Section01-03", "Section01-04"],
                                                       "Section02": ["Section02-01", "Section02-02", "Section02-03", "Section02-04"],
                                                       "Section03": ["Section03-01", "Section03-02", "Section03-03", "Section03-04"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setTableView() {
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "commonCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("commonCell") as UITableViewCell
        switch indexPath.section{
        case 0:
            cell.textLabel.text = "hello"
        case 1:
            cell.textLabel.text = "hello"
        case 2:
            cell.textLabel.text = "hello"
        default:
            println("No such section")
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Section01"
        case 1:
            return "Section02"
        case 2:
            return "Section03"
        default:
            return "Unkonwn Section"
        }
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Section01 Footer"
        case 1:
            return "Section02 Footer"
        case 2:
            return "Section03 Footer"
        default:
            return "Unkonwn Section Footer"
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    // MARK: - UITableViewDelegate
//    // 定义SectionHeader
//    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return UIView()
//    }
}
