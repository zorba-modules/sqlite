import module namespace s = "http://www.zorba-xquery.com/modules/sqlite";
import module namespace f = "http://expath.org/ns/file";

let $path := f:path-to-native(resolve-uri("./"))
let $db := s:connect(concat($path, "small2.db"))
let $isconn := s:is-connected($db)
let $result := s:execute-query($db, "select * from smalltable")
let $old-db := s:disconnect($db)

return ($result, $isconn)