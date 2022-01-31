//
//  ExtensionTableView.swift
//  ToDo list
//
//  Created by Kirill Drozdov on 31.01.2022.
//

import UIKit
import RealmSwift

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate
{
  //MARK: - Тип-удалить
  func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle
  {
    return .delete
  }

//MARK:  - Нажатие на ячейку
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
  {
    let item = self.characters[indexPath.row]

    showEDITAlertWithTextField(task: characters[indexPath.row].task, indextElement: indexPath.row)
    print(characters[indexPath.row])
    print(indexPath.row)
  }

  //MARK:  - Кастомный свайп
  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
  -> UISwipeActionsConfiguration?
  {

    let deleteAction = UIContextualAction(style: .destructive, title: nil)
    { [self] (_, _, completionHandler) in

      let realm = try! Realm()
      let item = self.characters[indexPath.row]
      print(item)
      try! realm.write({
        realm.delete(item)
      })
//      tableView.beginUpdates()
//      characters.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
    deleteAction.backgroundColor = .systemBlue
    deleteAction.image = UIImage(named: "done")
    let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
    return configuration
  }
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource
{

  //MARK: - Колво ячеек
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return characters.count
  }

  //MARK: - Заполнение ячейки и настройка
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//    let item = self.characters[indexPath.row]
//    cell.textLabel?.text = item.task
    cell.layer.borderWidth = CGFloat(3)
    cell.layer.borderColor = UIColor(red: 189/255, green: 238/255, blue: 251/255, alpha: 100).cgColor
    cell.textLabel?.text = characters[indexPath.row].task
    cell.clipsToBounds = true
    cell.layer.cornerRadius = 20
    cell.selectionStyle = .none
    return cell
  }

  //MARK: - Высота ячейки
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
  }
}
