

# Primer TRIGGER


## Código SQL 

```sql
use bdejemplo2;

-- Realizar un trigger que se dispare
-- cuando se elimine un pedido y modifique
-- el stock  de los productos , 
-- con la cantidad eliminada y agrega un try catch

Select * from pedidos
go

create or alter trigger tg_pedidos_insertar
on pedidos
after insert 
as
begin

declare @existencia int
declare @fab char(3)
declare @prod char(5)
declare @cantidad int

select @fab = fab, @prod = producto, 
@cantidad = cantidad 
from inserted;

select @existencia = stock from Productos
where Id_fab = @fab and Id_producto = @prod;

if @existencia > (select cantidad from inserted)
begin 
 update Productos
 set stock = stock - @cantidad
 where Id_fab = @fab and
       Id_producto = @prod;
end
else
begin 
    raiserror('No hay suficiente stock para el pedido', 16,1)
	rollback;
end
end;

select * from pedidos
select max(Num_Pedido) from Pedidos
select * from Productos

declare @importe money
select @importe = (p.Cantidad * pr.Precio)
from Pedidos as p
inner join Productos as pr
on p.Fab = pr.Id_fab 
and p.Producto = pr.Id_producto

insert into pedidos (Num_Pedido, Fecha_Pedido, cliente, 
Rep, Fab, Producto, Cantidad, importe)
values(113071, getdate(), 2103, 106, 'ACI', '41001', 77, @importe)

SELECT * FROM Productos
WHERE Id_fab= 'ACI'
AND Id_producto = '41001'
Aci, 41001 277



CREATE OR ALTER TRIGGER tg_pedidos_eliminar
ON pedidos
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @existencia INT;
    DECLARE @fab CHAR(3);
    DECLARE @prod CHAR(5);
    DECLARE @cantidad INT;

    BEGIN TRY
        SELECT @fab = fab, 
               @prod = producto, 
               @cantidad = cantidad 
        FROM deleted;

        SELECT @existencia = stock 
        FROM Productos
        WHERE Id_fab = @fab 
          AND Id_producto = @prod;

        IF @existencia IS NOT NULL
        BEGIN
ç            UPDATE Productos
            SET stock = stock + @cantidad
            WHERE Id_fab = @fab 
              AND Id_producto = @prod;
        END
        ELSE
        BEGIN
            RAISERROR('Error: Producto no encontrado en el stock', 16, 1);
            ROLLBACK;
        END
    END TRY
    BEGIN CATCH
        
        PRINT 'Se ha producido un error al actualizar el stock.';
        PRINT ERROR_MESSAGE();
        ROLLBACK;
    END CATCH;
END;
