class Tarefa {
    var descricao = ""
    var id = 1
    var concluida = false
    
    init(descricao: String, id: Int) {
        self.descricao = descricao
        self.id = id
    }
}

class PlanejadorDeTarefas {
    var tarefas: [Int: Tarefa] = [:]
    var ultimaTarefaAdicionada = 0;

    func main() {
        print("Olá, seja bem-vindo ao planejador de tarefas.\n")
        menuPrincipal()
    }

    func menuPrincipal() {
        print("Menu Principal:\n1 - Listar tarefas\n2 - Adicionar nova tarefa\n3 - Excluir tarefa\n4 - Marcar tarefa como concluída")
        
        print("Insira o número da operação que deseja realizar: ", terminator: "")
        let escolhido = pedirNumero()
        
        print("")
        if escolhido == 1 {
            menuConsultar()
        } else if escolhido == 2 {
            menuAdd()
        } else if escolhido == 3 {
            menuExcluir()
        } else if escolhido == 4 {
            menuMarcarConcluido()
        }
    }   
    
    func pedirNumero() -> Int {
        while true {
            let textolido = readLine()
            
            guard let texto = textolido else {
                print("Insira um valor válido, tente novamente: ", terminator: "")
                continue
            }
            
            guard let num = Int(texto) else {
                print("Insira um valor válido, tente novamente: ", terminator: "")
                continue
            }
            
            return num
        }
    }
    
    func pedirTexto() -> String {
        while true {
            let textolido = readLine()
            
            guard let texto = textolido else {
                print("Insira um valor válido, tente novamente: ", terminator: "")
                continue
            }
            
            return texto
        }
    }
    
    func menuConsultar() {
        if tarefas.count > 0 {
            print("Lista de tarefas:")
            
            for (id, tarefa) in tarefas {
                print("\(id) - \(tarefa.concluida ? "✅" : "❌") - \(tarefa.descricao)")
            }
            
            print("")
            menuPrincipal()
        } else {
            print("Não há tarefas cadastradas.\n")
            
            menuPrincipal()
        }
    }
    
    func menuAdd() {
        print("Insira a descrição da sua tarefa (ex.: Lavar a louça): ", terminator: "")
        let texto = pedirTexto()
        
        ultimaTarefaAdicionada += 1
        let idtarefa = ultimaTarefaAdicionada
        
        let tarefa = Tarefa(descricao: texto, id: idtarefa)
        tarefas[idtarefa] = tarefa
        
        print("Tarefa adicionada com sucesso.\n")
        menuPrincipal()
    }
    
    func menuExcluir() {
        if tarefas.count > 0 {
            for (id, tarefa) in tarefas {
                print("\(id) - \(tarefa.descricao)")
            }
            
            print("Insira o número da tarefa que você quer excluir (0 para cancelar): ", terminator: "")
            
            let escolhido = pedirNumero()
            
            if escolhido == 0 {
                print("Ação cancelada.\n")
                menuPrincipal()
                return
            }
            
            if let tarefa = tarefas[escolhido] {
                tarefas.removeValue(forKey: tarefa.id)
                print("Tarefa excluída.\n")
            } else {
                print("Tarefa inexistente.\n")
            }
            
            menuPrincipal()
        } else {
            print("Não há tarefas cadastradas.\n")
            
            menuPrincipal()
        }    
    }
    
    func menuMarcarConcluido() {
        if tarefas.count > 0 {
            var qtd = 0
            
            for (id, tarefa) in tarefas {
                if tarefa.concluida == false {
                    print("\(id) - \(tarefa.descricao)")    
                    qtd += 1
                }
            }
            
            if (qtd > 0) {
                print("Insira o número da tarefa que você quer marcar como concluída (0 para cancelar): ", terminator: "")
            
                let escolhido = pedirNumero()
                
                if escolhido == 0 {
                    print("Ação cancelada.\n")
                    menuPrincipal()
                    return
                }
                
                if let tarefa = tarefas[escolhido] {
                    tarefa.concluida = true
                    print("Tarefa marcada como concluída.\n")
                } else {
                    print("Tarefa inexistente.\n")
                }   
            } else {
                print("Não há tarefas pendentes.\n")
            }
            
            menuPrincipal()
        } else {
            print("Não há tarefas cadastradas.\n")
            
            menuPrincipal()
        }
    }
}

PlanejadorDeTarefas().main()
