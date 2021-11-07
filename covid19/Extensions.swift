//
//  UITableView+Extension.swift
//  covid19
//
//  Created by Z.Seckin on 4.11.2021.
//

import UIKit

extension UIView {
    class var identifier: String {
        String(describing: self)
    }
}

extension UITableView {
    func dequeueCell<CellType: UITableViewCell>(indexPath: IndexPath) -> CellType {
        guard let cell = dequeueReusableCell(withIdentifier: CellType.identifier, for: indexPath) as? CellType else {
            fatalError("Wrong type of cell")
        }
        return cell
    }
    
    func registerNib(_ type: UITableViewCell.Type) {
        register(
            UINib(nibName: type.identifier, bundle: .main),
            forCellReuseIdentifier: type.identifier
        )
    }
}

extension Optional where Wrapped == String {
    var stringValue: String {
        return self ?? ""
    }
}

extension Optional where Wrapped == Int {
    var stringValue: String {
        return "\(self ?? 0)"
    }
}

extension Optional where Wrapped == Double {
    var doubleValue: Double {
        return self ?? 0
    }
}

extension UIViewController {
    func showAlert() {
        self.dismiss(animated: true, completion: nil)
        let alert = UIAlertController(title: "Oops!", message: "Something went wrong.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
