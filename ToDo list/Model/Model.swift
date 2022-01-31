//
//  Model.swift
//  ToDo list
//
//  Created by Kirill Drozdov on 01.02.2022.
//

import RealmSwift


class Item: Object
{
  @objc dynamic var task: String = ""
}
