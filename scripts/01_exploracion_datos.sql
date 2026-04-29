SELECT 
    COUNT("CustomerId") AS total_clientes,
    ROUND(AVG("Income"), 2) AS ingreso_promedio,
    ROUND(AVG("Balance"), 2) AS saldo_promedio,
    ROUND(AVG("Credit Score"), 0) AS score_crediticio_promedio,
    MIN("Income") AS ingreso_minimo,
    MAX("Income") AS ingreso_maximo
FROM bank_customers;

SELECT 
    "Churn Flag",
    COUNT("CustomerId") AS total_clientes,
    ROUND(COUNT("CustomerId") * 100.0 / (SELECT COUNT(*) FROM bank_customers), 2) AS porcentaje_total
FROM bank_customers
GROUP BY "Churn Flag";

SELECT 
    "Churn Flag",
    ROUND(AVG("Credit Score"), 0) AS score_promedio,
    ROUND(AVG("Balance"), 2) AS saldo_promedio,
    ROUND(AVG("Outstanding Loans"), 2) AS deuda_promedio_prestamos,
    ROUND(AVG("NumComplaints"), 1) AS quejas_promedio
FROM bank_customers
GROUP BY "Churn Flag"
ORDER BY "Churn Flag" DESC;