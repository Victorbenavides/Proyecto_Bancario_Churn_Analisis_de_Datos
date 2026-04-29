# Analisis de Retencion y Riesgo Crediticio de Clientes Bancarios

## El Problema
En el sector bancario, es mucho mas costoso adquirir un cliente nuevo que mantener a uno actual. Este proyecto busca resolver el problema de la fuga de clientes (churn) analizando una base de datos historica de 115,640 registros. 

El objetivo principal no es solo saber cuantos clientes se fueron, sino entender por que se van y crear un sistema de alertas para identificar que clientes activos estan en riesgo de cancelar sus cuentas, permitiendo al banco actuar de manera preventiva.

## El Proceso

Para procesar este volumen de datos y extraer informacion util, el proyecto se dividio en tres fases principales:

### 1. Ingesta y Exploracion de Datos (SQL)
Se migro la base de datos plana a un servidor relacional usando PostgreSQL. Mediante consultas SQL, se realizo un analisis exploratorio para entender la distribucion de los datos, promedios de ingresos, saldos y tasas base de abandono.

![Exploracion de Datos en pgAdmin](Script_01.png)

### 2. Transformacion y Reglas de Negocio (SQL)
No se trabajo con los datos crudos. Se desarrollo codigo SQL avanzado (creacion de vistas y sentencias condicionales) para calcular nuevas metricas y segmentar a los clientes en tres rubros clave:
- Nivel de Riesgo Crediticio (Excelente, Bueno, Regular, Alto Riesgo).
- Segmento de Valor (VIP, Estandar, Bajo Valor).
- Alerta de Retencion (Cliente Estable, Riesgo Moderado, Riesgo Critico).

![Transformacion y Segmentacion ETL](Script_02.png)

### 3. Visualizacion para Toma de Decisiones (Power BI)
La base de datos procesada se conecto directamente a Power BI. Se construyo un dashboard gerencial que traduce las reglas de negocio en graficas claras. Esto permite filtrar la cartera por variables demograficas y detectar de inmediato los focos rojos de la operacion.

![Dashboard de Riesgo y Retencion](dashboard.png)

## Resultados Principales

Al analizar la informacion estructurada, se encontraron los siguientes puntos clave:
- El banco presenta una perdida historica de 14,094 clientes.
- Existe una relacion directa entre el numero de quejas y la fuga de clientes. El segmento clasificado con riesgo critico (clientes con quejas recurrentes) concentra la mayor probabilidad de abandono.
- El nivel de riesgo crediticio es un factor determinante: los clientes con peores historiales son los primeros en abandonar la institucion.
- El segmento VIP, aunque representa el mayor valor economico para el banco, muestra estabilidad pero requiere monitoreo para evitar caidas en su transaccionalidad.

## Recomendaciones para el Negocio

En base a los datos obtenidos, se sugieren las siguientes acciones operativas:
1. Contactar de manera proactiva e inmediata a los clientes etiquetados en "Riesgo Critico" para ofrecer soluciones antes de que decidan cerrar sus cuentas.
2. Implementar un protocolo de atencion automatica y prioritaria para cualquier cliente del segmento VIP desde el momento en que registre su primera queja.
3. Monitorear este panel de manera mensual para evaluar si la tasa de abandono disminuye despues de aplicar las llamadas de retencion.

---
**Tecnologias utilizadas:** PostgreSQL, SQL (ETL, Views, Case When), Power BI.
**Autor:** Victor Hugo Benavides Iracheta
