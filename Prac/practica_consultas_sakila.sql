use sakila;

#----------- Consulta --------------#
select R.rental_id "ID_ALQUILER",
<<<<<<< HEAD
	date(R.rental_date) "DIA_ALQUILER",
    year(R.rental_date) "AÑO_RENTA",
    month(R.rental_date) "MES_RENTA",
    quarter(R.rental_date) "CUATRI_RENTA",
=======
	date(R.rental_date) "DIA_ALQUILER", #Agrego el date para que al exportar no se crashee
	year(r.rental_date) "AÑO_RENTA",
    month(r.rental_date) "MES_RENTA",
    quarter(r.rental_date) "CUATRI_RENTA",
>>>>>>> a26c1ee3e67cf64c2c1a760b930510ff17633b0c
    R.inventory_id "ID_INVENTARIO",
	R.customer_id "ID_CLIENTE",
    date(R.return_date) "DIA_DEVOLUCION",
    R.last_update "ULTIMA ACTUALIZACION",
    (Select Fi.title from film Fi where Fi.film_id = (Select I.film_id from inventory I where  R.inventory_id = I.inventory_id)) "TITULO_PELICULA",
    (Select Fi.description from film Fi where Fi.film_id = (Select I.film_id from inventory I where  R.inventory_id = I.inventory_id)) "DESCRIPCION",
    (Select Fi.release_year from film Fi where Fi.film_id = (Select I.film_id from inventory I where  R.inventory_id = I.inventory_id)) "AÑO",
    (Select L.name from language L where L.language_id = (Select Fi.language_id from film Fi where Fi.film_id = (Select I.film_id from inventory I where  R.inventory_id = I.inventory_id))) "LENGUAJE",
    (Select Fi.original_language_id from film Fi where Fi.film_id = (Select I.film_id from inventory I where  R.inventory_id = I.inventory_id)) "LENGUAJE_ORIGINAL",
    (Select Fi.rental_duration from film Fi where Fi.film_id = (Select I.film_id from inventory I where  R.inventory_id = I.inventory_id)) "TIEMPO_RENTA",
    (Select Fi.rating from film Fi where Fi.film_id = (Select I.film_id from inventory I where  R.inventory_id = I.inventory_id)) "CLASIFICACION",
    (Select Ad.address from address Ad where Ad.address_id = (Select St.address_id from store St where St.store_id = (Select I.store_id from inventory I where R.inventory_id = I.inventory_id))) "DIRECCION",
    (Select Ci.city from city Ci where Ci.city_id = (Select Ad.city_id from address Ad where Ad.address_id = (Select St.address_id from store St where St.store_id = (Select I.store_id from inventory I where R.inventory_id = I.inventory_id)))) "CITY",
	(Select Ad.postal_code from address Ad where Ad.address_id = (Select Cu.address_id from customer Cu where R.customer_id = Cu.customer_id)) "CODIGO_POSTAL",
	(Select Ad.phone from address Ad where Ad.address_id = (Select Cu.address_id from customer Cu where R.customer_id = Cu.customer_id)) "TELEFONO",
<<<<<<< HEAD
    (Select Cu.first_name from customer Cu where R.customer_id = Cu.customer_id) "NOMBRE_CLIENTE",
    (Select Cu.last_name from customer Cu where R.customer_id = Cu.customer_id) "APELLIDO_CLIENTE",
    (Select Cu.email from customer Cu where R.customer_id = Cu.customer_id) "EMAIL_CLIENTE",
    (Select first_name from staff S where S.store_id = (Select I.store_id from inventory I where R.inventory_id = I.inventory_id)) "NOMBRE_PERSONAL",
    (Select last_name from staff S where S.store_id = (Select I.store_id from inventory I where R.inventory_id = I.inventory_id)) "APELLIDO_PERSONAL",
    (Select email from staff S where S.store_id = (Select I.store_id from inventory I where R.inventory_id = I.inventory_id)) "EMAIL_PERSONAL",
	(Select username from staff S where S.store_id = (Select I.store_id from inventory I where R.inventory_id = I.inventory_id)) "USERNAME",
    date(R.return_date) "DIA_DEVOLUCION",
	(Select payment_id from payment Pa where Pa.rental_id = R.rental_id) "ID_PAGO",
    (Select amount from payment Pa where Pa.rental_id = R.rental_id) "COSTO",
    (Select payment_date from payment Pa where Pa.rental_id = R.rental_id) "FECHA_PAGO",
    R.last_update "ULTIMA ACTUALIZACION"
from rental R;
#----------- Consulta --------------#

=======
    (Select concat(Cu.first_name, " ", Cu.last_name) from customer Cu where R.customer_id = Cu.customer_id) "NOMBRE_APELLIDO_CLIENTE",
    (Select Cu.email from customer Cu where R.customer_id = Cu.customer_id) "EMAIL_CLIENTE",
    (Select concat (S.first_name, " ", S.last_name) from staff S where S.store_id = (Select I.store_id from inventory I where R.inventory_id = I.inventory_id)) "NOMBRE Y APELLIDO PERSONAL",
    (Select S.email from staff S where S.store_id = (Select I.store_id from inventory I where R.inventory_id = I.inventory_id)) "EMAIL_PERSONAL",
    P.staff_id "COD_VEND_COBRO",
    P.payment_id "PAYMENT_ID",
    P.amount "MONTO",
    date(P.payment_date) "FECHA_PAGO"
from rental R,
	 payment P
where R.rental_id = P.rental_id;
>>>>>>> a26c1ee3e67cf64c2c1a760b930510ff17633b0c
