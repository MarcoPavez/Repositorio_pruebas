/*Funciones solicitadas:
obs: los días se deben ingresar como tipo String y los valores de los productos a comprar se deben trabajar con arreglos, por ejemplo = [1000,500,650,8000]

EJERCICIO 1

Don José todos los martes y jueves realiza un 20% de descuento en el total de las compras, crea una función la cual debe recibir un parámetro del día y 
el arreglo de valores de los productos a comprar, esta debe retornar el total final de la compra según corresponda o no descuento.

*/

//Se definen variables

var diaSemana=["Lunes","Martes","Miércoles","Jueves","Viernes","Sábado","Domingo"]
var arrPrecioProductos=[1000,5000,8000,500,3500,6000,1750,10000,7500]
var arrPreciosDescuento=[0]


//Se crea funcion, se utiliza un for para iterar entre "diaSemana", si es martes o jueves se aplica descuento a "arrPrecioProductos" con un forEach, de lo contrario los valores no se alteran.
//Se retorna valores de "arrPrecioDescuento"
function descuentoDias(diaCompra,valorProducto){
    for(i=0;i<diaCompra.length;i++){
        if(diaCompra[i]=="Martes"||diaCompra[i]=="Jueves"){
        return(valorProducto.forEach(x=>arrPreciosDescuento.push(x*0.80)));
    }
    }
    return(arrPreciosDescuento)
}
//Se aplica funcion
descuentoDias(diaSemana, arrPrecioProductos)

//Resultado
console.log(arrPreciosDescuento)

//EJERCICIO 2

//Don José hace un 5% de descuento a los clientes que compran más de 3 productos y al
//menos uno de ellos tiene un valor mayor a 10.000, realiza una función que calcule el
//total verificando si corresponde o no el descuento.

/*

//No lo pude finalizar por falta de tiempo, pero la idea era bastante similar al ejercicio anterior. No supe como diferenciar entre valor de cada producto (para que al menos uno de ellos superara los 10000)

cantComprasClientes=[5,1,3,5,2,1,4,2,4,1]
valorComprasClientes=[8000,5000,14000,13000,7000,15000,9000,3000,15000,1000]

function descuentoClientes(a,b){
    for(i=0;i<cantComprasClientes.length,i++){
        if(cantComprasClientes>3)
    }
}

*/

//EJERCICIO 3

 //Se desea tener una función verificadora encargada de revisar si dentro de el arreglo de
//valores de los productos a comprar no existan valores negativos ingresados por error,
//en caso de no existir debe retornar un mensaje de éxito, en caso contrario debe retornar
//un mensaje de error junto con el número negativo y el índice en el que se encontraba.


//Se crea funcion para verificar negativo en variable previamente definida. Se usa un for para iterar entre valores, si el valor de precioProductos es menor a 0 (negativo), se arroja mensaje de error, indicando valor e indice
function verificaNegativos(precioProductos){
    for(i=0;i<precioProductos.length;i++){
        if(precioProductos[i]<0){
            return("Existe un número negativo, el cual es"+precioProductos[i]+", y se encuentra en el íncide"+precioProductos.indexOf([i]))
        }else{
            return("No existen números negativos")
        }
    }
}

console.log(verificaNegativos(arrPrecioProductos))

/*
EJERCICIO 4

 Dado el siguiente arreglo [200,5500,900,7000,500,300] con los valores de cada
producto
- Crea una función que retorne el valor del producto más costoso.
-Crea una función que retorne el valor del producto menos costoso.

*/


//
var otrosValoresProducto = [200,5500,900,7000,500,300]
var productoMasCostoso = 0;
var productoMenosCostoso = 10000

function numMayor (nuevoArrayProductos){
    for(i=0;i<nuevoArrayProductos.length;i++){
        if(productoMasCostoso<nuevoArrayProductos[i]){
            productoMasCostoso=nuevoArrayProductos[i];
        }
    }
    return(productoMasCostoso)
}

console.log(numMayor(otrosValoresProducto))

/* No pude finalizar por falta de tiempo, la idea era similar a la anterior
function numMenor (nuevoArrayProductos){
    for(i=0;i<nuevoArrayProductos.length;i++){
        if(productoMenosCostoso>nuevoArrayProductos[i]){
            productoMenosCostoso=nuevoArrayProductos[i];
        }
    }
    return(productoMenosCostoso)
}

console.log(numMayor(otrosValoresProducto))
*/