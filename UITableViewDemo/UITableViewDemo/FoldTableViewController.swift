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
    @IBOutlet weak var tableHeaderView: UIView!
    
    let categoryNameLabelList = ["父01", "父02", "父03"]
    let categoryNameLabelSonList = ["子01", "子02", "子03"]
    
    var singleCellDic: Dictionary<String, String>! = ["cellType": "Main", "isAttached": "false"]
    var tableViewCells: Array<Dictionary<String, String>>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        
        tableViewCells.append(self.singleCellDic)
        tableViewCells.append(self.singleCellDic)
        tableViewCells.append(self.singleCellDic)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewCells.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if self.tableViewCells[indexPath.row]["cellType"] == "Main" {
            let cell = tableView.dequeueReusableCellWithIdentifier("PrimeCategoryTableViewCell", forIndexPath: indexPath) as PrimeCategoryTableViewCell
            //cell.categoryNameLabel.text = categoryNameLabelList[indexPath.row]
            cell.categoryNameLabel.text = "父cell"
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("MinorCategoryTableViewCell", forIndexPath: indexPath) as MinorCategoryTableViewCell
            //cell.categoryNameLabel.text = categoryNameLabelSonList[indexPath.row]
            cell.categoryNameLabel.text = "子cell"
            return cell
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - UITableViewDelegate
    // 定义SectionHeader
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.tableHeaderView
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var path: NSIndexPath!
        if self.tableViewCells[indexPath.row]["cellType"] == "Main" {
            path = NSIndexPath(forRow: indexPath.row + 1, inSection: indexPath.section)
        }
        else {
            path =  indexPath
        }
        
        // 如果选中的cell类型
        if self.tableViewCells[indexPath.row]["cellType"] == "Main" {
            //判断是否已经展开，是则收起，否则展开
            if self.tableViewCells[indexPath.row]["isAttached"] == "true" {
                // 收起
            }
            else {
                // 展开
            }
        }
        
    }
}
