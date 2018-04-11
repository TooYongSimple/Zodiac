//
//  TodoListViewController.swift
//  Zodiac
//
//  Created by zhangjianyun on 2018/4/11.
//  Copyright © 2018年 com.taihejiacheng. All rights reserved.
//

import UIKit

var dataArr: [TodoModel] = []
var findArr: [TodoModel] = []


class TodoListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let model1 = TodoModel.init(id: "0", image: "child-selected", title: "去游乐园带孩子玩摩天轮", date: stringToDate(str: "2018-04-02"))
        let model2 = TodoModel.init(id: "1", image: "phone-selected", title: "给大表妹打电话", date: stringToDate(str: "2019-05-13"))
        let model3 = TodoModel.init(id: "2", image: "shopping-cart-selected", title: "去超市买辣条", date: stringToDate(str: "2020-11-11"))
        let model4 = TodoModel.init(id: "3", image: "travel-selected", title: "去三亚度蜜月", date: stringToDate(str: "2020-01-03"))
        dataArr = [model1,model2,model3,model4]
        
        findArr = dataArr
        navigationItem.leftBarButtonItem = editButtonItem
    }

    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return findArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoCell
        
        let model = findArr[indexPath.row]
        cell.head.image = UIImage.init(named: model.image)
        cell.name.text = model.title
        cell.time.text = dateToString(date: model.date)
        
        return cell
    }
    
    //MARK: - Edit
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            dataArr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    // MARK: - MoveCell
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return tableView.isEditing
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todo = dataArr.remove(at: sourceIndexPath.row)
        dataArr.insert(todo, at: destinationIndexPath.row)
    }
    
    // MARK: - Search
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            findArr = dataArr
        }
        else {
            findArr = []
            for model in dataArr {
                if model.title.contains(searchText) {
                    
                    findArr.append(model)
                }
            }
        }
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! ToDoDetailViewController
        
        if segue.identifier == "add" {
            vc.title = "Add Todo List"
        }
        if segue.identifier == "item" {
            vc.title = "Eidt"
            let indexPath = self.tableView.indexPathForSelectedRow
            if indexPath != nil {
                vc.model = dataArr[(indexPath?.row)!]
            }
        }
    }
    
    @IBAction func close(segue:UIStoryboardSegue) {
        
        self.tableView.reloadData()
    }

}
