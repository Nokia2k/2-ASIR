CREATE OR REPLACE TRIGGER tr_ins_medicamento_sintoma
AFTER INSERT ON t_medicamento_sintoma
FOR EACH ROW
DECLARE
    v_medicamento t_medicamento.nombre%TYPE;
    v_sintoma t_sintoma.descripcion%TYPE;
BEGIN
    -- Obtener el nombre del medicamento
    SELECT m.nombre
    INTO v_medicamento
    FROM t_medicamento m
    INNER JOIN t_medicamento_sintoma ms ON m.id_medicamento = ms.id_medicamento
    WHERE ms.id_medicamento = :NEW.id_medicamento
    AND ROWNUM = 1; -- Utilizar ROWNUM para obtener solo un registro

    -- Obtener la descripción del síntoma
    SELECT s.descripcion
    INTO v_sintoma
    FROM t_sintoma s
    INNER JOIN t_medicamento_sintoma ms ON s.id_sintoma = ms.id_sintoma
    WHERE ms.id_sintoma = :NEW.id_sintoma
    AND ROWNUM = 1; -- Utilizar ROWNUM para obtener solo un registro

    -- Insertar en t_control_medicamentos
    INSERT INTO t_control_medicamentos (valor)
    VALUES (v_medicamento || v_sintoma || :NEW.dosis_diaria || TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI'));
END;
/
