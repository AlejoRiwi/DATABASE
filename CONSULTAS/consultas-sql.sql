create database ejercicio_veterinaria;
use ejercicio_veterinaria;

# Seleccionar todos los datos de los clientes
select * from cliente;

# Seleccionar todos los médicos con la profesión 'Veterinario'
select * from medico
where medico.med_profesion = "Veterinario";

# Obtener los medicamentos que tienen una m en su nombre
select * from medicamentos
where medicamentos.med_nombre like "%m%";

# Obtener los medicamentos que tienen su valor entre 40 y 100
select * from medicamentos
# where medicamentos.med_valor between 10 and 15;
-- Tambien se puede hacer de la siguiente manera 
where medicamentos.med_valor >= 10 and medicamentos.med_valor <= 15;

# Obtener solamente el nombre de los medicamentos cuya longitud este entre 1 y 10
select medicamentos.med_nombre as nombre_medicamento from medicamentos
where  char_length(medicamentos.med_nombre) between 1 and 10;


# Contar el número total de mascotas registradas
select count(*) as Total_mascotas from mascotas;

# Seleccionar los nombres únicos de las especializaciones:
select distinct especializacion.esp_nombre
from especializacion;


# Listar los medicamentos ordenados por valor de forma descendente:
select * from medicamentos
order by medicamentos.med_valor desc;

# Seleccionar las citas programadas entre dos fechas
select * from citas
where citas.cit_fecha between '2024-04-01' and '2024-04-30';

# Obtener el nombre de la mascota y el nombre del cliente
select mascotas.mas_nombre, cliente.cli_nombre from mascotas
inner join cliente on mascotas.cliente_cli_id = cliente.cli_id;

-- Segunda forma de hacer el punto anterior
select mascotas.mas_nombre, cliente.cli_nombre from mascotas, cliente
where mascotas.cliente_cli_id = cliente.cli_id;

# Listar todas las mascotas y sus historias clínicas, incluyendo las mascotas sin historias clínicas
select mascotas.mas_nombre, historias_clinicas.his_descripcion from mascotas
left join historias_clinicas on historias_clinicas.his_id = mascotas.historias_clinicas_his_id;

# Calcular el costo total por cada tipo de servicio
select especializacion.esp_nombre, sum(servicio.ser_costo) as precio_total from servicio 
inner join especializacion on especializacion.esp_id = servicio.especializacion_esp_id
group by servicio.especializacion_esp_id;

# Obtener una lista de citas con un estado 'Pendiente' o 'Realizado' basado en el valor de cit_estado:
select citas.cit_fecha,
	case 
		when citas.cit_estado = 0 then "pendiente"
        when citas.cit_estado = 1 then "Realizado"
	end as estado_citas
from citas;

# Obtener los nombres de las mascotas, el procedimiento del servicio que recibieron, y el nombre de su médico:
select citas.cit_fecha, mascotas.mas_nombre, servicio.ser_procedimiento, medico.med_nombre from citas
inner join mascotas on mascotas.mas_id = citas.mascotas_mas_id
inner join servicio on servicio.ser_id = citas.servicio_ser_id
inner join medico on medico.med_id = citas.medico_med_id;