package admin.model.util;

public class CreateQuery {
	public CreateQuery() {}

	public String makeDeleteQuery(String[] bnoArr) {
		String query = " ( ";
		for ( int i = 0 ; i < bnoArr.length ; i++ ) {
			query += bnoArr[i];
			query += i == bnoArr.length-1 ? "" : " , "; 
		}
		query += " ) ";
		return query;
	}
	
}
