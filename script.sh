#!/bin/bash


#funciones 

    #menu de preguntas principal
menup(){
    echo "Menu"
    echo "1-Crear"
    echo "2-Buscar"
    echo "3-Ayuda"

}

    #Crear nuevo usuario
crearnuevo(){
    read -r -p "Ingrese Nombre:" NombreP ; 
    read -r -p "Ingrese Apellido:" ApellidoP ;
    read -r -p "Ingrese Mail:" MailP ;
    read -r -p "Ingrese Telefono:" TelP ;
    echo "$NombreP" "$ApellidoP" "$MailP" "$TelP" >> nombre.txt && echo "usuario Ingresado con exito"
    menup;pregunta
}

    #Buscar Usuario
Buscaru(){
    read -r -p "nombre del usuario que busca:" UsuarioB ;
        if grep -q "$UsuarioB" nombre.txt
        then
            echo "se encontro:" 
            grep "$UsuarioB" nombre.txt
            menup;pregunta
        else
            echo "no se encontro ningun usuario"
            menup;pregunta
        fi

}
ayuda(){
echo "Por asistencia remota comunicarse con @Fabro_afonso en slack c:"
menup;pregunta
}

    # if para saber que numero es
pregunta(){
    read -r -p "elige opcion:" var1
        if [ "$var1" = "1" ]
        then
            echo "entraste en crear"
            crearnuevo
        elif [ "$var1" = "2" ]
        then
            echo "Entraste en buscar"
            Buscaru
        elif [ "$var1" = "3" ]
        then
            echo "entraste en ayuda"
        else
            echo "no has seleccionado una opcion que corresponda"
            pregunta2
        fi
}

    # Segundo if por si no elige correcto el primero
pregunta2(){
    read -r -p "elige opcion:" var1
        if [ "$var1" = "1" ]
        then
            echo "entraste en crear"
            Crear
        elif [ "$var1" = "2" ]
        then
            echo "Entraste en buscar"
        elif [ "$var1" = "3" ]
        then
            echo "entraste en ayuda"
        else
            echo "no has seleccionado una opcion que corresponda"
            pregunta
        fi
}



# PROCESO DE EJECUCION PRIMARIO
menup;pregunta