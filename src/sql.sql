DELIMITER $$

CREATE PROCEDURE ComplexTransaction()
BEGIN
    -- Desabilitar o autocommit
    SET autocommit = 0;
    
    -- Iniciar a transação
    START TRANSACTION;
    
    -- Definir um SAVEPOINT
    SAVEPOINT sp1;
    
    -- Tente executar a primeira operação
    TRY
        -- Insira seu SQL aqui
        INSERT INTO tabela1 (coluna1, coluna2) VALUES ('valor1', 'valor2');
    CATCH
        -- Se houver um erro, faça o rollback para o SAVEPOINT
        ROLLBACK TO sp1;
    END;
    
    -- Definir um novo SAVEPOINT
    SAVEPOINT sp2;
    
    -- Tente executar a segunda operação
    TRY
        -- Insira seu SQL aqui
        UPDATE tabela2 SET coluna3 = 'valor3' WHERE coluna4 = 'valor4';
    CATCH
        -- Se houver um erro, faça o rollback para o SAVEPOINT
        ROLLBACK TO sp2;
    END;
    
    -- Se tudo ocorrer bem, confirme a transação
    COMMIT;
END$$

DELIMITER ;
