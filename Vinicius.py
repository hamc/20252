#!/usr/bin/env python3
# -*- coding: utf-8 -*-

def main():
    """
    Função principal que executa um loop infinito
    mostrando a mensagem "Eu sou o Vinicius"
    """
    print("Iniciando o programa do Vinicius...")
    
    try:
        while True:
            print("Eu sou o Vinicius")
            # Pequena pausa para não sobrecarregar o terminal
            import time
            time.sleep(1)
    except KeyboardInterrupt:
        print("\nPrograma interrompido pelo usuário.")
        print("Até logo!")

if __name__ == "__main__":
    main()
