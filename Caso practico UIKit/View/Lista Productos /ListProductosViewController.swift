//
//  ListProductosViewController.swift
//  Caso practico UIKit
//
//  Created by Luis Humberto Martinez Echegaray on 16/07/22.
//

import UIKit

//--------------------------------------------------------------------------
//MARK: - Protocol
//--------------------------------------------------------------------------
protocol ListProductosViewControllerDelegate: AnyObject {
    func productoSelect(datos: Producto)
}

protocol ResultGetProducts: AnyObject {
    func succes(data: [Producto])
}

class ListProductosViewController: UIViewController {
    //--------------------------------------------------------------------------
    //MARK: - Outlet
    //--------------------------------------------------------------------------
    @IBOutlet weak var productosTableVIew: UITableView!
    
    //--------------------------------------------------------------------------
    //MARK: - Properties
    //--------------------------------------------------------------------------
    weak var delegate: ListProductosViewControllerDelegate?
    var productos = [Producto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productosTableVIew.delegate = self
        productosTableVIew.dataSource = self
    }

}

//--------------------------------------------------------------------------
//MARK: - UITableView Delegate - DataSource
//--------------------------------------------------------------------------
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
        let SBMain = UIStoryboard(name: "Main", bundle: nil)
        guard SBMain.instantiateViewController(withIdentifier: "mainSB") is ViewController else {return}
        self.delegate?.productoSelect(datos: productos[indexPath.row])
        
        navigationController?.popViewController(animated: true)
    }
}
