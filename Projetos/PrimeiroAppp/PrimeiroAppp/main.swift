//
//  main.swift
//  PrimeiroAppp
//
//  Created by amasiero on 15/01/21.
//

import Foundation


mainMenu()





func mainMenu(){
    var int:Int
    repeat {
        print("1) Cadastrar Curso")
        print("2) Cadastar aluno")
        print("3) Cadastar aluno em curso")
        print("4) Dar nota aluno ")
        print("5) Exibir alunos e notas")
        print("0) Sair")
        print("Escolha uma Opção")
        let input = readLine()
        int = Int(input!)!
        if int == 2 {
            cadastarAlunos()
        }
        
        
    } while int != 0
    print("Obrigado tenho um bom dia")

}





func cadastarAlunos () -> Bool{
    print("Informe seu nome")
    let nome = readLine()
    var listaAluno = [String]()

    if listaAluno.isEmpty {
        listaAluno.append(String(nome!))
        print("Aluno ",nome ," cadastrado")
    }else{
        for _ in listaAluno {
                listaAluno.append(String(nome!))
            print("Aluno \(String(describing: nome)) cadastrado")
        }
    }
    

//    if condition {
//        cadastrado = true
//    }else{
//        cadastrado = false
//    }
    return true
}

