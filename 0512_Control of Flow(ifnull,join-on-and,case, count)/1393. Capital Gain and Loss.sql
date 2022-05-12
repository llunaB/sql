select stock_name,sum(
    case
        when operation = 'Buy' then -price
        else price
    end
) as capital_gain_loss
from stocks
group by stock_name

#######################################
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;
#######################################

SELECT stock_name, SUM(
    CASE
        WHEN operation = 'Buy' THEN -price
        ELSE price
    END
) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name