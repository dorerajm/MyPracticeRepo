-- Scenario 1: Apply 1% discount to customers above 60 years old
BEGIN
    FOR customer_rec IN (SELECT CustomerID, Age, LoanInterestRate FROM Customers) LOOP
        IF customer_rec.Age > 60 THEN
            UPDATE Customers
            SET LoanInterestRate = LoanInterestRate - 1
            WHERE CustomerID = customer_rec.CustomerID;
        END IF;
    END LOOP;
    COMMIT;
END;
/