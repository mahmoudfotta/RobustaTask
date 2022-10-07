//
//  Storyboarded.swift
//  RobustaTask
//
//  Created by Mahmoud Abolfotoh on 07/10/2022.
//

import UIKit

protocol Storyboarded {
    static var storyboardName: String { get }
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let name = String(describing: type(of: Self.self)).components(separatedBy: ".")[0]
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: name) as! Self
    }
}
