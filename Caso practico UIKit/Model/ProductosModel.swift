// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct ProductosModel: Codable {
    var resultado: Resultado
}

// MARK: - Resultado
struct Resultado: Codable {
    var productos: [Producto]
}

// MARK: - Producto
struct Producto: Codable {
    var id: String?
    var idLinea: Int?
    var codigoCategoria: CodigoCategoria?
    var idModalidad, relevancia: Int?
    var lineaCredito: String?
    var pagoSemanalPrincipal, plazoPrincipal: Int?
    var disponibleCredito: Bool?
    var abonosSemanales: [AbonosSemanale]?
    var sku, nombre: String?
    var urlImagenes: [String]?
    var precioRegular: Int?
    var precioFinal, porcentajeDescuento: Double?
    var descuento: Bool?
    var precioCredito, montoDescuento: Double?
}

// MARK: - AbonosSemanale
struct AbonosSemanale: Codable {
    var plazo, montoAbono, montoDescuentoAbono, montoUltimoAbono: Int?
    var montoFinalCredito, idPromocion, montoDescuentoElektra, montoDescuentoBanco: Int?
    var precio, montoAbonoDigital: Int?
}

enum CodigoCategoria: String, Codable {
    case c = "C"
    case ma = "MA"
    case tl = "TL"
}
