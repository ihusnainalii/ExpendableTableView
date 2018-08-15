//
//  ViewController.swift
//  expendedView
//
//  Created by Vikash Kumar on 16/08/18.
//  Copyright © 2018 Vikash Kumar. All rights reserved.
//

import UIKit


struct cellData  {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}
class TableViewController: UITableViewController {
 var tableViewData = [cellData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewData  = [cellData(opened: false, title: "Title", sectionData: ["Cell1","Cell2","Cell3","Cell4"]),
                          cellData(opened: false, title: "Title", sectionData: ["Cell1","Cell2","Cell3"]),
                          cellData(opened: false, title: "Title", sectionData: ["Cell1","Cell2","Cell3"]),
                          cellData(opened: false, title: "Title", sectionData: ["Cell1","Cell2","Cell3"])]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
       return tableViewData.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  dataIndex = indexPath.row - 1
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
            cell.textLabel?.text =  tableViewData[indexPath.section].title + "\(indexPath.section)"
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex]
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].opened ==  true {
                tableViewData[indexPath.section].opened  = false
                let sections = IndexSet.init(integer:indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }else{
                tableViewData[indexPath.section].opened  = true
                let sections = IndexSet.init(integer:indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}

