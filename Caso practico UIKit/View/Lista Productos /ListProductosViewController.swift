//
//  ListProductosViewController.swift
//  Caso practico UIKit
//
//  Created by Luis Humberto Martinez Echegaray on 16/07/22.
//

import UIKit

class ListProductosViewController: UIViewController {
    var productos = [Producto]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("en la nueva: ", productos.first?.nombre)
    }
    


}
