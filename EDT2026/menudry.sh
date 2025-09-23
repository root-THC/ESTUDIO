#!/bin/bash

# =========================================
# FUNCIONES
# =========================================

comprobar_fichero_directorio() {
    echo -e "Escribe la ruta del fichero o directorio que quieras comprobar"
    read busqueda
    clear
    if [ -e "$busqueda" ]; then
        echo "El fichero o directorio '$busqueda' existe."
    else
        echo "Error: el fichero o directorio '$busqueda' no existe."
    fi
}

comprobar_permisos() {
    echo -e "Indica el fichero que quieras comprobar los permisos"
    read fichero
    clear
    if [ -w "$fichero" ]; then
        echo -e "El fichero es writable"
    else
        echo -e "El fichero no es writable"
    fi

    if [ -r "$fichero" ]; then
        echo -e "El fichero es legible"
    else
        echo -e "El fichero no es legible"
    fi

    if [ -x "$fichero" ]; then
        echo -e "El fichero es ejecutable"
    else
        echo -e "El fichero no es ejecutable"
    fi
}

comprobar_no_vacio() {
    echo -e "Indica el fichero que quieras comprobar"
    read fichero 
    if [ -s "$fichero" ]; then
        echo -e "El archivo contiene contenido"
    else
        echo -e "El archivo está completamente vacío"
    fi
}

comprobar_tipo() {
    echo -e "Indica la ruta que quieras comprobar"
    read fichero 
    if [ -f "$fichero" ]; then
        echo -e "La ruta es un archivo regular"
    elif [ -d "$fichero" ]; then
        echo -e "La ruta es un directorio"
    else
        echo -e "La ruta especificada no es ni fichero ni directorio"
    fi
}

comprobar_numeros() {
    echo -e "Indica el primer número"
    read numero1
    echo -e "Indica el segundo número"
    read numero2
    clear

    if [ "$numero1" -eq "$numero2" ]; then
        echo -e "Los números son iguales"
    elif [ "$numero1" -gt "$numero2" ]; then
        echo -e "Números diferentes y num1 > num2"
    elif [ "$numero1" -lt "$numero2" ]; then
        echo -e "Números diferentes y num2 > num1"
    else 
        echo -e "No has introducido números válidos"
    fi
}

comprobar_cadena() {
    read -p "Escribe la cadena a comprobar: " cadena
    echo "$cadena"
    if [ -z "$cadena" ]; then
        echo -e "La cadena indicada está vacía"
    else 
        echo -e "La cadena contiene contenido"   
    fi
}

comprobar_texto() {
    read -p "Escribe el primer texto: " texto1
    clear
    read -p "Escribe el segundo texto: " texto2
    clear

    if [ "$texto1" != "$texto2" ]; then
        echo -e "Las cadenas de texto son diferentes"
    else 
        echo -e "Las cadenas de texto son iguales"   
    fi
}

comprobar_logica() {
    read -p "Escribe el fichero a comprobar: " fichero
    clear
    read -p "Escribe el directorio a comprobar: " directorio
    clear

    if [[ -f "$fichero" && -d "$directorio" ]]; then
        echo -e "Tanto el fichero '$fichero' como el directorio existen"
        echo -e "------------------------------------------------------"
        echo -e "Contenido del directorio:\n$(ls "$directorio")"
    elif [[ -f "$fichero" && ! -d "$directorio" ]]; then
        echo -e "El fichero '$fichero' es lo único que existe"
    elif [[ ! -f "$fichero" && -d "$directorio" ]]; then
        echo -e "El directorio '$directorio' es lo único que existe:"
        echo -e "Contenido del directorio:\n$(ls "$directorio")"
    else 
        echo -e "Ni el fichero '$fichero' ni el directorio '$directorio' existen"
    fi
}

comprobar_negacion() {
    read
