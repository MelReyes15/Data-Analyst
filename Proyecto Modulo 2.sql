--EVALUACIÓN MÓDULO 2

SELECT * FROM empleados
SELECT * FROM departamentos

--Función de Ventana y Subconsulta 
--(salario promedio)
WITH salarios_promedio AS (
    SELECT 
        departamento_id,
        AVG(salario) AS salario_prom
    FROM 
        empleados
    GROUP BY 
        departamento_id
),
Ranked_salarios AS (
    SELECT 
        e.nombre AS empleado,
        d.nombre AS departamento,
        e.salario AS salario,
        p.salario_prom AS salario_prom,
        RANK() OVER (PARTITION BY e.departamento_id ORDER BY e.salario DESC) AS ranking_salarios,
		DENSE_RANK() OVER (PARTITION BY e.departamento_id ORDER BY e.salario DESC) AS denseranking_salarios,
        ROW_NUMBER() OVER (PARTITION BY e.departamento_id ORDER BY e.salario DESC) AS rownumber_salario 
    FROM 
        empleados e
    JOIN 
        salarios_promedio p ON e.departamento_id = p.departamento_id
    JOIN 
        departamentos d ON e.departamento_id = d.id
)
SELECT 
    empleado AS Empleado,
    salario AS Salario,
    departamento AS Departamento,
    denseranking_salarios AS Rango
FROM 
    Ranked_salarios
WHERE 
    salario > salario_prom
ORDER BY 
    departamento, Rango;

--2. Procedimiento Almacenado
--(actualizar el salario de todos los empleados en un departamento específico)

CREATE OR REPLACE PROCEDURE Actualizar_Salarios(
	nombre_departamento VARCHAR,
	porcentaje_incremento NUMERIC
)
LANGUAGE 
	plpgsql
AS 
	$$
BEGIN 
		UPDATE 
			empleados 
		SET 
			salario = salario * (1 + porcentaje_incremento / 100)
		FROM
			departamentos d
		WHERE
			d.nombre = nombre_departamento;
END;
$$;
--LLAMANDO PROCEDIMIENTO
CALL
	Actualizar_Salarios('Ventas', 15);

SELECT * FROM empleados

--3. Trigger
--(Nuevo registro)
SELECT * FROM ventas1
SELECT * FROM productos_


--Creacion tabla alerta
CREATE TABLE alertas_ventas (
    id SERIAL PRIMARY KEY,
    id_venta INTEGER NOT NULL,
    mensaje VARCHAR NOT NULL,
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--Creacion funcion
CREATE OR REPLACE FUNCTION verificar_monto_venta_alta()
RETURNS TRIGGER AS $$
DECLARE
    monto_venta NUMERIC;
BEGIN
    -- Obtener el precio del producto
    SELECT precio INTO monto_venta FROM productos_ WHERE id = NEW.producto_id;
    
    -- Calcular el monto total de la venta
    monto_venta := monto_venta * NEW.cantidad;
    
    -- Verificar si el monto de la venta es mayor a 10,000
    IF monto_venta > 10000 THEN
        -- Insertar una alerta en la tabla alertas_ventas
        INSERT INTO alertas_ventas (id_venta, mensaje)
        VALUES (NEW.id, 'Venta alta detectada');
	ELSE 
		INSERT INTO alertas_ventas (id_venta, mensaje)
        VALUES (NEW.id, 'Venta normal');
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--Creacion del trigger
CREATE TRIGGER AlertaVentaAlta
BEFORE INSERT ON ventas1
FOR EACH ROW
EXECUTE FUNCTION verificar_monto_venta_alta();

--insertar datos
INSERT INTO ventas1 (producto_id, cliente_id, cantidad) VALUES (1, 101, 3);
INSERT INTO ventas1 (producto_id, cliente_id, cantidad) VALUES (3, 105, 2);
INSERT INTO ventas1 (producto_id, cliente_id, cantidad) VALUES (2, 101, 5);

SELECT * FROM alertas_ventas;