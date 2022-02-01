//
//  AlertFunc.swift
//  ToDo list
//
//  Created by Kirill Drozdov on 31.01.2022.
//

import UIKit
import RealmSwift


//MARK: - Создать заметку 
extension ViewController
{

  func createNewTaskAlert()
  {

    let alertController = UIAlertController(title: "Создать задачу", message: nil, preferredStyle: .alert)
    let confirmAction = UIAlertAction(title: "Добавить", style: .default) { [self] (_) in
      if let txtField = alertController.textFields?.first, let text = txtField.text
      {

        let item = Item()
        item.task = text
        let realm = try! Realm()
        try! realm.write{
          realm.add(item)
        }
        DispatchQueue.main.async
        {
          tableView.reloadData()
        }
      }
    }

    let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { (_) in }
    alertController.addTextField { (textField) in
      textField.placeholder = "задача"
    }

    alertController.addAction(confirmAction)
    alertController.addAction(cancelAction)
    self.present(alertController, animated: true, completion: nil)
  }
}



//MARK: - Отредактировать заметку
extension ViewController
{
  func showEDITAlertWithTextField(task: String, indextElement: Int)
  {

    let alertController = UIAlertController(title: "Изменить задачу", message: nil, preferredStyle: .alert)
    let confirmAction = UIAlertAction(title: "Изменить", style: .default) { [self] (_) in
      if let txtField = alertController.textFields?.first, let text = txtField.text
      {

        let delElement = self.characters[indextElement]

        let item = Item()
        item.task = text

        let realm = try! Realm()
        try! realm.write({
          realm.add(item)
          realm.delete(delElement)
        })
        DispatchQueue.main.async
        {
          tableView.reloadData()
        }
      }
    }

    let cancelAction = UIAlertAction(title: "Оставить", style: .cancel) { (_) in }
    alertController.addTextField { (textField) in
      textField.text = task
    }

    alertController.addAction(confirmAction)
    alertController.addAction(cancelAction)
    self.present(alertController, animated: true, completion: nil)
  }
}
