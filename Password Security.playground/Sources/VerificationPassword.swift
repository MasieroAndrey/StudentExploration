import Foundation


let tenMostCommonPasswords = [
    "123456",
    "password",
    "12345678",
    "qwerty",
    "12345",
    "123456789",
    "letmein",
    "1234567",
    "football",
    "iloveyou"
]

let digits = "0123456789"
let punctuation = "!@#$%^&*(),.<>;'`~[]{}\\|/?_-+= "
let regularLetter = "abcdefghijklmnopqrstuvwxyz"

var digitsList = [String]()
var upercase = false
var number = false
var caracter = false
var regular = false
var loginInPassword = false



public func calcPassword(password: String, login: String) -> String{
    var msg = String()
   
    if password.count > 16 && password.count < 24 {
        for passwordCaracter in password {
            if regularLetter.contains(passwordCaracter) {
                regular = true
            }
            if passwordCaracter.isUppercase{
                upercase = true
            }
            if digits.contains(passwordCaracter) {
                number = true
            }
            if (punctuation.contains(passwordCaracter)) {
                caracter = true
            }
            if password.lowercased().contains(login.lowercased()) {
                loginInPassword = true
               
            }
        }
        msg = showResultPassword(upercase: upercase, number: number, caracter: caracter, regular: regular, loginInPassword: loginInPassword, password: password, login: login)
    }else{
        msg = "Sua senha nao possui o tamanho correcto \nSenha digitada foi:  \(password)"
    }
    return msg
}


func showResultPassword(upercase: Bool, number: Bool, caracter: Bool, regular: Bool, loginInPassword: Bool, password: String, login: String) -> String{
    
    
    var msg = String()
    switch (upercase,number,caracter,regular,loginInPassword) {
    case (true,true,true,true,false):
        msg = "Senha Cadastrada \(password)\nNome Usuario: \(login)"
    case (true,true,true,true,true):
        msg = "Você nao pode cadastrar seu usuario na senha"
    case (false,true,true,true,false):
        msg = "Senha nao possui uma letra em caixa alta \nSenha digitada foi:  \(password)"
    case (true,false,true,true,false):
        msg = "Senha nao possui numero \nSenha digitada foi:  \(password)"
    case (true,true,false,true,false):
        msg = "Senha nao possui caracter especial \nSenha digitada foi:  \(password)"
    case (true,true,true,false,false):
        msg = "Senha nao possui caracter regular \nSenha digitada foi:  \(password)"
    case (false,false,true,true,false):
        msg = "Senha nao possui caixa alta \nSenha nao possui numero \nSenha digitada foi:  \(password)"
    case (true ,false,false,true,false):
        msg = "Senha nao possui numero \nSenha nao possuiu caracter especial \nSenha digitada foi:  \(password)"
    case (false ,true,false,true,false):
        msg = "Senha nao possui caixa alta \nSenha nao possuiu caracter regular \nSenha digitada foi:  \(password)"
    case (true ,true,false,false,false):
        msg = "Senha nao possui caracter especial \nSenha nao possuiu caracter regular \nSenha digitada foi: \(password)"
    case (false ,true,false,false,false):
        msg = "Senha nao possui caracter especial \nSenha nao possuiu caracter regular \nSenha nao possui caracter especial \nSenha digitada foi: \(password)"
    default:
        msg = "Sua senha nao atende os requisitos. Por favor digite novamente"
    }
    return msg
}
