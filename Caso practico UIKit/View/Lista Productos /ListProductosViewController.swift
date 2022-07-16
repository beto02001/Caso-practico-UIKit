//
//  ListProductosViewController.swift
//  Caso practico UIKit
//
//  Created by Luis Humberto Martinez Echegaray on 16/07/22.
//

import UIKit

class ListProductosViewController: UIViewController {
    
    @IBOutlet weak var productosTableVIew: UITableView!
    
    var productos = [Producto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productosTableVIew.delegate = self
        productosTableVIew.dataSource = self
        print("en la nueva: ", productos.first?.nombre)
    }

}

extension ListProductosViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productosTableVIew.dequeueReusableCell(withIdentifier: "cellProducto", for: indexPath)
        return cell
    }
    
    
}
