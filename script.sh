#!/bin/bash


#funciones 

    #Registrar nombre y apellido con Condicion de registro

IngresarNuevoUsuario(){

    #Ingresar nombre
while true 
    do
        read -r -p "Ingrese Nombre:" NombreP
        if [[  "$NombreP" =~ ^[a-zA-Z]+$ ]]
            then
                break # Esto sirve para que salga del loop cuando sea valido
        else
            echo "El nombre solo puede contener letras, Intentelo denuevo."
        fi
done
    echo Nombre valido!

    #Ingresar apellido
while true 
    do
        read -r -p "Ingrese Apellido:" ApellidoP
        if [[  "$ApellidoP" =~ ^[a-zA-Z]+$ ]]
            then
                break # Esto sirve para que salga del loop cuando sea valido
        else
            echo "El apellido solo puede contener letras, Intentelo denuevo."
        fi
done
    echo Apellido valido!

    #Ingresar mail
while true
    do
        read -r -p "Ingrese Mail:" MailP
        if [[  "$MailP" =~ ^[a-zA-Z0-9,@]+$ ]]
            then
                break # Esto sirve para que salga del loop cuando sea valido
        else
            echo "El mail debe contener este formato 'usuario@mail.com', Intentelo denuevo."
        fi
done
    echo Email valido!

    #Ingresar Telefono
while true
    do
        read -r -p "Ingrese Telefono:" TelP
        if [[  "$TelP" =~ ^[0-9]+$ ]]
            then
                break # Esto sirve para que salga del loop cuando sea valido
        else
            echo "El telefono debe contener solo numeros, Intentelo denuevo."
        fi
done
    echo Telefono valido!
}


    #menu de preguntas principal
menup(){
    echo "Menu"
    echo "1-Crear"
    echo "2-Buscar"
    echo "3-Ayuda"

}

    #Crear nuevo usuario
crearnuevo(){
    IngresarNuevoUsuario;
    echo "$NombreP" "$ApellidoP" "$MailP" "$TelP" >> nombre.txt && echo "usuario Ingresado con exito"
    menup;pregunta
}

    #Buscar Usuario
Buscaru(){
    read -r -p "Dato del usuario que busca:" UsuarioB ;
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