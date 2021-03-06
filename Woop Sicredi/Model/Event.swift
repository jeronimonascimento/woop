//
//  Event.swift
//  Woop Sicredi
//
//  Created by Jeronimo Junior on 27/10/20.
//

import Foundation

struct Event: Codable {
    //var people: [Any]
    var date: Int
    var description: String
    var image: String
    var longitude: Float
    var latitude: Float
    var price: Double
    var title: String
    var id: String
    
    
    //{"people":[],"date":1534784400,"description":"O Patas Dadas estarÃ¡ na RedenÃ§Ã£o, nesse domingo, com cÃ£es para adoÃ§Ã£o e produtos Ã  venda!\n\nNa ocasiÃ£o, teremos bottons, bloquinhos e camisetas!\n\nTraga seu Pet, os amigos e o chima, e venha aproveitar esse dia de sol com a gente e com alguns de nossos peludinhos - que estarÃ£o prontinhos para ganhar o â™¥ de um humano bem legal pra chamar de seu. \n\nAceitaremos todos os tipos de doaÃ§Ã£o:\n- guias e coleiras em bom estado\n- raÃ§Ã£o (as que mais precisamos no momento sÃ£o sÃªnior e filhote)\n- roupinhas \n- cobertas \n- remÃ©dios dentro do prazo de validade","image":"http://lproweb.procempa.com.br/pmpa/prefpoa/seda_news/usu_img/Papel%20de%20Parede.png","longitude":-51.2146267,"latitude":-30.0392981,"price":29.99,"title":"Feira de adoÃ§Ã£o de animais na RedenÃ§Ã£o","id":"1"}
}
