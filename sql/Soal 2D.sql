SELECT b.id, b.judul
FROM order_details od
RIGHT JOIN books b ON od.book_id = b.id
WHERE od.id is NULL;

SELECT m.id, m.nama, o.denda
FROM orders o
JOIN members m ON o.member_id = m.id
WHERE o.denda != 0;

SELECT DENSE_RANK() OVER(ORDER BY m.id ASC) AS "No", 
m.nama as "Member",
GROUP_CONCAT(b.judul
			ORDER BY b.id ASC
            SEPARATOR ', ' 
            ) as "Judul Buku"
FROM members m
JOIN orders o ON o.member_id = m.id
JOIN order_details od ON od.order_id = o.id
JOIN books b ON od.book_id = b.id
GROUP BY m.id, m.nama;