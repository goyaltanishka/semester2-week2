-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 library.db
-- 2. Load this script: .read code.sql
-- 3. Exit SQLite: .exit


-- write your sql code here
SELECT title,name,loan_date FROM Loans JOIN Books ON Loans.book_id=Books.id JOIN Members ON Loans.member_id=Members.id;
SELECT Books.title, Loans.id FROM Books LEFT JOIN Loans ON Books.id=Loans.book_id;
SELECT LibraryBranch.name,Books.title FROM LibraryBranch LEFT JOIN Books ON LibraryBranch.id=Books.branch_id;
SELECT LibraryBranch.name, COUNT(Books.id) FROM LibraryBranch LEFT JOIN Books ON LibraryBranch.id=Books.branch_id
GROUP BY LibraryBranch.name;
SELECT LibraryBranch.name,COUNT(Books.id) FROM LibraryBranch JOIN Books ON Books.branch_id=LibraryBranch.id GROUP BY LibraryBranch.name HAVING COUNT(Books.id)>7; 
SELECT Members.name,COUNT(Loans.id) FROM Members LEFT JOIN Loans ON Members.id=Loans.member_id GROUP BY Members.name HAVING COUNT(Loans.id)=0;
SELECT Members.name,COUNT(Loans.id) FROM Members LEFT JOIN Loans ON Members.id=Loans.member_id GROUP BY Members.name;
SELECT LibraryBranch.name,COUNT(Books.id),COUNT(Loans.id) FROM LibraryBranch LEFT JOIN Books ON Books.branch_id=LibraryBranch.id LEFT JOIN Loans ON Loans.book_id=Books.id  GROUP BY LibraryBranch.name;
SELECT Members.name,Loans.return_date FROM Members JOIN Loans ON Members.id=Loans.member_id WHERE Loans.return_date is NULL;