import de.bezier.data.sql.*;

void writeDatabase () {

  String query ="INSERT INTO Functions";
  db.query(query);
}

void writeDatabase(Func theFunction) {

  String query ="INSERT INTO Functions (Functions) VALUES ('%s')";
  query=String.format(query, theFunction.toString());
  db.query(query);
}

void getFunctions() {

  String query = "SELECT * FROM Functions";
  db.query(query);
  while (db.next()) {
    String functions = db.getString("Functions");
    funcs.add(conver.convert(functions)); 
    
    
  }
}
