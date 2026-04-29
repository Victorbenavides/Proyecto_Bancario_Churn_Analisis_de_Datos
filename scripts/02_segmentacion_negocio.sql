CREATE OR REPLACE VIEW vw_segmentacion_clientes AS
SELECT 
    "CustomerId",
    "Gender",
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, "Date of Birth")) AS "Edad",
    "Customer Tenure" AS "Antiguedad_Meses",
    "Income" AS "Ingresos",
    "Balance" AS "Saldo_Cuenta",
    "Credit Score" AS "Puntaje_Credito",
    "Outstanding Loans" AS "Deuda_Pendiente",
    "NumComplaints" AS "Numero_Quejas",
    "Churn Flag",
    "Churn Reason",
    
    -- 1. Segmentación por Riesgo Crediticio
    CASE 
        WHEN "Credit Score" >= 750 THEN 'Excelente'
        WHEN "Credit Score" >= 650 THEN 'Bueno'
        WHEN "Credit Score" >= 550 THEN 'Regular'
        ELSE 'Alto Riesgo'
    END AS "Nivel_Riesgo",
    
    -- 2. Segmentación por Valor del Cliente
    CASE 
        WHEN "Balance" >= 150000 AND "Income" >= 80000 THEN 'Cliente VIP'
        WHEN "Balance" >= 50000 THEN 'Cliente Estándar'
        ELSE 'Cliente Bajo Valor'
    END AS "Segmento_Valor",
    
    -- 3. Alerta Temprana de Abandono (Proactivo)
    CASE
        WHEN "Churn Flag" = 1 THEN 'Ya abandonó'
        WHEN "Churn Flag" = 0 AND "NumComplaints" >= 3 THEN 'Riesgo Crítico de Fuga'
        WHEN "Churn Flag" = 0 AND "NumComplaints" > 0 THEN 'Riesgo Moderado'
        ELSE 'Cliente Estable'
    END AS "Alerta_Retencion"

FROM bank_customers;