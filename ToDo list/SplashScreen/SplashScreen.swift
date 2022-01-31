//
//  SplashScreen.swift
//  ToDo list
//
//  Created by Kirill Drozdov on 31.01.2022.
//

import UIKit
import SnapKit

class ViewControllerSpash: UIViewController
{

  private let imageView: UIImageView =
  {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "splash")
    return imageView
  }()


  override func viewDidLoad()
  {
    super.viewDidLoad()
    view.addSubview(imageView)
    view.backgroundColor =  UIColor(red: 230/255, green: 200/255, blue: 145/255, alpha: 100)
  }

  override func viewWillLayoutSubviews()
  {
    super.viewWillLayoutSubviews()
    imageView.center = view.center
    imageView.snp.makeConstraints { make in
      make.width.height.equalTo(200)
    }
    disptch()
  }

  private func animate(){
    UIView.animate(withDuration: 1)
    {
      let size = self.view.frame.width * 3
      let diffX = size - self.view.frame.size.width
      let diffY = self.view.frame.size.height - size
      self.imageView.frame = CGRect(x: -(diffX/2), y: diffY/2, width: size, height: size)
    }

    UIView.animate(withDuration: 1.5)
    {
      self.imageView.alpha = 0
    }completion: { done in
      if done
      {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3)
        {
          let myNavigationController = UINavigationController(rootViewController: ViewController())
          myNavigationController.modalPresentationStyle = .fullScreen
          self.present(myNavigationController, animated: true)
        }
      }
    }
  }

  private func disptch()
  {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      self.animate()
    }
  }
}
