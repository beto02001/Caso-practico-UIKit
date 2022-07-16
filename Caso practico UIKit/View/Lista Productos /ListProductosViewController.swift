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
        let cell = productosTableVIew.dequeueReusableCell(withIdentifier: "cellProducto", for: indexPath) as! ProductoTableViewCell
        let producto = productos[indexPath.row]
        cell.productoUIImage.load(urlString: (producto.urlImagenes![0]))
        cell.nombreProductoLabel.text = producto.nombre
        cell.precioProductoLabel.text = "Precio: $\(producto.precioRegular!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Indice: ", indexPath.row)
        let SBMain = UIStoryboard(name: "Main", bundle: nil)
        if let vc = SBMain.instantiateViewController(withIdentifier: "mainSB") as? ViewController {
            vc.index = indexPath.row
            vc.viewDidLoad()
            navigationController?.popViewController(animated: true)
            
        }
    }
    
    func openGenerarSalida(index: Int?) {
        guard let i = index else { return }
        performSegue(withIdentifier: "confirmarSalidaExpress", sender: i)
    }
}
