-- Scenario 3: Send reminders for loans due within next 30 days
DECLARE
    v_due_date DATE := SYSDATE + 30;
BEGIN
    FOR loan_rec IN (SELECT CustomerID, LoanID, DueDate FROM Loans WHERE DueDate <= v_due_date) LOOP
        DBMS_OUTPUT.PUT_LINE('Reminder: Customer ' || loan_rec.CustomerID || 
                             ', your loan ' || loan_rec.LoanID || 
                             ' is due on ' || TO_CHAR(loan_rec.DueDate, 'DD-MON-YYYY'));
    END LOOP;
END;
/