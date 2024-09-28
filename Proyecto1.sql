--CREACIÓN DE TABLAS

CREATE TABLE Categorias (
	id INT PRIMARY KEY,
	categoria VARCHAR(100)	
);

CREATE TABLE Productos_(
	id INT PRIMARY KEY,
	nombre VARCHAR (100),
	precio DECIMAL (10,2),
	categoria_id INT,
	FOREIGN KEY (categoria_id) REFERENCES Categorias(id)
);

CREATE TABLE Clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    nit VARCHAR(100) 
);

CREATE TABLE Ventas1 (
    id SERIAL PRIMARY KEY,
    producto_id INT,
    cliente_id INT,
    cantidad INT,
    fecha DATE,
    FOREIGN KEY (producto_id) REFERENCES Productos_(id),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

--INSERTAR REGISTROS TABLAS

INSERT INTO Categorias (id, categoria)VALUES 
(1, 'Hogar'),
(2, 'Electrónica'),
(3, 'Belleza'),
(4, 'Ropa'),
(5, 'Mascotas');

INSERT INTO Productos_ (id, nombre, precio, categoria_id) VALUES
(001, 'Sillon', 5000.00, 1),
(002, 'Cama',3900.00, 1),
(003, 'Sábanas',350.00 , 1),
(004, 'Sillon', 5000.00, 1),
(005, 'Comedor',2900.00, 1),
(006, 'Smart TV',4500.00, 2),
(007, 'Tablet Samsung',2500.00, 2),
(008, 'Smartphone',4500.00 , 2),
(009, 'Auriculares',900.00, 2),
(010, 'Smartwatch',800.00 , 2),
(011, 'Base',250.00, 3),
(012, 'Sombras',300.00, 3),
(013, 'Tinte',60.00, 3),
(014, 'Crema hidratante',50.00, 3),
(015, 'Protectot solar',150.00, 3),
(016, 'Blusa',50.00, 4),
(017, 'Camisa',60.00, 4),
(018, 'Pantalón',150.00, 4),
(019, 'Chaleco',90.00, 4),
(020, 'Chaqueta',170.00, 4),
(021, 'Concentrado 2kg',250.00, 5),
(022, 'Ropa',60.00, 5),
(023, 'Desparacitante',90.00, 5),
(024, 'Shampoo',75.00, 5),
(025, 'Pelota',35.00, 5);

INSERT INTO Clientes (id, nombre,nit) VALUES
(101, 'Andrea Reyes','1088878-3'),
(102, 'Dhyland Monzon','4765217-8'),
(103, 'Sandra Fuentes','2537891-6'),
(104, 'Yorneli Sic','3781426-7'),
(105, 'Luis Morales','4457812-5'),
(106, 'Enrique Gonzalez','6661482-1'),
(107, 'Tessa Reyes','9964718-3'),
(108, 'Daniel Sanchez','3201872-6'),
(109, 'Carol Pinto','7411182-7'),
(110, 'Yahir Perez','3001799-8'),
(111, 'Carlos Monterroso','2124578-3'),
(112, 'Jacqui Aldana','6444712-8'),
(113, 'Oscar Cruz','5555417-9'),
(114, 'Hernesto Paz','3781426-7'),
(115, 'Lili Morales','5656278-1'),
(116, 'Carla Gonzalez','3126457-2'),
(117, 'Tania Reyes','4447571-2'),
(118, 'Daniel Orozco','2581476-3'),
(119, 'Karen Pinto','3179246-5'),
(120, 'Byron Perez','3060402-8'),
(121, 'David Ruiz','2154783-9'),
(122, 'Fernanda Monterroso','7411478-2'),
(123, 'Jack Aldana','3699632-8'),
(124, 'Samanta Cruz','1236547-5'),
(125, 'Sofia Paz','3777894-7'),
(126, 'André Morales','8522587-9'),
(127, 'Camilo Gonzalez','4566547-8'),
(128, 'Tamara Reyes','7533571-8'),
(129, 'Daniela Hernández','1599512-4'),
(130, 'Brian Perez','3338446-1');

INSERT INTO Ventas1 (producto_id, cliente_id, cantidad,fecha) VALUES
(001, 101, 1, '2023-01-01'),
(016, 102, 4, '2023-01-15'),
(021, 111, 1, '2023-01-30'),
(002, 102, 1, '2023-02-15'),
(012, 124, 3, '2023-02-28'),
(009, 105, 2, '2023-03-01'),
(006, 104, 1, '2023-03-15'),
(025, 118, 10, '2023-03-30'),
(010, 122, 2, '2023-03-30'),
(008, 128, 1, '2023-04-01'),
(015, 130, 2, '2023-04-15'),
(010, 112, 1, '2023-04-30'),
(021, 111, 1, '2023-05-01'),
(002, 102, 1, '2023-05-15'),
(012, 124, 3, '2023-05-28'),
(009, 105, 2, '2023-06-01'),
(006, 104, 1, '2023-06-15'),
(025, 118, 10, '2023-06-30'),
(010, 122, 2, '2023-06-30'),
(008, 128, 1, '2023-07-01'),
(001, 101, 1, '2023-07-15'),
(002, 102, 1, '2023-07-30'),
(003, 103, 2, '2023-07-31'),
(004, 104, 1, '2023-08-18'),
(005, 105, 1, '2023-08-19'),
(006, 106, 1, '2023-08-20'),
(007, 107, 1, '2023-09-01'),
(008, 108, 1, '2023-09-15'),
(009, 109, 2, '2023-09-23'),
(010, 110, 1, '2023-09-30'),
(011, 111, 1, '2023-10-01'),
(012, 112, 1, '2023-10-05'),
(013, 113, 3, '2023-10-27'),
(014, 114, 2, '2023-10-28'),
(015, 115, 1, '2023-10-29'),
(016, 116, 2, '2023-10-30'),
(017, 117, 1, '2023-11-01'),
(018, 118, 1, '2023-11-15'),
(019, 119, 1, '2023-11-20'),
(020, 120, 2, '2023-11-30'),
(021, 121, 1, '2023-12-04'),
(022, 122, 1, '2023-12-05'),
(023, 123, 1, '2023-12-06'),
(024, 124, 2, '2023-12-15'),
(025, 125, 1, '2023-12-18'),
(001, 126, 1, '2023-12-23'),
(002, 127, 2, '2023-12-24'),
(003, 128, 1, '2023-12-24'),
(004, 129, 1, '2023-12-30'),
(005, 130, 1, '2023-12-30'),
(006, 101, 1, '2023-12-31'),
(007, 102, 1, '2024-01-15'),
(008, 103, 1, '2024-01-16'),
(009, 104, 1, '2024-02-17'),
(010, 105, 1, '2024-02-18'),
(011, 106, 1, '2024-02-29'),
(012, 107, 1, '2024-03-02'),
(013, 108, 2, '2024-03-21'),
(014, 109, 1, '2024-03-22'),
(015, 110, 2, '2024-04-23'),
(016, 111, 1, '2024-04-24'),
(017, 112, 1, '2024-04-25'),
(018, 113, 1, '2024-05-16'),
(019, 114, 2, '2024-05-27'),
(020, 115, 3, '2024-05-28'),
(021, 116, 1, '2024-06-01'),
(022, 117, 2, '2024-06-22'),
(009, 118, 1, '2024-07-01'),
(010, 119, 1, '2024-07-02'),
(011, 120, 1, '2024-07-05'),
(012, 121, 1, '2024-07-07'),
(014, 129, 1, '2023-12-09'),
(015, 130, 1, '2023-12-10'),
(016, 101, 1, '2023-12-11'),
(017, 102, 1, '2024-01-15'),
(018, 103, 1, '2024-01-26'),
(019, 104, 1, '2024-02-27'),
(020, 105, 1, '2024-02-28'),
(021, 106, 1, '2024-02-29');

--CONSULTAS 
--a. Obtener el precio promedio de los productos de la categoría "Electrónica".
SELECT  ROUND( AVG(p.precio ),2) as precio_promedio
FROM Productos_ p
JOIN Categorias c
ON p.categoria_id=c.id
WHERE c.categoria = 'Electrónica';

--b. Mostrar los 10 productos con mayor cantidad de ventas en el último mes.
SELECT p.nombre as Producto,
    SUM(v.cantidad) as total_vendido
FROM Ventas1 v
JOIN Productos_ p ON v.producto_id = p.id
WHERE v.fecha >= CURRENT_DATE - INTERVAL '1 month'
GROUP BY p.nombre
ORDER BY total_vendido DESC
LIMIT 10;

--c. Calcular el ingreso total por ventas de cada cliente en el año 2023.
SELECT
    EXTRACT(YEAR FROM v.fecha) as anio_venta,
    c.nombre as Cliente,
    SUM(p.precio * v.cantidad) as ingreso_total
FROM Ventas1 v
JOIN Productos_ p ON v.producto_id = p.id
JOIN Clientes c ON v.cliente_id = c.id
WHERE EXTRACT(YEAR FROM v.fecha) = 2023
GROUP BY EXTRACT(YEAR FROM v.fecha), c.nombre

--d. Obtener ventas totales por trimestres
SELECT
    EXTRACT(YEAR FROM v.fecha) as anio_venta,
    EXTRACT(QUARTER FROM v.fecha) as venta_trimestre,
    SUM(v.cantidad * p.precio) as ventas_totales
FROM  Ventas1 v
JOIN Productos_ p
ON v.producto_id = p.id
GROUP BY 
    EXTRACT(YEAR FROM v.fecha),
    EXTRACT(QUARTER FROM v.fecha);


--e.  Comparacion Venta de dos productos mes a mes

SELECT 
    p.nombre AS producto,
    EXTRACT(YEAR FROM v.fecha) AS anio,
    EXTRACT(MONTH FROM v.fecha) AS mes,
    SUM(p.precio * v.cantidad) AS ventas_totales
FROM public.Ventas1 v
JOIN Productos_ p
ON  p.id = v.producto_id
WHERE  p.nombre IN ('Protector solar', 'Sombras')
GROUP BY 
	p.nombre, 
    EXTRACT(YEAR FROM v.fecha), 
    EXTRACT(MONTH FROM v.fecha)
ORDER BY 
    anio, mes, p.nombre;

--f. modificar dato que se escribio mal
UPDATE Productos_
SET nombre = 'Protector solar'
WHERE nombre = 'Protectot solar';

SELECT * FROM Productos_