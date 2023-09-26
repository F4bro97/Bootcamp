#!/bin/bash

# Functions

# Name and Surname register with Conditions
insertnewuser(){

# Insert Names
while true 
do
read -r -p "Ingrese Nombre:" newname
if [[  "$newname" =~ ^[a-zA-Z]+$ ]]; then
break # Input is valid. Exit loop
else
echo "El nombre solo puede contener letras, Intentelo denuevo."
fi
done
echo Nombre valido!

# Insert Surname
while true 
do
read -r -p "Ingrese Apellido:" newsurname
if [[  "$newsurname" =~ ^[a-zA-Z]+$ ]];then
break #Input is valid. Exit loop
else
echo "El apellido solo puede contener letras, Intentelo denuevo."
fi
done
echo Apellido valido!

# Insert Mail
while true
do
read -r -p "Ingrese Mail:" newmail
if [[  "$newmail" =~ ^[a-zA-Z0-9,@]+$ ]];then
break #Input is valid. Exit loop
else
echo "El mail debe contener este formato 'usuario@mail.com', Intentelo denuevo."
fi
done
echo Email valido!

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
echo Telefono valido!
}

# Main Menu
mainmenu(){
echo "Menu"
echo "1-Crear"
echo "2-Buscar"
echo "3-Ayuda"
}

# Crear nuevo usuario
createusermenu(){
Insertnewuser;
echo "$newname" "$newsurname" "$newmail" "$newtel" >> nombre.txt && echo "usuario Ingresado con exito"
mainmenu;pregunta
}

# Search users
searchuser(){
read -r -p "Dato del usuario que busca:" usersearch ;
if grep -q "$usersearch" nombre.txt;then
echo "se encontro:" 
grep "$usersearch" nombre.txt
mainmenu;deploymainmenu
else
echo "no se encontro ningun usuario"
mainmenu;deploymainmenu
fi
}

# Help menu
helpmenu(){
echo "Por asistencia remota comunicarse con @Fabro_afonso en slack c:"
mainmenu;deploymainmenu
}

# First option catcher
deploymainmenu(){
read -r -p "elige opcion:" var1
if [ "$var1" = "1" ];then
echo "entraste en crear"
createusermenu
elif [ "$var1" = "2" ];then
echo "Entraste en buscar"
searchuser
elif [ "$var1" = "3" ];then
echo "entraste en ayuda"
helpmenu
else
echo "no has seleccionado una opcion que corresponda"
deploymainmenuagain
fi
}

# Second option catcher
deploymainmenuagain(){
read -r -p "elige opcion:" var1
if [ "$var1" = "1" ];then
echo "entraste en crear"
createusermenu
elif [ "$var1" = "2" ];then
echo "Entraste en buscar"
searchuser
elif [ "$var1" = "3" ];then
echo "entraste en ayuda"
helpmenu
else
echo "no has seleccionado una opcion que corresponda"
deploymainmenu
fi
}

# Main process
mainmenu;deploymainmenu