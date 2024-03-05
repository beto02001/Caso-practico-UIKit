//
//  ProductosViewModel.swift
//  Caso practico
//
//  Created by Luis Humberto Martinez Echegaray on 15/07/22.
//

import Foundation
import Alamofire

class ProductosViewModel{
    
    var productosData = [Producto]()
    lazy var viewProtocolProducts: ResultGetProducts? = nil
    private let urlString = "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/sapp/productos/plp/1/ad2fdd4bbaec4d15aa610a884f02c91a"
    
    func getProductos(){
        guard let url = URL(string: urlString) else { return }
        let urlsession = URLSession.shared
        urlsession.dataTask(with: url){ data, response, error in
            if let _ = error{
                print("error!")
                return
            }
            guard let data = data else { return }
            do{
                let dataProductos = try JSONDecoder().decode(ProductosModel.self, from: data)
                let prods = dataProductos.resultado.productos
                self.productosData = prods
                self.viewProtocolProducts?.succes(data: prods)
            } catch{
                print("No se pudo")
                return
            }
        }.resume()
    }
    
    func getProductsAF(completion: @escaping ([Producto]?, Error?) -> Void) {
        AF.request(urlString, method: .get).responseDecodable(of: ProductosModel.self) { response in
            switch response.result {
            case .success(let resultProduct):
                let prods = resultProduct.resultado.productos
                self.productosData = prods
                self.viewProtocolProducts?.succes(data: prods)
                completion(prods, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
