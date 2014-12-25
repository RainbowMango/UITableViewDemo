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
    
    var singleCellDic: Dictionary<String, String> = ["cellType": "Main", "isAttached": "false"]
    var tableViewCells = Array<Dictionary<String, String>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println(self.singleCellDic)
        tableViewCells.append(self.singleCellDic)
        tableViewCells.append(self.singleCellDic)
        tableViewCells.append(self.singleCellDic)
        setTableView()
        
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
            cell.categoryNameLabel.text = "父cell"
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("MinorCategoryTableViewCell", forIndexPath: indexPath) as MinorCategoryTableViewCell
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
        
        // 如果选中的cell类型为"Main"，则根据状态展开或收起菜单
        if self.tableViewCells[indexPath.row]["cellType"] == "Main" {
            //判断是否已经展开，是则收起，否则展开
            if self.tableViewCells[indexPath.row]["isAttached"] == "true" {
                // 改变状态
                var item = self.tableViewCells[indexPath.row]
                item.updateValue("false", forKey: "isAttached")
                self.tableViewCells[indexPath.row] = item
                
                // 删除下拉菜单
                self.tableViewCells.removeAtIndex(indexPath.row + 1)
                
                // 动态删除cell
                var path = NSIndexPath(forRow: indexPath.row + 1, inSection: indexPath.section)
                self.tableView.beginUpdates()
                self.tableView.deleteRowsAtIndexPaths([path], withRowAnimation: UITableViewRowAnimation.Middle)
                self.tableView.endUpdates()
            }
            else {
                // 改变状态
                var item = self.tableViewCells[indexPath.row]
                item.updateValue("true", forKey: "isAttached")
                self.tableViewCells[indexPath.row] = item
                
                // 添加下拉菜单
                var dic = ["cellType": "Sub", "isAttached": "false"]
                self.tableViewCells.insert(dic, atIndex: indexPath.row + 1)
                
                // 动态增加cell
                var path = NSIndexPath(forRow: indexPath.row + 1, inSection: indexPath.section)
                self.tableView.beginUpdates()
                self.tableView.insertRowsAtIndexPaths([path], withRowAnimation: UITableViewRowAnimation.Middle)
                self.tableView.endUpdates()
            }
        }
        
    }
}
