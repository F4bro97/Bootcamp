#!/bin/bash

# Functions

# Name and Surname register with Conditions

insertnewuser(){
# Insert Names
while true ;do
read -r -p "Ingrese Nombre:" newname
if [[  "$newname" =~ ^[a-zA-Z]+$ ]]; then
break # Input is valid. Exit loop
else
echo "El nombre solo puede contener letras, Intentelo denuevo."
fi
done
echo "Nombre agregado!"

# Insert Surname
while true ;do
read -r -p "Ingrese Apellido:" newsurname
if [[  "$newsurname" =~ ^[a-zA-Z]+$ ]];then
break #Input is valid. Exit loop
else
echo "El apellido solo puede contener letras, Intentelo denuevo."
fi
done
echo "Apellido agregado!"

# Insert Mail
while true;do
read -r -p "Ingrese Mail:" newmail
if [[  "$newmail" =~ ^[a-zA-Z0-9,@]+$ ]];then
break #Input is valid. Exit loop
else
echo "El mail debe contener este formato 'usuario@mail.com', Intentelo denuevo."
fi
done
echo "Email agregado!"

# Insert phone number
while true
do
read -r -p "Ingrese Telefono:" newtel
if [[  "$newtel" =~ ^[0-9]+$ ]];then
break #Input is valid. Exit loop
else
echo "El telefono debe contener solo numeros, Intentelo denuevo."
fi
done
echo Telefono valido!;

# Create a line with the credentials and leaving inside the .txt
echo "$newname" "$newsurname" "$newmail" "$newtel" >> nombre.txt && echo "usuario Ingresado con exito"
mainmenu;deploymainmenu
}

# Main Menu
mainmenu(){
echo " Menu"
echo "1-Crear Usuario"
echo "2-Buscar Usuario"
echo "3-Ayuda"
echo "4-Salir"
}

# Search users
searchuser(){
while true;do
read -r -p "Dato del usuario que busca:" usersearch
if [[  "$usersearch" =~ ^[a-zA-z0-9,@]+$ ]];then
grep -q "$usersearch" nombre.txt && echo " Se encontraron estos usuarios:" || echo "no se encontraron datps"
grep "$usersearch" nombre.txt
mainmenu;deploymainmenu
break
else
echo "Solo permite numeros letras y '@'"
fi
done
}

# Help menu
helpmenu(){
echo "Opcion 1 - 'crear usuario': Para crear usuario primero digite el 'Nombre' (solo pueden ser letras, no puede contener ningun otro caracter)
                                                                       'Apellido' (solo pueden ser letras, no puede contener ningun otro caracter)
                                                                       'mail' (Solo puede contener letras numeros y el digito del '@')
                                                                       'Telefono' (para este paso solo se puede poner numeros sin guiones ni puntos)
      Opcion 2 - Se puede buscar un usuario por cualquier dato que se tenga de esa persona, solo se permite numeros letras y '@'

      Por necesidad de asistencia remota comunicarse con @Fabro_afonso en Slack"
mainmenu;deploymainmenu
}

# Option catcher
deploymainmenu(){
while true
do
read -r -p "elige opcion:" option
if [[ "$option" =~ ^[1]+$ ]];then
insertnewuser
break
elif [[ "$option" =~ ^[2]+$ ]];then
searchuser
break
elif [[ "$option" =~ ^[3]+$ ]];then
helpmenu
break
elif [[ "$option" =~ ^[4]+$ ]];then
echo "Salida exitosa"
break
else
echo "no has seleccionado una opcion que corresponda"
fi
done
}

login(){

while true; do
read -r -p 'Username: ' user
read -r -p 'Password: ' password
if [[ $user == "admin" && $password == "123456" ]];then
mainmenu;deploymainmenu
break
else
echo  "Unsuccessful login"
fi
done
}

# Main process
login