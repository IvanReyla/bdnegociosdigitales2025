Create database tienda1;
use tienda1;
#SQL LDD EL LENGUAJE

create table categoria(
categoriaid int not null,
nombre varchar(20) not null,
constraint pk_tienda1
primary key(categoriaid),
constraint unico_nombre
unique(nombre)
);

#SQL LMD AGREGAR REGISTROS A LA TABLA CATEGORIA

insert into categoria
values(1, 'CARNES FRIAS');



insert into categoria(categoriaid,nombre)
values(2, 'Linea Blanca');

insert into categoria(nombre,categoriaid)
values('Vinos y licores',3);

insert into categoria
values(4,'ropa'),
      (5,'Dulces'),
      (6,'Lacteos');
      

insert into categoria(nombre,categoriaid)
values ('Panaderia',7),
	   ('Calzado',8),
        ('Jugueteria',9);
        
