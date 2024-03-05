//
//  ViewController.swift
//  Caso practico UIKit
//
//  Created by Luis Humberto Martinez Echegaray on 16/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    //--------------------------------------------------------------------------
    //MARK: - Outlets
    //--------------------------------------------------------------------------
    @IBOutlet weak var productosBtn: UIButton!
    @IBOutlet weak var contenedorDatosView: UIView!
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var categoriaLabel: UILabel!
    @IBOutlet weak var precioRegularLabel: UILabel!
    @IBOutlet weak var precioCreditoLabel: UILabel!
    @IBOutlet weak var descuentoLabel: UILabel!
    @IBOutlet weak var montoDescuentoLabel: UILabel!
    @IBOutlet weak var precioFinalLabel: UILabel!
    @IBOutlet weak var productoImageView: UIImageView!
    
    //--------------------------------------------------------------------------
    //MARK: - Properties
    //--------------------------------------------------------------------------
    private var viewmodel: ProductosViewModel = ProductosViewModel()
    private var productos = [Producto]()
    var prod = Producto()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDesingDatoView()
        setupDesingButton()
        setDelegates()
    }
    
    //--------------------------------------------------------------------------
    //MARK: - Setup's
    //--------------------------------------------------------------------------
    /// Método para configurar el diseño de la vista de datos.
    func setupDesingDatoView(){
        contenedorDatosView.layer.cornerRadius = 17
        contenedorDatosView.layer.shadowColor = UIColor.black.cgColor
        contenedorDatosView.layer.shadowOpacity = 1
        contenedorDatosView.layer.shadowOffset = .zero
        contenedorDatosView.layer.shadowRadius = 10
    }
    
    /// Método para configurar el diseño del botón generar lista.
    func setupDesingButton(){
        productosBtn.layer.shadowColor = UIColor(named: "Gris")?.cgColor
        productosBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
        productosBtn.layer.shadowRadius = 8
        productosBtn.layer.shadowOpacity = 0.8
    }
    
    /// Método para configurar los delegados
    func setDelegates() {
        viewmodel.viewProtocolProducts = self
    }
    
    //--------------------------------------------------------------------------
    //MARK: - Methods
    //--------------------------------------------------------------------------
    func navigateToListProduct() {
        let SBLista = UIStoryboard(name: "ListProductos", bundle: nil)
        if let vc = SBLista.instantiateViewController(withIdentifier: "listaProductos") as?  ListProductosViewController {
            vc.productos = productos
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //--------------------------------------------------------------------------
    //MARK: - IBAction's
    //--------------------------------------------------------------------------
    
    ///  Método para seleccionar el botón individualButton y deseleccionar el botón grupalButton.
    ///  - Parameter sender: Acepta cualquier CustomButton.
    @IBAction func obtenerProductos(_ sender: UIButton) {
        //viewmodel.getProductos()
        viewmodel.getProductsAF { arrayProducts, error in
            if let error = error {
                print("Error al obtener productos: \(error)")
            } else if let productosModel = arrayProducts {
                print("Productos obtenidos")
            }
        }
    }
}

extension ViewController: ResultGetProducts {
    func succes(data: [Producto]) {
        DispatchQueue.main.async {
            self.productos = data
            self.navigateToListProduct()
        }
    }
}

extension ViewController: ListProductosViewControllerDelegate {
    func productoSelect(datos: Producto) {
        contenedorDatosView.isHidden = false
        self.nombreLabel.text = datos.nombre!
        productoImageView.load(urlString: datos.urlImagenes![0])
        self.categoriaLabel.text = "Categoria: " + datos.codigoCategoria!.rawValue
        self.precioRegularLabel.text = "Precio regular: $\(String(describing: datos.precioRegular!))"
        self.precioCreditoLabel.text = "Precio crédito: $\(String(describing: datos.precioCredito!))"
        self.descuentoLabel.text = "Descuento: %\(String(describing: Int(datos.porcentajeDescuento!)))"
        self.montoDescuentoLabel.text = "Monto descuento: $\(String(describing: datos.montoDescuento!))"
        self.precioFinalLabel.text = "Precio final: $\(String(describing: datos.precioFinal!))"
    }
}
