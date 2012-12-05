import module namespace s = "http://www.zorba-xquery.com/modules/sqlite";
import module namespace f = "http://expath.org/ns/file";

let $path := f:path-to-native(resolve-uri("./"))
let $db := s:connect(concat($path, "small2.db"))
let $prep-statement := s:prepare-statement($db, "SELECT * FROM smalltable")
let $meta := s:metadata($prep-statement)
let $result := s:execute-query-prepared($prep-statement)
let $old-db := s:disconnect($db)

return (for $e in $meta
return concat($e("Database"), ":", $e("Table"), ":", $e("Column Name"), " = ", $e("Declared Type"), "; ")
,
for $e in $result
return $e)