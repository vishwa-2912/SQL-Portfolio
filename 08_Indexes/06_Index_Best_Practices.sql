/*
=========================================
INDEX BEST PRACTICES
=========================================

1. Create indexes on columns used in:
   - WHERE
   - JOIN
   - ORDER BY
   - GROUP BY

2. Avoid indexing every column.

3. Primary Keys are automatically indexed.

4. Foreign Keys are good candidates for indexes.

5. Too many indexes slow down:
   - INSERT
   - UPDATE
   - DELETE

6. Always test performance before adding indexes.
*/
