//
//  Incerment.swift
//  ToDo list
//
//  Created by Kirill Drozdov on 01.02.2022.
//


import Foundation
import RealmSwift


  //MARK: - Какой по счету раз юзер зашел в приложение
class IncrementHelper
{

  class func incrementCount()
  {
    let count = UserDefaults.standard.integer(forKey: "run_count")
    if count <= 1
    {

      UserDefaults.standard.set(count + 1, forKey: "run_count")
      UserDefaults.standard.synchronize()
    }
  }



//MARK: - Вставка в массив значения по умолчанию
  class func showRatesController()
  {

    let count = UserDefaults.standard.integer(forKey: "run_count")
    if count == 1
    {

      let item = Item()
      item.task = "По дефолту тут"
      let realm = try! Realm()
      try! realm.write{
          realm.add(item)
      }
    }
  }
}
