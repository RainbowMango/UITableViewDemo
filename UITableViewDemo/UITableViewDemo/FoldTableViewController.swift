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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setTableView() {
        self.tableView.registerClass(PrimeCategoryTableViewCell.self, forCellReuseIdentifier: "PrimeCategoryTableViewCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("PrimeCategoryTableViewCell") as PrimeCategoryTableViewCell
        
        return cell
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
        println("点击了section: \(indexPath.section)")
    }
}
