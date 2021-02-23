import de.bezier.data.sql.*;

void writeDatabase () {

  String query ="INSERT INTO Functions";
  db.query(query);
}

void getFunctions() {

  String query = "SELECT * FROM Functions";
  db.query(query);
}
