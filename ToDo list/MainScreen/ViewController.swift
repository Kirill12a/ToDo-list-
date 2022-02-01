//
//  ViewController.swift
//  ToDo list
//
//  Created by Kirill Drozdov on 31.01.2022.
//

import UIKit
import RealmSwift

/*
 Выполнение задачи - свайп влево
 Изменение задачи - нажатие на ячейку
 */

class ViewController: UIViewController
{

  let tableView = UITableView()
  var safeArea: UILayoutGuide!

  var characters: Results<Item>!

  override func viewDidLoad()
  {

    super.viewDidLoad()
    self.title = "ToDo"
    view.backgroundColor = UIColor(red: 189/255, green: 238/255, blue: 251/255, alpha: 100)

    let realm = try! Realm()
    self.characters = realm.objects(Item.self)
    IncrementHelper.showRatesController()

  }

  override func loadView()
  {

    super.loadView()
    safeArea = view.layoutMarginsGuide
    setupTableView()
    setNavigationBar()
  }

  func setNavigationBar()
  {

    let rightBarButton = UIBarButtonItem(title: "Добавить", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.myRightSideBarButtonItemTapped(_:)))
    self.navigationItem.rightBarButtonItem = rightBarButton
    navigationController?.navigationBar.backgroundColor = UIColor(red: 189/255, green: 238/255, blue: 251/255, alpha: 100)
  }

  @objc func myRightSideBarButtonItemTapped(_ sender:UIBarButtonItem!)
  {

    createNewTaskAlert()
  }


  func setupTableView()
  {

    view.addSubview(tableView)
    tableView.backgroundColor = UIColor(red: 189/255, green: 238/255, blue: 251/255, alpha: 100)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
    tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
}

